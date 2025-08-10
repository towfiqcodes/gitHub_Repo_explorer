import '../../../../app/core/error/failures.dart';
import '../../../../app/core/network/network_info.dart';
import '../../domain/repositories/repo_repository.dart';
import '../datasources/github_local_data_source.dart';
import '../datasources/github_remote_data_source.dart';
import '../models/repo_dto.dart';


class RepoRepositoryImpl implements RepoRepository {
  final GithubRemoteDataSource remote;
  final GithubLocalDataSource local;
  final NetworkInfo networkInfo;
  RepoRepositoryImpl({required this.remote, required this.local, required this.networkInfo});

  String _key(String query,int page,int perPage) => '$query|$page|$perPage';

  @override
  Future<(List<RepoDto>, bool)> search({
    required String query,
    required int page,
    int perPage = 20,
  }) async {
    final cacheKey = _key(query, page, perPage);

    // If online, try remote first
    if (await networkInfo.isConnected) {
      try {
        final data = await remote.search(query: query, page: page, perPage: perPage);
        await local.cache(cacheKey, data);
        return (data, false); // fresh
      } catch (e) {
        // 1) Try cached page
        final cached = await local.read(cacheKey);
        if (cached != null) return (cached, true);

        // 2) If this was a next-page request, don't kill the list—just return empty
        if (page > 1) return (<RepoDto>[], true);

        // 3) First page and no cache: surface a readable server failure
        throw ServerFailure(
          e is Failure ? e.message : (e is Exception ? e.toString() : 'Server error'),
        );
      }
    }

    // Offline: serve cache if possible
    final cached = await local.read(cacheKey);
    if (cached != null) return (cached, true);

    // For next pages offline, keep existing list by returning empty
    if (page > 1) return (<RepoDto>[], true);

    throw const NetworkFailure('No internet connection');
  }
}