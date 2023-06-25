import 'package:flutter_test/flutter_test.dart';
import 'package:yippy_lingo_demo/core/utils/either_extensions.dart';
import 'package:yippy_lingo_demo/dependency_injection/app_component.dart';
import 'package:yippy_lingo_demo/features/get_ratings/domain/use_cases/get_ratings_use_case.dart';

void main() {
  late GetRatingsUseCase useCase;

  setUp(() {
    useCase = const GetRatingsUseCase();
  });

  test(
    'use case executes normally',
    () async {
      // GIVEN

      // WHEN
      final result = await useCase.execute();

      // THEN
      expect(result.isSuccess, true);
    },
  );


  test("getIt resolves successfully", () async {
    final useCase = getIt<GetRatingsUseCase>();
    expect(useCase, isNotNull);
  });
}