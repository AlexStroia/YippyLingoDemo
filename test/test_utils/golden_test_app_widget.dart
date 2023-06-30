import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:yippy_lingo_demo/theme/app_theme.dart';

import 'golden_test_device_scenario.dart';

class GoldenTestWidgetApp extends StatelessWidget {
  const GoldenTestWidgetApp({
    super.key,
    required this.device,
    required this.builder,
    this.embedInMaterialApp = false,
    this.navigatorKey,
  });

  final Device device;
  final ValueGetter<Widget> builder;
  final bool embedInMaterialApp;
  final GlobalKey? navigatorKey;

  @override
  Widget build(BuildContext context) {
    final content = Builder(
      builder: (context) {
        return Theme(
          data: Theme.of(context).copyWith(extensions: [AppTheme()]),
          child: DefaultAssetBundle(
            bundle: TestAssetBundle(),
            child: GoldenTestDeviceScenario(
              device: device,
              builder: builder,
            ),
          ),
        );
      },
    );
    return embedInMaterialApp //
        ? MediaQuery(
            data: MediaQueryData(
              size: device.size,
              padding: device.safeArea,
            ),
            child: MaterialApp(
              key: navigatorKey,
              home: content,
            ),
          )
        : content;
  }
}
