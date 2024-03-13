import 'package:dio/dio.dart';
import '../api.dart';

class LoggerInterceptor extends Interceptor {
  LoggerInterceptor._();

  static final instance = LoggerInterceptor._();

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw DioException(
        type: DioExceptionType.badResponse,
        error: HttpError(code: response.statusCode, message: response.statusMessage),
        requestOptions: response.requestOptions,
        response: Response(
          requestOptions: response.requestOptions,
          statusCode: response.statusCode,
          statusMessage: response.statusMessage,
        ),
      );
    }
    return super.onResponse(response, handler);
  }
}
