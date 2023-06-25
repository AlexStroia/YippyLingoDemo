import 'package:dartz/dartz.dart';
import 'package:yippy_lingo_demo/core/domain/model/review.dart';
import 'package:yippy_lingo_demo/core/domain/repositories/reviews_repository.dart';
import 'package:yippy_lingo_demo/features/get_ratings/domain/model/get_reviews_failure.dart';

class GetRatingsUseCase {
  final ReviewsRepository reviewsRepository;

  const GetRatingsUseCase(this.reviewsRepository);

  Future<Either<GetReviewsFailure, List<Review>>> execute() async =>
      reviewsRepository.getReviews();
}
