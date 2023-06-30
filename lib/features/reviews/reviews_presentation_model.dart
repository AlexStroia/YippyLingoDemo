import 'package:yippy_lingo_demo/core/domain/model/review.dart';
import 'package:yippy_lingo_demo/features/reviews/reviews_initial_params.dart';

/// Model used by presenter, contains fields that are relevant to presenters and implements ViewModel to expose data to view (page)
class ReviewsPresentationModel implements ReviewsViewModel {
  /// Creates the initial state
  ReviewsPresentationModel.initial(
    // ignore: avoid_unused_constructor_parameters
    ReviewsInitialParams initialParams,
  )   : currentPage = 0,
        reviews = [],
        isLoading = false;

  /// Used for the copyWith method
  ReviewsPresentationModel._({
    required this.currentPage,
    required this.reviews,
    required this.isLoading,
  });

  ReviewsPresentationModel copyWith(
      {int? currentPage, List<Review>? reviews, bool? isLoading}) {
    return ReviewsPresentationModel._(
      currentPage: currentPage ?? this.currentPage,
      reviews: reviews ?? this.reviews,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  final int currentPage;

  @override
  final List<Review> reviews;

  @override
  final bool isLoading;
}

/// Interface to expose fields used by the view (page).
abstract class ReviewsViewModel {
  int get currentPage;

  List<Review> get reviews;

  bool get isLoading;
}
