import 'package:yippy_lingo_demo/core/domain/model/review.dart';
import 'package:yippy_lingo_demo/features/reviews/reviews_initial_params.dart';

/// Model used by presenter, contains fields that are relevant to presenters and implements ViewModel to expose data to view (page)
class ReviewsPresentationModel implements ReviewsViewModel {
  /// Creates the initial state
  ReviewsPresentationModel.initial(
    // ignore: avoid_unused_constructor_parameters
    ReviewsInitialParams initialParams,
  ) : currentPage = 0,
      reviews = [];


  /// Used for the copyWith method
  ReviewsPresentationModel._({required this.currentPage, required this.reviews,});

  ReviewsPresentationModel copyWith({int? currentPage, List<Review>? reviews}) {
    return ReviewsPresentationModel._(
      currentPage: currentPage ?? this.currentPage,
      reviews: reviews ?? this.reviews,
    );
  }

  @override
  final int currentPage;

  @override
  final List<Review> reviews;
}

/// Interface to expose fields used by the view (page).
abstract class ReviewsViewModel {
  int get currentPage;
  List<Review> get reviews;
}
