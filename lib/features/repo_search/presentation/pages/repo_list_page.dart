import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../bloc/repo_bloc.dart';
import '../bloc/repo_state.dart';

class RepoListPage extends StatefulWidget {
  @override
  State<RepoListPage> createState() => _RepoListPageState();
}

class _RepoListPageState extends State<RepoListPage> {
  final _scrollController = ScrollController();
  final int _perPage = 100;
  int _currentPage = 1;
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();

    // Initial fetch
    context.read<RepoBloc>().add(FetchReposEvent(page: _currentPage, append: false));

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200 &&
          !_isLoadingMore) {
        _isLoadingMore = true;
        _currentPage++;
        context
            .read<RepoBloc>()
            .add(FetchReposEvent(page: _currentPage, append: true));
      }
    });
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.tryParse(url);
    if (uri != null && await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Could not open URL')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GitHub Repos')),
      body: BlocConsumer<RepoBloc, RepoState>(
        listener: (context, state) {
          if (state is RepoLoaded) {
            _isLoadingMore = false;
          }
        },
        builder: (context, state) {
          if (state is RepoLoading && !_isLoadingMore) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RepoLoaded) {
            if (state.repos.isEmpty) {
              return const Center(child: Text('No repositories found'));
            }
            return ListView.builder(
              controller: _scrollController,
              itemCount: state.hasMore
                  ? state.repos.length + 1
                  : state.repos.length,
              itemBuilder: (context, index) {
                if (index >= state.repos.length) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                final repo = state.repos[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    NetworkImage(repo.ownerAvatarUrl ?? ''),
                    backgroundColor: Colors.grey[200],
                  ),
                  title: Text(repo.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (repo.description != null &&
                          repo.description!.isNotEmpty)
                        Text(repo.description!,
                            maxLines: 2, overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.star, size: 14, color: Colors.amber[700]),
                          SizedBox(width: 4),
                          Text('${repo.stargazersCount}'),
                          SizedBox(width: 16),
                          if (repo.language != null)
                            Text(repo.language!, style: const TextStyle(fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                  onTap: () {
                    if (repo.htmlUrl != null) {
                      _launchUrl(repo.htmlUrl!);
                    }
                  },
                  isThreeLine: true,
                );
              },
            );
          } else if (state is RepoError) {
            return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                ));
          }
          return const Center(child: Text('Loading repositories...'));
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
