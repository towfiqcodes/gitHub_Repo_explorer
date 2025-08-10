import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_explorer_clean_architecture/features/repo_search/presentation/pages/widgets/custom_bar.dart';
import 'package:github_explorer_clean_architecture/features/repo_search/presentation/pages/widgets/repo_card.dart';
import 'package:github_explorer_clean_architecture/features/repo_search/presentation/pages/widgets/rounded_search_bar.dart';

import 'widgets/shimmer_placeholder.dart';
import '../bloc/repo_bloc.dart';

class RepoListPage extends StatefulWidget {
  const RepoListPage({super.key});

  @override
  State<RepoListPage> createState() => _RepoListPageState();
}

class _RepoListPageState extends State<RepoListPage> {
  final _controller = ScrollController();
  final _searchCtl = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<RepoBloc>().add(RepoQueryChanged('flutter in:name'));
    _controller.addListener(() {
      if (_controller.position.pixels >=
          _controller.position.maxScrollExtent - 200) {
        context.read<RepoBloc>().add(RepoNextPageRequested());
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _searchCtl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const GlobalAppBar(title: 'Repositories', automaticallyImplyLeading: false,),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
          child: RoundedSearchBar(
            controller: _searchCtl,
            hint: 'Search',
            onChanged: (v) => context.read<RepoBloc>().add(
                RepoQueryChanged(v.isEmpty ? 'flutter in:name' : '$v in:name')),
            onSubmitted: (v) => context.read<RepoBloc>().add(
                RepoQueryChanged(v.isEmpty ? 'flutter in:name' : '$v in:name')),
          ),
        ),
        Expanded(
          child: BlocBuilder<RepoBloc, RepoState>(
            builder: (context, state) {
              if (state.loading) {
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: 8,
                  itemBuilder: (_, __) => const RepoCardShimmer(),
                );
              }

              if (state.items.isEmpty && state.error != null) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(state.error!),
                      const SizedBox(height: 8),
                      FilledButton(
                        onPressed: () =>
                            context.read<RepoBloc>().add(RepoRetryRequested()),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                );
              }

              if (state.items.isEmpty) {
                return const Center(child: Text('No results'));
              }

              return RefreshIndicator(
                onRefresh: () async =>
                    context.read<RepoBloc>().add(RepoRefreshRequested()),
                child: ListView.builder(
                  controller: _controller,
                  itemCount: state.items.length + (state.canLoadMore ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index >= state.items.length) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Center(
                          child: state.paging
                              ? const SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator())
                              : TextButton(
                                  onPressed: () => context
                                      .read<RepoBloc>()
                                      .add(RepoNextPageRequested()),
                                  child: const Text('Load more'),
                                ),
                        ),
                      );
                    }
                    final r = state.items[index];
                    return RepoCard(
                      repo: r,
                      onTap: () => Navigator.of(context)
                          .pushNamed('/detail', arguments: r),
                    );
                  },
                ),
              );
            },
          ),
        )
      ]),
    );
  }
}
