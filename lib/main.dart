import 'package:flutter/material.dart';
import 'package:yippy_lingo_demo/dependency_injection/app_component.dart';
import 'package:yippy_lingo_demo/features/reviews/reviews_initial_params.dart';
import 'package:yippy_lingo_demo/features/reviews/reviews_page.dart';
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
    return MaterialApp(
      title: 'YippyLingo',
      theme:  Theme.of(context).copyWith(extensions: [AppTheme()]),
      home: getIt<ReviewsPage>(param1: const ReviewsInitialParams()));
  }

}