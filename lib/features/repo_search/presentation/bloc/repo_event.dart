// repo_event.dart
part of 'repo_bloc.dart';

abstract class RepoEvent {}

class FetchReposEvent extends RepoEvent {
  final int page;
  final bool append;

  FetchReposEvent({required this.page, this.append = false});
}

