import 'package:stadata_flutter_sdk/src/core/core.dart';

class Result<F, S> extends BaseEntity {
  final S? _success;
  final F? _failure;
  final bool _isSuccess;

  const Result._({required bool isSuccess, S? success, F? failure})
    : _success = success,
      _failure = failure,
      _isSuccess = isSuccess;

  /// Creates a success (right) Result with the given value
  static Result<F, S> success<F, S>(S value) =>
      Result._(success: value, isSuccess: true);

  /// Creates a failure (left) Result with the given error
  static Result<F, S> failure<F, S>(F value) =>
      Result._(failure: value, isSuccess: false);

  /// Whether this Result is a success (right)
  bool get isSuccess => _isSuccess;

  /// Whether this Result is a failure (left)
  bool get isFailure => !_isSuccess;

  /// Safely gets the success value, returns null if this is a failure
  S? get successOrNull => isSuccess ? _success : null;

  /// Safely gets the failure value, returns null if this is a success
  F? get failureOrNull => isFailure ? _failure : null;

  /// Transform success value using the given function
  Result<F, T> map<T>(T Function(S) fn) {
    return isSuccess
        ? Result.success(fn(_success as S))
        : Result.failure(_failure as F);
  }

  /// Transform failure value using the given function
  Result<T, S> mapFailure<T>(T Function(F) fn) {
    return isSuccess
        ? Result.success(_success as S)
        : Result.failure(fn(_failure as F));
  }

  /// Returns the success value if available, otherwise returns the given default value
  S getOrElse(S defaultValue) {
    return isSuccess ? _success! : defaultValue;
  }

  /// Executes one of the given functions depending on whether this is a failure or success
  T fold<T>(T Function(F) onFailure, T Function(S) onSuccess) {
    return isSuccess ? onSuccess(_success as S) : onFailure(_failure as F);
  }

  /// Executes the appropriate callback based on whether this is a failure or success
  void when({
    required void Function(F) failure,
    required void Function(S) success,
  }) {
    if (isSuccess) {
      success(_success as S);
    } else {
      failure(_failure as F);
    }
  }

  @override
  List<Object?> get props => [_success, _failure, _isSuccess];
}
