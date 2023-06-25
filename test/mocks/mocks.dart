



import 'package:mocktail/mocktail.dart';

import 'mock_definitions.dart';


//TODO
class Mocks {

  static late MockHttpClient mockHttpClient;
  static late MockReviewsRepository mockReviewsRepository;

  void initMocks() {
    mockHttpClient  = MockHttpClient();
    mockReviewsRepository = MockReviewsRepository();
    registerFallbackValue(MockHttpClient());
    registerFallbackValue(MockReviewsRepository());
  }
}