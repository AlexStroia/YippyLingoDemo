import 'package:yippy_lingo_demo/core/domain/model/displayable_failure.dart';

class LoginFailure implements HasDisplayableFailure {
  // ignore: avoid_field_initializers_in_const_classes
  const LoginFailure.unknown([this.cause]) : type = LoginFailureType.unknown;

  final LoginFailureType type;
  final Object? cause;

  @override
  DisplayableFailure displayableFailure() {
    switch (type) {
      case LoginFailureType.unknown:
        return DisplayableFailure.commonError();
    }
  }

  @override
  String toString() => 'LoginFailure{type: $type, cause: $cause}';
}

enum LoginFailureType {
  unknown,
}
