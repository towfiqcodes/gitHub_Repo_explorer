import '../../data/models/repo_dto.dart';
abstract class RepoRepository {
  /// Returns (data, isFromCache)
  Future<(List<RepoDto>, bool)> search({required String query, required int page, int perPage});
}