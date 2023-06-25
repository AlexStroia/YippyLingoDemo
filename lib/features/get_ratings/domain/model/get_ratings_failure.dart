import 'package:yippy_lingo_demo/core/domain/model/displayable_failure.dart';

class GetRatingsFailure implements HasDisplayableFailure {
  // ignore: avoid_field_initializers_in_const_classes
  const GetRatingsFailure.unknown([this.cause]) : type = GetRatingsFailureType.unknown;

  final GetRatingsFailureType type;
  final Object? cause;

  @override
  DisplayableFailure displayableFailure() {
    switch (type) {
      case GetRatingsFailureType.unknown:
        return DisplayableFailure.commonError();
    }
  }

  @override
  String toString() => 'GetRatingsFailure{type: $type, cause: $cause}';
}

enum GetRatingsFailureType {
  unknown,
}
