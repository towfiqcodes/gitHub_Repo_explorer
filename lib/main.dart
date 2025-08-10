// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_explorer_clean_architecture/app/connectivity/connectivity_banner.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:github_explorer_clean_architecture/app/theme/app_theme.dart';
import 'app/di/injector.dart';
import 'app/theme/bloc/theme_cubit.dart';
import 'app/connectivity/connectivity_cubit.dart'; // <-- add
import 'features/repo_search/presentation/bloc/repo_bloc.dart';
import 'features/repo_search/domain/usecases/search_repos.dart';
import 'features/repo_search/presentation/pages/repo_list_page.dart';
import 'features/repo_search/presentation/pages/repo_detail_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => RepoBloc(sl<SearchRepos>())),
      BlocProvider(create: (_) => ThemeCubit()),
      BlocProvider(create: (_) => ConnectivityCubit()), // <-- add
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, mode) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: mode,
          theme: AppThemeData().lightTheme,
          darkTheme: AppThemeData().darkTheme,
          //Global offline banner overlay
          builder: (context, child) {
            return Stack(
              children: [
                child ?? const SizedBox.shrink(),
                const Align(
                  alignment: Alignment.topCenter,
                  child: ConnectivityBanner(),
                ),
              ],
            );
          },
          routes: {
            '/': (_) => const RepoListPage(),
            '/detail': (_) => const RepoDetailPage(),
          },
        );
      },
    );
  }
}
