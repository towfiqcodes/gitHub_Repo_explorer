import 'package:dio/dio.dart';
import '../models/repo_model.dart';

class GithubRemoteDataSource {
  final Dio dio;

  GithubRemoteDataSource(this.dio);

  Future<List<RepoModel>> getRepos(int page, {int perPage = 100}) async {
    final response = await dio.get(
      '/search/repositories',
      queryParameters: {
        'q': 'flutter in:name',
        'sort': 'stars',
        'order': 'desc',
        'per_page': perPage,
        'page': page,
      },
    );

    final items = response.data['items'] as List;
    return items.map((json) => RepoModel.fromJson(json)).toList();
  }
}
