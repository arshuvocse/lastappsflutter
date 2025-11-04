
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/view/data_sync_view.dart';
import 'package:myapp/view/dashboard_view.dart';
import 'package:myapp/view/login_view.dart';
import 'package:myapp/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/splash',
  routes: <RouteBase>[
     GoRoute(
      path: '/splash',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/data-sync',
      builder: (BuildContext context, GoRouterState state) {
        return const DataSyncScreen();
      },
    ),
    GoRoute(
      path: '/dashboard',
      builder: (BuildContext context, GoRouterState state) {
        return const DashboardScreen();
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter MVVM Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
