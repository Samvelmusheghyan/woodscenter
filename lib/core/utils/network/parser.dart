import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';

import 'api_wrapper.dart';

Future<ApiWrapper<T>> parseHttpResponse<T>(Function function, List<dynamic> arguments) async {
  try {
    final HttpResponse<T?> result = await Function.apply(function, arguments);
    final statusCode = result.response.statusCode;
    final body = result.data;
    final bool isSuccessful = statusCode != null && statusCode >= 200 && statusCode <= 299;
    if (isSuccessful) {
      return ApiWrapper.success(value: body);
    } else {
      return ApiWrapper.error(code: statusCode, error: "");
    }
  } on DioException catch (e) {
    final ApiWrapper<T> error;
    if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout || e.type == DioExceptionType.sendTimeout || e.type == DioExceptionType.connectionError) {
      error = NetworkError();
    } else {
      error = ApiWrapper.unknownError();
    }
    return error;
  } catch (e) {
    return ApiWrapper.unknownError();
  }
}
