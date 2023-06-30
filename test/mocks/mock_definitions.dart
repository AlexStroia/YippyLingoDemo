import 'package:mocktail/mocktail.dart';
import 'package:yippy_lingo_demo/core/domain/networking/networking_client.dart';
import 'package:yippy_lingo_demo/core/domain/repositories/reviews_repository.dart';
import 'package:yippy_lingo_demo/core/domain/use_cases/get_reviews_use_case.dart';
import 'package:yippy_lingo_demo/router/app_navigator.dart';
import 'package:yippy_lingo_demo/router/app_router.dart';

class MockHttpClient extends Mock implements NetworkClient {}

class MockReviewsRepository extends Mock implements ReviewsRepository {}

class MockAppRouter extends Mock implements AppRouter {}

class MockGetReviesUseCase extends Mock implements GetReviewsUseCase {}

class MockAppNavigator extends Mock implements AppNavigator {}