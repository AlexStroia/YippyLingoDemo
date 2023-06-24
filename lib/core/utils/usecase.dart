import 'package:dartz/dartz.dart';
import 'package:yippy_lingo_demo/core/domain/model/displayable_failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<HasDisplayableFailure, Type>> call(Params params);
}
