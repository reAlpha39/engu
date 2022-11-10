import 'package:engu/features/course/presentation/pages/course_page.dart';
import 'package:engu/features/home/data/models/courses/courses.dart';
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
    GoRoute(
      name: 'course',
      path: '/course',
      builder: (context, state) => CoursePage(
        data: state.extra as Courses,
      ),
    ),
  ],
);
