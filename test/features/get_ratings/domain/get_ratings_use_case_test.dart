import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:yippy_lingo_demo/core/domain/use_cases/get_reviews_use_case.dart';
import 'package:yippy_lingo_demo/core/utils/either_extensions.dart';
import 'package:yippy_lingo_demo/dependency_injection/app_component.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/stubs.dart';
import '../../../test_utils/test_utils.dart';

void main() {
  late GetReviewsUseCase useCase;

  setUp(() {
    useCase = GetReviewsUseCase(Mocks.mockReviewsRepository);

    when(
      () => Mocks.mockReviewsRepository.getReviews(),
    ).thenAnswer((_) => successFuture(Stubs.reviews));
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
    final useCase = getIt<GetReviewsUseCase>();
    expect(useCase, isNotNull);
  });
}
