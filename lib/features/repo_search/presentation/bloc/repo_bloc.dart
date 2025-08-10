import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../app/core/error/failures.dart';
import '../../data/models/repo_dto.dart';
import '../../domain/usecases/search_repos.dart';

part 'repo_event.dart';

part 'repo_state.dart';

enum _LastAction { none, initialLoad, nextPage }

class RepoBloc extends Bloc<RepoEvent, RepoState> {
  final SearchRepos searchRepos;
  static const _pageSize = 20;

  String _query = 'flutter in:name';
  int _page = 1;
  bool _isCache = false;
  bool _end = false;
  List<RepoDto> _items = [];
  _LastAction _lastAction = _LastAction.none;

  RepoBloc(this.searchRepos) : super(const RepoState.initial()) {
    on<RepoQueryChanged>(_onQueryChanged, transformer: _debounce<RepoQueryChanged>());
    on<RepoNextPageRequested>(_onNextPageRequested);
    on<RepoRefreshRequested>(_onRefreshRequested);
    on<RepoRetryRequested>(_onRetryRequested);
  }

  // GENERIC DEBOUNCE (already added earlier)
  EventTransformer<E> _debounce<E>() {
    return (events, mapper) => events
        .debounceTime(const Duration(milliseconds: 350))
        .switchMap(mapper);
  }

  Future<void> _onQueryChanged(RepoQueryChanged e, Emitter<RepoState> emit) async {
    try {
      _query = e.query.isEmpty ? 'flutter in:name' : e.query;
      _page = 1; _end = false; _lastAction = _LastAction.initialLoad;
      emit(const RepoState.loading());

      final (data, fromCache) = await _retry(
            () => searchRepos(_query, _page, perPage: _pageSize),
        shouldRetry: _defaultShouldRetry,
      );

      _items = data; _isCache = fromCache;
      emit(RepoState.success(items: _items, fromCache: _isCache, canLoadMore: data.length == _pageSize));
    } catch (err) {
      emit(RepoState.failure(_humanize(err)));
    }
  }

  Future<void> _onNextPageRequested(RepoNextPageRequested e, Emitter<RepoState> emit) async {
    if (_end || state.loading || state.paging) return;
    try {
      _lastAction = _LastAction.nextPage;
      emit(RepoState.paging(items: _items, fromCache: _isCache));

      final nextPage = _page + 1;
      final (data, fromCache) = await _retry(
            () => searchRepos(_query, nextPage, perPage: _pageSize),
        shouldRetry: _defaultShouldRetry,
      );

      _page = nextPage;
      if (data.isEmpty) _end = true;
      _items = [..._items, ...data]; _isCache = fromCache;

      emit(RepoState.success(items: _items, fromCache: _isCache, canLoadMore: data.length == _pageSize));
    } catch (err) {
      emit(RepoState.failure(_humanize(err)));
    }
  }

  Future<void> _onRefreshRequested(RepoRefreshRequested e, Emitter<RepoState> emit) async {
    add(RepoQueryChanged(_query));
  }

  Future<void> _onRetryRequested(RepoRetryRequested e, Emitter<RepoState> emit) async {
    if (_lastAction == _LastAction.nextPage) {
      add(RepoNextPageRequested());
    } else {
      add(RepoQueryChanged(_query));
    }
  }

  // ---- Retry helper (exponential backoff) ----
  Future<T> _retry<T>(Future<T> Function() task, {
    int maxAttempts = 3,
    Duration initialDelay = const Duration(milliseconds: 500),
    bool Function(Object error)? shouldRetry,
  }) async {
    Object? lastError;
    var delay = initialDelay;
    for (var attempt = 1; attempt <= maxAttempts; attempt++) {
      try {
        return await task();
      } catch (e) {
        lastError = e;
        final ok = shouldRetry?.call(e) ?? true;
        if (attempt == maxAttempts || !ok) break;
        await Future.delayed(delay);
        delay *= 2; // exponential backoff
      }
    }
    // rethrow last error so Bloc can surface message
    throw lastError!;
  }

  bool _defaultShouldRetry(Object e) {
    // Do not retry on GitHub rate limit or 4xx errors surfaced as messages
    final msg = _humanize(e).toLowerCase();
    if (msg.contains('rate limit') || msg.startsWith('http 4')) return false;
    // Retry typical transient errors
    return msg.contains('timeout') ||
        msg.contains('connection') ||
        msg.contains('socket') ||
        msg.startsWith('http 5');
  }

  String _humanize(Object err) {
    if (err is Failure) return err.message;
    return err.toString();
  }}
