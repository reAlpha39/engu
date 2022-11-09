import 'package:engu/core/infrastructure/theme.dart';
import 'package:engu/injection.dart';
import 'package:flutter/material.dart';

import 'core/infrastructure/route.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      title: 'Engu',
      theme: theme(),
    );
  }
}
