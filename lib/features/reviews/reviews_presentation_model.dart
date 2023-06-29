import 'package:yippy_lingo_demo/features/reviews/reviews_initial_params.dart';



/// Model used by presenter, contains fields that are relevant to presenters and implements ViewModel to expose data to view (page)
class ReviewsPresentationModel implements ReviewsViewModel {
  /// Creates the initial state
  ReviewsPresentationModel.initial(
    // ignore: avoid_unused_constructor_parameters
    ReviewsInitialParams initialParams,
  );

  /// Used for the copyWith method
  ReviewsPresentationModel._();

  ReviewsPresentationModel copyWith() {
    return ReviewsPresentationModel._();
  }
}

/// Interface to expose fields used by the view (page).
abstract class ReviewsViewModel {}
