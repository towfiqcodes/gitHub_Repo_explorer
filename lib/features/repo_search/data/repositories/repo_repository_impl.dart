import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/repo_entity.dart';
import '../../domain/failures/failure.dart';
import '../../domain/repositories/repo_repository.dart';
import '../datasources/github_remote_data_source.dart';
import '../models/repo_model.dart';

class RepoRepositoryImpl implements RepoRepository {
  final GithubRemoteDataSource remoteDataSource;
  final Box<String> reposBox;  // Store JSON strings now

  RepoRepositoryImpl(this.remoteDataSource, this.reposBox);

  @override
  Future<Either<Failure, List<RepoEntity>>> getRepos({
    required int page,
    int perPage = 100,
  }) async {
    final cacheKey = page.toString();

    try {
      if (reposBox.containsKey(cacheKey)) {
        final cachedJson = reposBox.get(cacheKey);
        if (cachedJson != null && cachedJson.isNotEmpty) {
          // Decode JSON string to List<RepoModel>
          final List<dynamic> jsonList = jsonDecode(cachedJson);
          final cachedRepos = jsonList
              .map((json) => RepoModel.fromJson(json as Map<String, dynamic>))
              .toList();
          return Right(cachedRepos.cast<RepoEntity>());
        }
      }

      // Fetch from remote source
      final remoteRepos = await remoteDataSource.getRepos(page, perPage: perPage);

      // Convert models to JSON list
      final jsonList = remoteRepos.map((repo) => repo.toJson()).toList();
      final jsonString = jsonEncode(jsonList);

      // Cache the JSON string
      await reposBox.put(cacheKey, jsonString);

      return Right(remoteRepos.cast<RepoEntity>());
    } on ServerException {
      final cachedJson = reposBox.get(cacheKey);
      if (cachedJson != null && cachedJson.isNotEmpty) {
        final List<dynamic> jsonList = jsonDecode(cachedJson);
        final cachedRepos = jsonList
            .map((json) => RepoModel.fromJson(json as Map<String, dynamic>))
            .toList();
        return Right(cachedRepos.cast<RepoEntity>());
      }
      return Left(ServerFailure('Failed to fetch repos from server'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
