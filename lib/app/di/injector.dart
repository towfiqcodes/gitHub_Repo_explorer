import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../features/repo_search/data/datasources/github_local_data_source.dart';
import '../../features/repo_search/data/datasources/github_remote_data_source.dart';
import '../../features/repo_search/data/repositories/repo_repository_impl.dart';
import '../../features/repo_search/domain/repositories/repo_repository.dart';
import '../../features/repo_search/domain/usecases/search_repos.dart';
import '../core/network/network_info.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Dio
// in injector.dart
  final dio = Dio(BaseOptions(baseUrl: 'https://api.github.com'))
    ..interceptors.add(InterceptorsWrapper(onRequest: (o, h) {
      o.headers['Accept'] = 'application/vnd.github+json';

      const defineToken = String.fromEnvironment('GITHUB_TOKEN');
      const token = defineToken ;

      if (token.isNotEmpty) {
        o.headers['Authorization'] = 'Bearer $token';
      }
      return h.next(o);
    }));

  sl.registerLazySingleton(() => dio);

  // Connectivity
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton(() => NetworkInfo(sl()));

  // Hive (init in main before runApp)
  sl.registerLazySingleton<GithubLocalDataSource>(() => GithubLocalDataSourceImpl());

  // Remote DS
  sl.registerLazySingleton<GithubRemoteDataSource>(() => GithubRemoteDataSourceImpl(sl()));

  // Repository
  sl.registerLazySingleton<RepoRepository>(() => RepoRepositoryImpl(
    remote: sl(), local: sl(), networkInfo: sl(),
  ));

  // Use cases
  sl.registerFactory(() => SearchRepos(sl()));
}