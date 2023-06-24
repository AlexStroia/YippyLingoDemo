import 'package:yippy_lingo_demo/features/some_feature/some_feature_initial_params.dart';



/// Model used by presenter, contains fields that are relevant to presenters and implements ViewModel to expose data to view (page)
class SomeFeaturePresentationModel implements SomeFeatureViewModel {
  /// Creates the initial state
  SomeFeaturePresentationModel.initial(
    // ignore: avoid_unused_constructor_parameters
    SomeFeatureInitialParams initialParams,
  );

  /// Used for the copyWith method
  SomeFeaturePresentationModel._();

  SomeFeaturePresentationModel copyWith() {
    return SomeFeaturePresentationModel._();
  }
}

/// Interface to expose fields used by the view (page).
abstract class SomeFeatureViewModel {}
