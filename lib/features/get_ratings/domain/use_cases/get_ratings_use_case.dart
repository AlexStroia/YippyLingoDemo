import 'package:dartz/dartz.dart';
import 'package:yippy_lingo_demo/core/utils/either_extensions.dart';
import 'package:yippy_lingo_demo/features/get_ratings/domain/model/get_reviews_failure.dart';

class GetRatingsUseCase {
  const GetRatingsUseCase();

  Future<Either<GetReviewsFailure, Unit>> execute() async {
    return failure(const GetReviewsFailure.unknown());
  }
}
