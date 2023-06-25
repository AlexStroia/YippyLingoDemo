import 'package:yippy_lingo_demo/core/domain/model/displayable_failure.dart';

class NetworkFailure implements HasDisplayableFailure {
  @override
  DisplayableFailure displayableFailure() {
    throw UnimplementedError();
  }
}

enum NetworkFailureType {
  unknown,
  unautehnticated,
}
