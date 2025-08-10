import 'package:flutter/material.dart';
import 'package:github_explorer_clean_architecture/features/repo_search/presentation/pages/widgets/custom_bar.dart';
import 'package:github_explorer_clean_architecture/features/repo_search/presentation/pages/widgets/repo_details_card.dart';
import '../../data/models/repo_dto.dart';

class RepoDetailPage extends StatelessWidget {
  const RepoDetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    final RepoDto repo = ModalRoute.of(context)!.settings.arguments as RepoDto;
    return Scaffold(
        appBar: const GlobalAppBar(title: 'Details'),
      body: RepoDetailCard(repo: repo),
    );
  }
}