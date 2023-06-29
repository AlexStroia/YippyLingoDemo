import 'package:flutter_test/flutter_test.dart';
import 'package:yippy_lingo_demo/dependency_injection/app_component.dart';
import 'package:yippy_lingo_demo/features/reviews/reviews_initial_params.dart';
import 'package:yippy_lingo_demo/features/reviews/reviews_navigator.dart';
import 'package:yippy_lingo_demo/features/reviews/reviews_page.dart';
import 'package:yippy_lingo_demo/features/reviews/reviews_presentation_model.dart';
import 'package:yippy_lingo_demo/features/reviews/reviews_presenter.dart';

import '../../../mocks/mocks.dart';
import '../../../test_utils/golden_tests_utils.dart';

Future<void> main() async {
  late ReviewsPage page;
  late ReviewsInitialParams initParams;
  late ReviewsPresentationModel model;
  late ReviewsPresenter presenter;
  late ReviewsNavigator navigator;

  void initMvp() {
    initParams = const ReviewsInitialParams();
    model = ReviewsPresentationModel.initial(
      initParams,
    );
    navigator = ReviewsNavigator(Mocks.appNavigator);
    presenter = ReviewsPresenter(
      model,
      navigator,
    );
    page = ReviewsPage(presenter: presenter);
  }

  await screenshotTest(
    "reviews_page",
    setUp: () async {
      initMvp();
    },
    pageBuilder: () => page,
  );

  test("getIt page resolves successfully", () async {
    initMvp();
    final page = getIt<ReviewsPage>(param1: initParams);
    expect(page.presenter, isNotNull);
    expect(page, isNotNull);
  });
}
