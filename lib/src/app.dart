import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bs/src/features/feed/widgets/scaffold_with_navbar.widget.dart';
import 'package:flutter_bs/src/router/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      initialLocation: '/feed',
      routes: [
        ShellRoute(
          builder: (context, state, child) {
            return ScaffoldWithNavBar(child);
          },
          routes: $appRoutes,
        ),
      ],
      redirect: (context, state) {
        const isAuthenticated = true;
        if (!isAuthenticated) {
          return '/auth';
        } else {
          return null;
        }
      },
    );
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
