import 'package:dartz/dartz.dart';

import 'package:github_repository_explorer/features/repo_search/domain/failures/failure.dart';

import '../entities/repo_entity.dart';
import '../repositories/repo_repository.dart';

class GetReposUseCase {
  final RepoRepository repository;

  GetReposUseCase(this.repository);

  Future<Either<Failure, List<RepoEntity>>> call({required int page, int perPage = 100}) {
    return repository.getRepos(page: page, perPage: perPage);
  }
}

