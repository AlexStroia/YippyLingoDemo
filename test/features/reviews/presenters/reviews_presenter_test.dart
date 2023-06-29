import 'package:flutter_test/flutter_test.dart';
import 'package:yippy_lingo_demo/features/reviews/reviews_initial_params.dart';
import 'package:yippy_lingo_demo/features/reviews/reviews_presentation_model.dart';
import 'package:yippy_lingo_demo/features/reviews/reviews_presenter.dart';

import '../mocks/reviews_mock_definitions.dart';

void main() {
  late ReviewsPresentationModel model;
  late ReviewsPresenter presenter;
  late MockReviewsNavigator navigator;

  test(
    'sample test',
        () {
      expect(presenter, isNotNull); // TODO implement this
    },
  );

  setUp(() {
    model = ReviewsPresentationModel.initial(const ReviewsInitialParams());
    navigator = MockReviewsNavigator();
    presenter = ReviewsPresenter(
      model,
      navigator,
    );
  });
}
