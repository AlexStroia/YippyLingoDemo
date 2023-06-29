import 'package:bloc/bloc.dart';
import 'package:yippy_lingo_demo/core/domain/use_cases/get_ratings_use_case.dart';
import 'package:yippy_lingo_demo/features/reviews/reviews_presentation_model.dart';
import 'package:yippy_lingo_demo/router/app_navigator.dart';


class ReviewsPresenter extends Cubit<ReviewsViewModel> {

  ReviewsPresenter(
    super.model,
    this.navigator,
      this._getRatingsUseCase,
  );

  final AppNavigator navigator;
  final GetRatingsUseCase _getRatingsUseCase;

  // ignore: unused_element
  ReviewsPresentationModel get _model => state as ReviewsPresentationModel;

}
