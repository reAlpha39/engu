import 'package:go_router/go_router.dart';

import '../../features/home/presentation/pages/home_page.dart';

final GoRouter router = GoRouter(
  debugLogDiagnostics: false,
  initialLocation: '/',
  routes: <GoRoute>[
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
  ],
);
