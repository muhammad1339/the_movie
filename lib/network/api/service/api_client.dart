import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:path_provider/path_provider.dart';
import '../../../utils/logger.dart';
import '../api.dart';

// Global options
final cacheOptions = CacheOptions(
  // A default store is required for interceptor.
  store: MemCacheStore(),
  // All subsequent fields are optional.
  // Default.
  policy: CachePolicy.refresh,

  // Returns a cached response on error but for statuses 401 & 403.
  // Also allows to return a cached response on network errors (e.g. offline usage).
  // Defaults to [null].
  hitCacheOnErrorExcept: [401, 403, 500],
  // Overrides any HTTP directive to delete entry past this duration.
  // Useful only when origin server has no cache config or custom behaviour is desired.
  // Defaults to [null].
  maxStale: const Duration(days: 1),
  // Default. Allows 3 cache sets and ease cleanup.
  priority: CachePriority.high,
  // Default. Body and headers encryption with your own algorithm.
  cipher: null,
  // Default. Key builder to retrieve requests.
  keyBuilder: (request) {
    return request.uri.toString();
  },
  // Default. Allows to cache POST requests.
  // Overriding [keyBuilder] is strongly recommended when [true].
  allowPostMethod: true,
);

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
    Directory? cacheDir;
    Future.delayed(Duration.zero, () async {
      cacheDir = await getTemporaryDirectory();
      HiveCacheStore(
        cacheDir?.path,
        hiveBoxName: "your_app_name",
      );
    });
    var dio = Dio()
      ..interceptors.addAll(
        [
          HttpFormatter(
            logger: logger,
            includeResponseHeaders: false,
          ),
          DioCacheInterceptor(
            options: cacheOptions
              ..copyWith(
                store: HiveCacheStore(cacheDir?.path, hiveBoxName: "the_movie"),
              ),
          ),
        ],
      )
      ..options = baseOptions;

    return dio;
  }
}
