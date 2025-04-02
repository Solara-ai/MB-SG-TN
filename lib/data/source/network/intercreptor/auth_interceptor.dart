import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/data/dto/auth_token_dto.dart';
import 'package:schedule_gen_and_time_management/data/source/network/app_client.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/network_constant.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/network_extension.dart';
import 'package:schedule_gen_and_time_management/data/source/network/response/api_response.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/auth/session_usecase.dart';
import 'package:schedule_gen_and_time_management/src/utils/extensions/string_extension.dart';

class AuthInterceptor extends QueuedInterceptorsWrapper {
  final SessionUsecase _sessionUsecase = GetIt.I<SessionUsecase>();

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = _sessionUsecase.authToken;
    options.addAuthHeader(token);
    options.addAdditionalHeader();
    return handler.next(options);
  }

  @override
  Future<void> onError(DioException error, ErrorInterceptorHandler handler) async {
    // Kiểm tra lỗi 401 (Unauthorized) và 403 (Forbidden)
    if (error.response?.statusCode == HttpStatus.unauthorized ||
        error.response?.statusCode == HttpStatus.forbidden) {
      final authToken = _sessionUsecase.authToken;
      final requestToken = error.requestOptions.headers[ApiHeaders.AUTHORIZATION] as String?;

      if (authToken.isNullOrEmpty() && !requestToken.isNullOrEmpty()) {
        return handler.reject(
            DioException.requestCancelled(requestOptions: RequestOptions(), reason: 'Cancel'));
      }

      if (authToken.isNullOrEmpty() || requestToken.isNullOrEmpty()) {
        return handler.next(error);
      }

      if (authToken.bearerToken != requestToken) {
        return _retryRequest(error, handler, authToken);
      }

      final refreshToken = _sessionUsecase.refreshToken;
      if (!refreshToken.isNullOrEmpty()) {
        final result = await _refreshAccessToken(refreshToken);
        if (result.isSuccess) {
          return _retryRequest(error, handler, result.tokenData!.token);
        } else {
          return handler.reject(result.error!);
        }
      } else {
        return handler.reject(
            DioException.requestCancelled(requestOptions: RequestOptions(), reason: 'Cancel'));
      }
    } else {
      return handler.next(error);
    }
  }

  Future<({bool isSuccess, AuthTokenDto? tokenData, DioException? error})> _refreshAccessToken(
      String? refreshToken) async {
    Response<dynamic>? response;
    try {
      final token = _sessionUsecase.authToken;
      final tokenDio = AppClient.createDio(token: token);
      response = await tokenDio
          .post('/api/v1/solara/users/auth/refresh', data: {'refreshToken': refreshToken});
      final dataModel = ApiResponse<AuthTokenDto>.fromJson(
        response.data,
        (json) => AuthTokenDto.fromJson(json! as Map<String, dynamic>),
      );
      final tokenModel = dataModel.data!;
      await _sessionUsecase.saveToken(tokenModel.token, tokenModel.refreshToken);
      return (isSuccess: true, tokenData: tokenModel, error: null);
    } catch (error) {
      if (error is DioException) {
        return (isSuccess: false, tokenData: null, error: error);
      }
      return (
        isSuccess: false,
        tokenData: null,
        error: DioException.badResponse(
          statusCode: HttpStatus.badRequest,
          requestOptions: RequestOptions(),
          response: response ?? Response(requestOptions: RequestOptions()),
        )
      );
    }
  }

  Future<void> _retryRequest(
      DioException error, ErrorInterceptorHandler handler, String? token) async {
    final retryDio = AppClient.createDio(token: token);
    error.requestOptions.addAuthHeader(token);
    error.requestOptions.addAdditionalHeader();
    try {
      final result = await retryDio.fetch(error.requestOptions);
      return handler.resolve(result);
    } catch (e) {
      return handler.reject(error);
    }
  }
}
