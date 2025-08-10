import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RepoCardShimmer extends StatelessWidget {
  const RepoCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final base = isDark ? Colors.white10 : Colors.black12;
    final highlight = isDark ? Colors.white24 : Colors.black26;

    return Shimmer.fromColors(
      baseColor: base,
      highlightColor: highlight,
      period: const Duration(seconds: 2),
      child: _SkeletonCard(barColor: isDark ? Colors.white12 : Colors.black12),
    );
  }
}

class _SkeletonCard extends StatelessWidget {
  final Color barColor;
  const _SkeletonCard({required this.barColor});

  Widget _bar(double w, double h) => Container(
    width: w,
    height: h,
    decoration: BoxDecoration(
      color: barColor,
      borderRadius: BorderRadius.circular(8),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            offset: const Offset(0, 8),
            color: Colors.black.withOpacity(0.06),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title + stars row
          Row(
            children: [
              Expanded(child: _bar(180, 18)), // repository name
              const SizedBox(width: 12),
              _bar(16, 16),                    // star icon box
              const SizedBox(width: 6),
              _bar(40, 12),                    // star count
            ],
          ),
          const SizedBox(height: 10),
          _bar(100, 12),                       // username
          const SizedBox(height: 14),
          _bar(double.infinity, 12),           // description line 1
          const SizedBox(height: 8),
          _bar(MediaQuery.of(context).size.width * .6, 12), // line 2
          const SizedBox(height: 8),
          _bar(MediaQuery.of(context).size.width * .45, 12), // line 3
        ],
      ),
    );
  }
}
