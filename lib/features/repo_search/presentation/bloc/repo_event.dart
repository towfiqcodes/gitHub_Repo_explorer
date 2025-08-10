part of 'repo_bloc.dart';

abstract class RepoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RepoQueryChanged extends RepoEvent {
  final String query;

  RepoQueryChanged(this.query);
}

class RepoNextPageRequested extends RepoEvent {}

class RepoRefreshRequested extends RepoEvent {}



class RepoRetryRequested extends RepoEvent {}