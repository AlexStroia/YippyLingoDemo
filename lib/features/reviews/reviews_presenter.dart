import 'package:bloc/bloc.dart';
import 'package:yippy_lingo_demo/core/domain/use_cases/get_reviews_use_case.dart';
import 'package:yippy_lingo_demo/core/utils/either_extensions.dart';
import 'package:yippy_lingo_demo/features/reviews/reviews_presentation_model.dart';
import 'package:yippy_lingo_demo/router/app_navigator.dart';

class ReviewsPresenter extends Cubit<ReviewsViewModel> {
  ReviewsPresenter(
    super.model,
    this.navigator,
    this._getReviewsUseCase,
  );

  final AppNavigator navigator;
  final GetReviewsUseCase _getReviewsUseCase;

  // ignore: unused_element
  ReviewsPresentationModel get _model => state as ReviewsPresentationModel;

  void getReviews() {
    emit(_model.copyWith(isLoading: true));
    _getReviewsUseCase.execute().doOn(success: (reviews) {
      emit(_model.copyWith(isLoading: false, reviews: reviews));
    }, fail: (failure) {
      emit(_model.copyWith(isLoading: false));
      navigator.showError(failure.displayableFailure());
    });
  }

  void onPageChanged(int page) {
    emit(_model.copyWith(currentPage: page));
  }
}
