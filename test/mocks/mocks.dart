



import 'package:mocktail/mocktail.dart';

import 'mock_definitions.dart';


//TODO
class Mocks {

  static late MockHttpClient mockHttpClient;
  static late MockReviewsRepository mockReviewsRepository;
  static late MockAppRouter mockAppRouter;
  static late MockGetReviesUseCase mockGetReviesUseCase;
  static late MockAppNavigator mockAppNavigator;

  void initMocks() {
    mockHttpClient  = MockHttpClient();
    mockReviewsRepository = MockReviewsRepository();
    mockAppRouter = MockAppRouter();
    mockGetReviesUseCase = MockGetReviesUseCase();
    mockAppNavigator = MockAppNavigator();
    registerFallbackValue(MockHttpClient());
    registerFallbackValue(MockReviewsRepository());
    registerFallbackValue(MockAppRouter());
    registerFallbackValue(MockGetReviesUseCase());
    registerFallbackValue(MockAppNavigator());
  }
}