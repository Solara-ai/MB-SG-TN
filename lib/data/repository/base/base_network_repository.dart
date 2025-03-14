

import 'package:schedule_gen_and_time_management/data/source/network/helper/network_error_code.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/network_exceptions.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/data/source/network/response/api_response.dart';

abstract class BaseNetworkRepository {
  // class BaseNetworkRepository được sử dụng để định nghĩa ra các phương thức để thực hiện xử lý các phản hồi từ API , và trả về một result .
  // lí do chính mà chúng ta khởi tạo abstract class ở đây là dùng để các class khác phải kế thừa lại class này mới có thể sử dụng được các phương thức bên trong , và tránh khởi tạo trực tiếp instance của class . 
  // final DataExceptionNotifier _dataExceptionNotifier = GetIt.I<DataExceptionNotifier>();

  Future<Result<T>> execute<T>(
    Future<ApiResponse<T>> apiCall, {
    NetworkErrorHandler errorHandler = const AcceptAllErrors(),
  }) async {
    NetworkExceptions? exception;
    try {
      final response = await apiCall;
      if (response.isSuccess) {
        return Result.success(data: response.data as T);
      } else {
        exception = NetworkExceptions.parseErrorResponse(response);
      }
    } catch (error) {
      exception = NetworkExceptions.parseException(error);
    }
    _handleErrorMessage(exception, errorHandler: errorHandler);
    return Result.failure(error: exception);
  }

  Future<Result<T>> executeFunction<T>(
    Future<ApiResponse<T>> Function() apiFunction, {
    NetworkErrorHandler errorHandler = const AcceptAllErrors(),
  }) async {
    return execute(apiFunction(), errorHandler: errorHandler);
  }

  void _handleErrorMessage(
    NetworkExceptions exception, {
    NetworkErrorHandler errorHandler = const AcceptAllErrors(),
  }) {
    if (_handleGlobalException(exception)) {
      return;
    }
    switch (errorHandler) {
      case IgnoreAllErrors():
        break;
      case AcceptAllErrors():
        // _dataExceptionNotifier.addEvent(exception);
        break;
      case ExceptErrors():
        if (!errorHandler.errors.contains(exception.errorCode)) {
          // _dataExceptionNotifier.addEvent(exception);
        }
        break;
    }
  }

  bool _handleGlobalException(NetworkExceptions exception) {
    if (exception.errorCode.isGlobalError) {
      // _dataExceptionNotifier.addEvent(exception.copy());
      exception.invalid();
      return true;
    }
    return false;
  }
}

sealed class NetworkErrorHandler {
  const NetworkErrorHandler();

  factory NetworkErrorHandler.ignoreAllErrors() => const IgnoreAllErrors();
  factory NetworkErrorHandler.acceptAllErrors() => const AcceptAllErrors();
  factory NetworkErrorHandler.exceptErrors(List<NetworkErrorCode> errors) => ExceptErrors(errors: errors);
}

class IgnoreAllErrors extends NetworkErrorHandler {
  const IgnoreAllErrors();
}

class AcceptAllErrors extends NetworkErrorHandler {
  const AcceptAllErrors();
}

class ExceptErrors extends NetworkErrorHandler {
  final List<NetworkErrorCode> errors;

  const ExceptErrors({required this.errors});
}
