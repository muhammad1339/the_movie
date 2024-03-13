import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import '../../../utils/logger.dart';
import '../api.dart';

class ApiClient {
  ApiClient._();

  static final instance = ApiClient._();

  final int _timeOut = 60000;

  Dio getApiClient() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: ServiceConst.baseUrl,
      connectTimeout: Duration(milliseconds: _timeOut),
      receiveTimeout: Duration(milliseconds: _timeOut),
      sendTimeout: Duration(milliseconds: _timeOut),
    );
    // initialize dio client object
    var dio = Dio()
      ..interceptors.addAll(
        [
          // LoggerInterceptor.instance,
          HttpFormatter(
            logger: logger,
            includeResponseHeaders: false,
          ),
        ],
      )
      ..options = baseOptions;

    return dio;
  }
}
