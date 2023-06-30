import 'package:flutter/material.dart';
import 'package:yippy_lingo_demo/dependency_injection/app_component.dart';
import 'package:yippy_lingo_demo/router/app_router.dart';
import 'package:yippy_lingo_demo/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await getIt.allReady();
  runApp(const YippyLingoApp());
}

class YippyLingoApp extends StatelessWidget {
  const YippyLingoApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>();
    return MaterialApp.router(
      theme: Theme.of(context).copyWith(extensions: [AppTheme()]),
      routerConfig: router,
    );
  }
}
