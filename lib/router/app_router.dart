import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yippy_lingo_demo/dependency_injection/app_component.dart';
import 'package:yippy_lingo_demo/features/reviews/reviews_initial_params.dart';
import 'package:yippy_lingo_demo/features/reviews/reviews_page.dart';
import 'package:yippy_lingo_demo/router/routers.dart';

class AppRouter extends GoRouter {
  final GlobalKey<NavigatorState> navigatorKey;

  AppRouter(this.navigatorKey)
      : super(
          navigatorKey: navigatorKey,
          initialLocation: Routes.initial,
          routes: [
            GoRoute(
              path: Routes.initial,
              builder: (context, state) => getIt<ReviewsPage>(
                param1: state.extra ?? const ReviewsInitialParams(),
              ),
            ),
          ],
        );
}
