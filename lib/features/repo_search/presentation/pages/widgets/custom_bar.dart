import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../app/theme/bloc/theme_cubit.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool automaticallyImplyLeading;

  const GlobalAppBar({
    super.key,
    required this.title,
    this.automaticallyImplyLeading = true,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      titleSpacing: 10,
      centerTitle: false,
      title:  Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      actions: [
        Row(
          children: [
            const Text('Dark mode'),
            const SizedBox(width: 8),
            BlocBuilder<ThemeCubit, ThemeMode>(
              builder: (context, mode) {
                // When system mode is selected, reflect current system theme
                final systemDark =
                    MediaQuery.of(context).platformBrightness == Brightness.dark;
                final isDarkNow = mode == ThemeMode.dark ||
                    (mode == ThemeMode.system && systemDark);

                return Transform.scale(
                  scale: 0.65,
                  child: Switch.adaptive(
                    value: isDarkNow,
                    onChanged: (v) {
                      // Switch is binary, so choose explicit Light/Dark here
                      context.read<ThemeCubit>().toggle(v);
                    },
                    activeColor: Colors.white,
                    activeTrackColor: Colors.green,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                  ),
                );
              },
            ),
            const SizedBox(width: 12),
          ],
        ),
      ],
    );
  }
}

