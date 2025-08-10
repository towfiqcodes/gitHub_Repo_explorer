import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'connectivity_cubit.dart';

class ConnectivityBanner extends StatelessWidget {
  const ConnectivityBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityCubit, bool>(
      buildWhen: (p, c) => p != c,
      builder: (context, isOnline) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          height: isOnline ? 0 : 40,
          curve: Curves.easeInOut,
          width: double.infinity,
          child: Material(
            color: Colors.red,
            child: SafeArea(
              bottom: false,
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    isOnline? const SizedBox.shrink(): Icon(Icons.wifi_off, size: 18, color: Colors.white),
                    const SizedBox(width: 8),
                    const Text('No internet connection',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
