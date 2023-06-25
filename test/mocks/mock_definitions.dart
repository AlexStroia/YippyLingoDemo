import 'package:mocktail/mocktail.dart';
import 'package:yippy_lingo_demo/core/domain/networking/networking_client.dart';
import 'package:yippy_lingo_demo/core/domain/repositories/reviews_repository.dart';

class MockHttpClient extends Mock implements NetworkClient {}

class MockReviewsRepository extends Mock implements ReviewsRepository {}