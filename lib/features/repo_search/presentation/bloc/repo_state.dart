// repo_state.dart

import '../../domain/entities/repo_entity.dart';

abstract class RepoState {}

class RepoInitial extends RepoState {}

class RepoLoading extends RepoState {}

class RepoLoaded extends RepoState {
  final List<RepoEntity> repos;
  final bool hasMore;

  RepoLoaded({required this.repos, required this.hasMore});
}

class RepoError extends RepoState {
  final String message;
  RepoError(this.message);
}

