import 'dart:async';

import 'package:alchemist/alchemist.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:yippy_lingo_demo/core/utils/either_extensions.dart';
import 'package:yippy_lingo_demo/dependency_injection/app_component.dart';

import '../mocks/mocks.dart';

Future<Either<F, S>> successFuture<F, S>(S result) =>
    Future.value(success(result));

Future<Either<F, S>> failFuture<F, S>(F fail) => Future.value(failure(fail));

Future<void> prepareAppForUnitTests() async {
  await getIt.reset();
  getIt.allowReassignment = true;
  configureDependencies();
  resetMocktailState();
  Mocks.init();
}

Future<void> preparePageTests(FutureOr<void> Function() testMain) async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await loadAppFonts();
  await prepareAppForUnitTests();
  // ignore: do_not_use_environment
  const isCi = bool.fromEnvironment('isCI');
  return AlchemistConfig.runWithConfig(
    config: const AlchemistConfig(
      platformGoldensConfig:    PlatformGoldensConfig(
      enabled: !isCi,
    ),
    ),
    run: () async {
      return testMain();
    },
  );
}

/// helper method to re-register given dependency in tests
void reRegister<T extends Object>(T obj) {
  getIt.registerFactory<T>(() => obj);
}

extension MocktailWhenEither<T, L, R> on When<Future<Either<L, R>>> {
  void thenSuccess(R Function(Invocation) success) =>
      thenAnswer((invocation) => successFuture(success(invocation)));

  void thenFailure(L Function(Invocation) failure) =>
      thenAnswer((invocation) => failFuture(failure(invocation)));
}
