import 'package:dartz/dartz.dart';
import 'package:yippy_lingo_demo/core/domain/model/review.dart';
import 'package:yippy_lingo_demo/core/domain/model/get_reviews_failure.dart';

abstract class ReviewsRepository {
  Future<Either<GetReviewsFailure, List<Review>>> getReviews({bool simulateError = false});
}
