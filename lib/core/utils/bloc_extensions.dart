//ignore:prefer-match-file-name
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:yippy_lingo_demo/core/utils/either_extensions.dart';

enum FutureStatus {
  notStarted,
  pending,
  fulfilled,
  rejected,
}

class FutureResult<T> extends Equatable {
  const FutureResult(
    this.result,
    this.status,
    this.error,
  );

  const FutureResult.empty()
      : result = null,
        error = null,
        status = FutureStatus.notStarted;

  const FutureResult.pending()
      : result = null,
        error = null,
        status = FutureStatus.pending;

  const FutureResult.success(this.result)
      : error = null,
        status = FutureStatus.fulfilled;

  final T? result;
  final FutureStatus status;
  final dynamic error;

  @override
  List<Object?> get props => [
        result,
        status,
        error,
      ];

  bool isPending() => status == FutureStatus.pending;

  FutureResult<T2> mapResult<T2>(
    T2? Function(T?) mapper,
  ) =>
      FutureResult(
        mapper(result),
        status,
        error,
      );

  FutureResult<T> copyWith({
    T? result,
    FutureStatus? status,
    dynamic error,
  }) =>
      FutureResult<T>(
        result ?? this.result,
        status ?? this.status,
        error ?? this.error,
      );
}

extension AsObservableFuture<T> on Future<T> {
  Future<T> observeStatusChanges(void Function(FutureResult<T>) onChange) {
    onChange(
      //ignore: prefer-trailing-comma
      const FutureResult(null, FutureStatus.pending, null),
    );

    return then((value) {
      onChange(
        //ignore: prefer-trailing-comma
        FutureResult(value, FutureStatus.fulfilled, null),
      );

      return value;
    }).catchError((error) {
      onChange(
        //ignore: prefer-trailing-comma
        FutureResult(null, FutureStatus.rejected, error),
      );

      throw error as Object;
    });
  }
}

extension EitherResultExtensions<L, R> on FutureResult<Either<L, R>> {
  R? getSuccess() => result?.getSuccess();

  L? getFailure() => result?.getFailure();

  FutureResult<Either<L, R2>> mapSuccess<R2>(R2 Function(R) mapper) => //
      mapResult((result) => result?.map(mapper));
}
