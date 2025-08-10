import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../../features/repo_search/data/datasources/github_remote_data_source.dart';
import '../../features/repo_search/data/models/repo_model.dart';
import '../../features/repo_search/data/repositories/repo_repository_impl.dart';
import '../../features/repo_search/domain/repositories/repo_repository.dart';
import '../../features/repo_search/domain/usecases/get_repos_usecase.dart';
import '../../features/repo_search/presentation/bloc/repo_bloc.dart';

final sl = GetIt.instance;


Future<void> initDependencies() async {
  // Initialize Hive Flutter
  await Hive.initFlutter();

  // Register Hive Adapter
  Hive.registerAdapter(RepoModelAdapter());

  // Open Hive Box before registering it
  final box = await Hive.openBox<RepoModel>('reposBox');

  // Register Dio
  sl.registerLazySingleton(() => Dio(BaseOptions(baseUrl: 'https://api.github.com')));

  // Register Remote Data Source
  sl.registerLazySingleton(() => GithubRemoteDataSource(sl()));

  // Register Box<RepoModel>
  sl.registerLazySingleton<Box<RepoModel>>(() => box);

  // Register RepoRepositoryImpl with its dependencies from GetIt
  try {
    sl.registerLazySingleton<RepoRepository>(() => RepoRepositoryImpl(sl(), sl()));
  } catch (e, st) {
    print('Error while creating RepoRepository: $e');
    print(st);
    rethrow;
  }

  // Register Use Case with injected Repository
  sl.registerLazySingleton(() => GetReposUseCase(sl()));

  // Register Bloc with injected Use Case
  sl.registerFactory(() => RepoBloc(sl()));
}

