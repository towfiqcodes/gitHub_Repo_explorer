// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'core/service/repo_service_locator.dart';
import 'features/repo_search/data/models/repo_model.dart';
import 'features/repo_search/presentation/bloc/repo_bloc.dart';
import 'features/repo_search/presentation/pages/repo_list_page.dart';


void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  // Open Hive box and register DI dependencies
  await initDependencies();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => sl<RepoBloc>(),
        child:  RepoListPage(),
      ),
    );
  }
}
