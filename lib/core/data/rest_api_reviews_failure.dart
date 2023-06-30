import 'package:dartz/dartz.dart';
import 'package:yippy_lingo_demo/core/domain/model/review.dart';
import 'package:yippy_lingo_demo/core/domain/networking/networking_client.dart';
import 'package:yippy_lingo_demo/core/domain/repositories/reviews_repository.dart';

import '../domain/model/get_reviews_failure.dart';

class RestApiReviewsRepository implements ReviewsRepository {
  final NetworkClient client;

  const RestApiReviewsRepository(this.client);

  @override
  Future<Either<GetReviewsFailure, List<Review>>> getReviews(
      {bool simulateError = false}) {
    if (simulateError) {
      return Future.delayed(
        const Duration(seconds: 1),
        () => left(const GetReviewsFailure.unknown()),
      );
    }

    const reviews = <Review>[
      Review(
        id: '0',
        name: 'John Doe',
        description: 'Facilisis pulvinar egestas pulvinar aenean sed morbi.e',
        age: '22',
      ),
      Review(
        id: '1',
        name: 'Jane Smith',
        description: 'Facilisis pulvinar egestas pulvinar aenean sed morbi.',
        age: '30',
      ),
      Review(
        id: '2',
        name: 'Adam Brown',
        description: 'HFacilisis pulvinar egestas pulvinar aenean sed morbi.',
        age: '28',
      ),
      Review(
        id: '3',
        name: 'Emily Davis',
        description: 'Facilisis pulvinar egestas pulvinar aenean sed morbi.',
        age: '25',
      ),
      Review(
        id: '4',
        name: 'Michael Johnson',
        description: 'Facilisis pulvinar egestas pulvinar aenean sed morbi.',
        age: '32',
      ),
    ];

    return Future.delayed(
      const Duration(seconds: 1),
      () => right(reviews),
    );
  }
}
