import 'network_exceptions.dart';

typedef SuccessCallback<T> = void Function(T data);
typedef FailureCallback = void Function(NetworkExceptions error);

extension ResultExt<T> on Future<Result<T>> {
  Future<Result<S>> map<S>(S Function(T data) transform) async {
    return (await this).map(transform);
  }
}

mixin ResultMixin<T> {
  Future<void> when({required SuccessCallback<T> success, required FailureCallback failure});
  Result<S> map<S>(S Function(T data) transform);
}

abstract class Result<T> with ResultMixin<T> {
  //Mixin trong Dart là một cách để thêm các phương thức hoặc thuộc tính vào một class mà không cần kế thừa.
  // Ngoài ra đó chính là việc 1 class có thể sử dụng được nhiều Mixin cùng 1 lúc . 
  const factory Result.success({required T data}) = Success<T>;

  const factory Result.failure({required NetworkExceptions error}) = Failure<T>;
}

abstract class Success<T> implements Result<T> {
  const factory Success({required T data}) = _SuccessImpl<T>;

  T get data;
}

class _SuccessImpl<T> implements Success<T> {
  const _SuccessImpl({required this.data});

  @override
  final T data;

  @override
  Future<void> when({required SuccessCallback<T> success, required FailureCallback failure}) async {
    return success.call(data);
  }

  @override
  Result<S> map<S>(S Function(T data) transform) {
    return _SuccessImpl(data: transform(data));
  }
}

abstract class Failure<T> implements Result<T> {
  const factory Failure({required NetworkExceptions error}) = _FailureImpl<T>;

  NetworkExceptions get error;
}

class _FailureImpl<T> implements Failure<T> {
  const _FailureImpl({required this.error});

  @override
  final NetworkExceptions error;

  @override
  Future<void> when({required SuccessCallback<T> success, required FailureCallback failure}) async {
    return failure(error);
  }

  @override
  Result<S> map<S>(S Function(T data) transform) {
    return _FailureImpl(error: error);
  }
}
