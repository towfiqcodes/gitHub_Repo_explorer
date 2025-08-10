import '../entities/repo_entity.dart';
import '../failures/failure.dart';
import 'package:dartz/dartz.dart';

abstract class RepoRepository {
  Future<Either<Failure, List<RepoEntity>>> getRepos({
    required int page,
    int perPage = 100,
  });}

