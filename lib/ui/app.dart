import 'package:flutter/material.dart';
import 'package:tractian/config/config.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.build(),
      routerConfig: _appRouter.config(),
    );
  }
}
