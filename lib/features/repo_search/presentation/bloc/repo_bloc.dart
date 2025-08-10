import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repository_explorer/features/repo_search/presentation/bloc/repo_state.dart';
import '../../domain/entities/repo_entity.dart';
import '../../domain/usecases/get_repos_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../domain/failures/failure.dart';

part 'repo_event.dart';

class RepoBloc extends Bloc<RepoEvent, RepoState> {
  final GetReposUseCase getReposUseCase;
  final int _perPage = 100;
  List<RepoEntity> _repos = [];

  RepoBloc(this.getReposUseCase) : super(RepoInitial()) {
    on<FetchReposEvent>((event, emit) async {
      if (!event.append) {
        _repos = [];
        emit(RepoLoading());
      }

      final Either<Failure, List<RepoEntity>> failureOrRepos = await getReposUseCase(
        page: event.page,
        perPage: _perPage,
      );

      failureOrRepos.fold(
            (failure) => emit(RepoError(_mapFailureToMessage(failure))),
            (newRepos) {
          _repos = event.append ? [..._repos, ...newRepos] : newRepos;
          final hasMore = newRepos.length == _perPage;
          emit(RepoLoaded(repos: _repos, hasMore: hasMore));
        },
      );
    });
  }

  String _mapFailureToMessage(Failure failure) {
    // Customize error messages based on failure type if you want
    return failure.message ?? 'Unexpected error occurred';
  }
}
