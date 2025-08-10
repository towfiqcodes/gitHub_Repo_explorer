import 'package:flutter/material.dart';
import '../../../data/models/repo_dto.dart';

class RepoCard extends StatelessWidget {
  final RepoDto repo;
  final VoidCallback? onTap;
  const RepoCard({super.key, required this.repo, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cardColor = theme.colorScheme.surfaceVariant.withOpacity(theme.brightness == Brightness.dark ? .25 : .8);

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    repo.name,
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.star, size: 18),
                const SizedBox(width: 6),
                Text('${repo.stars}', style: theme.textTheme.bodyMedium),
              ],
            ),
            const SizedBox(height: 4),
            Text(repo.owner.login, style: theme.textTheme.bodySmall),
            const SizedBox(height: 10),
            Text(
              repo.description.isEmpty ? '—' : repo.description,
              style: theme.textTheme.bodyMedium,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}