import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Application routes — will be fully configured in Step 4.
/// Placeholder structure to allow main.dart compilation.
class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const _PlaceholderScreen(title: 'Splash'),
      ),
    ],
  );
}

/// Temporary placeholder — will be replaced by actual screens.
class _PlaceholderScreen extends StatelessWidget {
  const _PlaceholderScreen({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(title)),
    );
  }
}
