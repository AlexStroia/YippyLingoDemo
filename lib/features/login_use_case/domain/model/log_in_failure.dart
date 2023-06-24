import 'package:yippy_lingo_demo/core/domain/model/displayable_failure.dart';

class LogInFailure implements HasDisplayableFailure {
  // ignore: avoid_field_initializers_in_const_classes
  const LogInFailure.unknown([this.cause]) : type = LogInFailureType.unknown;

  final LogInFailureType type;
  final Object? cause;

  @override
  DisplayableFailure displayableFailure() {
    switch (type) {
      case LogInFailureType.unknown:
        return DisplayableFailure.commonError();
    }
  }

  @override
  String toString() => 'LogInFailure{type: $type, cause: $cause}';
}

enum LogInFailureType {
  unknown,
}
