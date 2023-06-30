import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

import 'test_utils/test_utils.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await prepareAppForUnitTests();
  return testMain();
}
