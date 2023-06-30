import 'package:flutter/material.dart';
import 'package:yippy_lingo_demo/core/domain/use_cases/get_reviews_use_case.dart';
//DO-NOT-REMOVE APP_COMPONENT_IMPORTS

import 'package:get_it/get_it.dart';
import 'package:yippy_lingo_demo/core/data/rest_api_reviews_failure.dart';
import 'package:yippy_lingo_demo/core/domain/networking/networking_client.dart';
import 'package:yippy_lingo_demo/core/domain/repositories/reviews_repository.dart';
import 'package:yippy_lingo_demo/features/reviews/reviews_initial_params.dart';
import 'package:yippy_lingo_demo/features/reviews/reviews_page.dart';
import 'package:yippy_lingo_demo/features/reviews/reviews_presentation_model.dart';
import 'package:yippy_lingo_demo/features/reviews/reviews_presenter.dart';
import 'package:yippy_lingo_demo/router/app_navigator.dart';
import 'package:yippy_lingo_demo/router/app_router.dart';

final getIt = GetIt.instance;
//DO-NOT-REMOVE APP_COMPONENT_INIT

void configureDependencies() {
  _configureNavigator();
  _configureNetworkClient();
  _configureRepositories();
  _configureUseCases();

  _configureReviewsPageMvp();
}

_configureNavigator() {
  getIt
    ..registerLazySingleton<GlobalKey<NavigatorState>>(
      () => GlobalKey<NavigatorState>(),
    )
    ..registerLazySingleton<AppRouter>(
      () => AppRouter(getIt()),
    )
    ..registerLazySingleton(() => AppNavigator(getIt()));
}

void _configureNetworkClient() =>
    getIt.registerFactory(() => NetworkClient(baseUrl: 'somebaseurl'));

void _configureRepositories() {
  getIt.registerLazySingleton<ReviewsRepository>(
      () => RestApiReviewsRepository(getIt()));
}

void _configureUseCases() {
  getIt.registerFactory(() => GetReviewsUseCase(getIt()));
}

void _configureReviewsPageMvp() {
  // ignore: unnecessary_statements
  getIt
    ..registerFactoryParam<ReviewsPresentationModel, ReviewsInitialParams,
        dynamic>(
      (params, _) => ReviewsPresentationModel.initial(params),
    )
    ..registerFactoryParam<ReviewsPresenter, ReviewsInitialParams, dynamic>(
      (initialParams, _) => ReviewsPresenter(
        getIt<ReviewsPresentationModel>(param1: initialParams),
        getIt(),
        getIt(),
      ),
    )
    ..registerFactoryParam<ReviewsPage, ReviewsInitialParams, dynamic>(
      (initialParams, _) => ReviewsPage(
        presenter: getIt(param1: initialParams),
      ),
    );
}
