import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/models/repo_dto.dart';

class RepoDetailCard extends StatelessWidget {
  final RepoDto repo;
  const RepoDetailCard({super.key, required this.repo});

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final surface = theme.colorScheme.surfaceVariant.withOpacity(
      theme.brightness == Brightness.dark ? .25 : .7,
    );

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row: full name + stats
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  repo.fullName,
                  style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Icon(Icons.star, size: 18),
              const SizedBox(width: 6),
              Text('${repo.stars}', style: theme.textTheme.bodyMedium),
              const SizedBox(width: 16),
              const Icon(Icons.fork_right, size: 18),
              const SizedBox(width: 6),
              Text('${repo.forks}', style: theme.textTheme.bodyMedium),
            ],
          ),
          const SizedBox(height: 12),

          // Middle card: avatar + username + link
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            decoration: BoxDecoration(
              color: surface,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 36,
                  backgroundImage: NetworkImage(repo.owner.avatarUrl),
                ),
                const SizedBox(height: 12),
                Text(repo.owner.login, style: theme.textTheme.titleMedium),
                const SizedBox(height: 8),
                InkWell(
                  onTap: () => _openUrl(repo.htmlUrl),
                  borderRadius: BorderRadius.circular(8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                    Image.asset(
                    'assets/images/github_logo.png',
                    width: 18,
                    height: 18,
                    color: Theme.of(context).iconTheme.color, // adapts to dark/light mode
                  ), // swap for Octocat SVG if you want
                      const SizedBox(width: 8),
                      Text(
                        repo.htmlUrl.replaceFirst('https://', ''),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Description
          Text(
            repo.description.isEmpty ? 'No description provided.' : repo.description,
            style: theme.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
