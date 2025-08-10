import 'package:dio/dio.dart';
import '../../../../app/core/error/failures.dart';
import '../models/repo_dto.dart';

abstract class GithubRemoteDataSource {
  Future<List<RepoDto>> search({required String query, required int page, int perPage = 20});
}

class GithubRemoteDataSourceImpl implements GithubRemoteDataSource {
  final Dio _dio;
  GithubRemoteDataSourceImpl(this._dio);

  @override
  Future<List<RepoDto>> search({
    required String query,
    required int page,
    int perPage = 20,
  }) async {
    try {
      final res = await _dio.get('/search/repositories', queryParameters: {
        'q': query,
        'sort': 'stars',
        'order': 'desc',
        'per_page': perPage,
        'page': page,
      });
      final items = (res.data['items'] as List).cast<Map<String, dynamic>>();
      return items.map(RepoDto.fromJson).toList();
    } on DioException catch (e) {
      final code = e.response?.statusCode;
      final apiMsg = (e.response?.data is Map && e.response?.data['message'] is String)
          ? e.response!.data['message'] as String
          : e.message ?? 'Server error';

      // Rate limit handling
      final remaining = e.response?.headers.value('x-ratelimit-remaining');
      if (code == 403 && remaining == '0') {
        throw const ServerFailure('GitHub rate limit exceeded. Add a token or try later.');
      }

      if (code != null) {
        if (code >= 500) throw ServerFailure('HTTP $code: $apiMsg');
        // 4xx
        throw ServerFailure('HTTP $code: $apiMsg');
      }
      throw ServerFailure(apiMsg);
    }
  }
}

