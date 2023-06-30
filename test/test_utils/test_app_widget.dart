import 'package:flutter/material.dart';
import 'package:yippy_lingo_demo/theme/app_theme.dart';

import 'golden_tests_utils.dart';

class TestAppWidget extends StatelessWidget {
  const TestAppWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData(
        size: testDevices.first.size,
        padding: testDevices.first.safeArea,
      ),
      child: MaterialApp(
        theme: Theme.of(context).copyWith(extensions: [AppTheme()]),
        home: child,
      ),
    );
  }
}
