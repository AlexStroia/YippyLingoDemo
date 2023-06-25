import 'package:dartz/dartz.dart';
import 'package:yippy_lingo_demo/core/domain/model/review.dart';
import 'package:yippy_lingo_demo/core/domain/networking/networking_client.dart';
import 'package:yippy_lingo_demo/core/domain/repositories/reviews_repository.dart';

import '../../features/get_ratings/domain/model/get_reviews_failure.dart';

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
        title: 'Awesome',
        description: 'This is awesome',
        rating: 5,
        owner: 'John Doe',
        timestamp: '2021-10-10',
      ),
      Review(
        id: '1',
        title: 'Great Experience',
        description: 'Had a great experience using this app',
        rating: 4,
        owner: 'Jane Smith',
        timestamp: '2021-10-11',
      ),
      Review(
        id: '2',
        title: 'Very Satisfied',
        description: 'Extremely satisfied with the service provided',
        rating: 5,
        owner: 'Mike Johnson',
        timestamp: '2021-10-12',
      ),
      Review(
        id: '3',
        title: 'Average',
        description: 'It was an average experience',
        rating: 3,
        owner: 'Emily Brown',
        timestamp: '2021-10-13',
      ),
      Review(
        id: '4',
        title: 'Disappointed',
        description: 'Not happy with the product quality',
        rating: 2,
        owner: 'David Wilson',
        timestamp: '2021-10-14',
      ),
      Review(
        id: '5',
        title: 'Exceptional Service',
        description: 'Received exceptional service from the team',
        rating: 5,
        owner: 'Sophia Lee',
        timestamp: '2021-10-15',
      ),
      Review(
        id: '6',
        title: 'Needs Improvement',
        description: 'Some areas need improvement',
        rating: 3,
        owner: 'Daniel Thompson',
        timestamp: '2021-10-16',
      ),
    ];

    return Future.delayed(
      const Duration(seconds: 1),
      () => right(reviews),
    );
  }
}
