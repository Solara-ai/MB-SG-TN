import 'package:dio/dio.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/network_error_code.dart';
import 'package:schedule_gen_and_time_management/data/source/network/response/api_response.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:schedule_gen_and_time_management/data/dto/error_dto.dart';

class NetworkExceptions {
  
  String errorMessage;
  String serverMessage;
  NetworkErrorCode errorCode;

  factory NetworkExceptions.responseError(String error , String message ) => ResponseErrorException (error , message);
  factory NetworkExceptions.noInternetConnection() => NoInternetConnectionException();
  factory NetworkExceptions.unexpected() => UnexpectedException();
  factory NetworkExceptions.httpException(DioException exception) => NetworkHttpException(exception);
  factory NetworkExceptions.message(String message) => MessageException(message);

  NetworkExceptions({this.errorCode = NetworkErrorCode.UNKNOW  , this.errorMessage = '' , this.serverMessage = '' });

  factory NetworkExceptions.none() => Noexception();

  void invalid() {
    errorCode = NetworkErrorCode.UNKNOW;
    errorMessage = '';
    serverMessage = '';
  }

  // Pthuc được tạo để nhận vào response và trả về instance của class ResponseErrorException
  static NetworkExceptions parseErrorResponse(ApiResponse response) {
    final serverErrorCode = response.code ?? '';
    final serverErrorMessage = response.message ?? '';
    return NetworkExceptions.responseError(serverErrorCode, serverErrorMessage);
  }

  NetworkExceptions copy() {
    return NetworkExceptions(
        errorCode: errorCode, errorMessage: errorMessage, serverMessage: serverMessage);
  }

   static NetworkExceptions parseException(exception) {
    if (exception is NetworkExceptions) {
      return exception;
    } else if (exception is DioException) {
      // Ignore error when the request is cancelled
      if (exception.type == DioExceptionType.cancel) {
        return NetworkExceptions.none();
      }
      // Network connection issue
      if (exception.type == DioExceptionType.connectionError) {
        return NetworkExceptions.noInternetConnection();
      }
      if (exception.type == DioExceptionType.sendTimeout ||
          exception.type == DioExceptionType.receiveTimeout ||
          exception.type == DioExceptionType.connectionTimeout) {
        return NetworkExceptions.message(R.strings.error_service_unavailable);
      }
      // Sever error
      final serverError = _parseServerError(exception);
      if (serverError != null) {
        return NetworkExceptions.responseError(serverError.code, serverError.message);
      }
      // Http error
      return NetworkExceptions.httpException(exception);
    } else {
      if (kDebugMode) {
        return NetworkExceptions.message(exception.toString());
      } else {
        return NetworkExceptions.unexpected();
      }
    }
  }
  
}

 

ErrorDto 
? _parseServerError(DioException dioException) {
  try {
    final data = dioException.response?.data;
    return ErrorDto.fromJson(data);
  } catch (_) {}
  return null;
}

class NetworkHttpException extends NetworkExceptions {
  NetworkHttpException(DioException exception) : super(errorMessage: _errorMessage(exception));
  // DioException được ném ra khi có một lỗi xảy ra trong quá trình gửi hoặc nhận yêu cầu HTTP
  // Kết hợp và sử dụng đối với HttpStatus để có thể trả về các statusCode thông thường từ trên server trả về . 
  static String _errorMessage(DioException exception) {
    return switch (exception.response?.statusCode) {
      HttpStatus.unauthorized => R.strings.error_unauthorized_request,
      HttpStatus.internalServerError => R.strings.error_internet_server_error,
      HttpStatus.serviceUnavailable => R.strings.error_service_unavailable,
      HttpStatus.requestTimeout => R.strings.error_service_unavailable,
      HttpStatus.notFound => R.strings.error_bad_request,
      HttpStatus.badRequest => R.strings.error_bad_request,
      _ => kDebugMode
          ? R.strings.error_invalid_status_code(
               exception.response?.statusCode?.toString() ?? '', exception.message ?? '')
          : R.strings.error_unexpected_error,
    };
  }
}

class Noexception extends NetworkExceptions {
  Noexception();
}

class NoException extends NetworkExceptions {
  NoException() : super();
}

class NoInternetConnectionException extends NetworkExceptions {
  NoInternetConnectionException() : super(errorMessage: R.strings.error_no_network_connection);
}

class UnexpectedException extends NetworkExceptions {
  UnexpectedException() : super(errorMessage: R.strings.error_unexpected_error);
}

class ResponseErrorException extends NetworkExceptions {
  // class này chính là nơi để thực hiện việc trả về các ErrorMessage và errorCode từ response . 
  ResponseErrorException(String errorCode, String serverErrorMessage)
      : super(
          errorCode: NetworkErrorCode.fromcode(errorCode),
          errorMessage: NetworkErrorCode.getErrorMessage(errorCode, serverErrorMessage),
          serverMessage: serverErrorMessage,
        );
}

class MessageException extends NetworkExceptions {
  MessageException(String message) : super(errorMessage: message);
}

