import 'package:dartz/dartz.dart';
import 'package:yippy_lingo_demo/core/utils/either_extensions.dart';
import 'package:yippy_lingo_demo/features/login_use_case/domain/model/log_in_failure.dart';

class LogInUseCase {
  const LogInUseCase();

  Future<Either<LogInFailure, Unit>> execute() async {
    return failure(const LogInFailure.unknown());
  }
}
