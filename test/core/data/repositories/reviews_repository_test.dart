import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yippy_lingo_demo/core/data/rest_api_reviews_failure.dart';
import 'package:yippy_lingo_demo/core/domain/repositories/reviews_repository.dart';
import 'package:yippy_lingo_demo/features/get_ratings/domain/model/get_reviews_failure.dart';

void main() {
  late ReviewsRepository repository;

  setUp(() {
    repository = const RestApiReviewsRepository();
  });

  group('getReviews', () {
    test('should return a list of reviews when there is no error', () async {

      // Act
      final result = await repository.getReviews();

      // Assert
      expect(result.getOrElse(() => []), isNotEmpty);
    });

    test('should return GetReviewsFailure.unknown() when simulateError is true', () async {
      // Arrange
      // Act
      final result = await repository.getReviews(simulateError: true);

      // Assert
      expect(result, equals(left(const GetReviewsFailure.unknown())));
    });
  });
}
