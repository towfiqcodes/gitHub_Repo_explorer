part of 'repo_bloc.dart';

class RepoState extends Equatable {
  final List<RepoDto> items;
  final bool fromCache;
  final bool loading;
  final bool paging;
  final bool canLoadMore;
  final String? error;

  const RepoState(
      {this.items = const [],
      this.fromCache = false,
      this.loading = false,
      this.paging = false,
      this.canLoadMore = false,
      this.error});

  const RepoState.initial() : this();

  const RepoState.loading() : this(loading: true);

  const RepoState.paging(
      {required List<RepoDto> items, required bool fromCache})
      : this(items: items, fromCache: fromCache, paging: true);

  const RepoState.success(
      {required List<RepoDto> items,
      required bool fromCache,
      required bool canLoadMore})
      : this(items: items, fromCache: fromCache, canLoadMore: canLoadMore);

  const RepoState.failure(String err) : this(error: err);

  @override
  List<Object?> get props =>
      [items, fromCache, loading, paging, canLoadMore, error];
}
