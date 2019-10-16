
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:dio/dio.dart';
import 'package:sora_gov_agree/constants/app_constants.dart';

class DioService {
  Dio _dio;

  DioCacheManager manager =
  DioCacheManager(CacheConfig(baseUrl: "${AppConstants.BASE_URL}"));

  DioService() {
    manager.clearExpired();
  }

  Dio getDio({header: "application/x-www-form-urlencoded", charset: "utf-8"}) {
    if (_dio == null) {
      _dio = Dio(BaseOptions(
          baseUrl: "${AppConstants.BASE_URL}",
          contentType: "$header; charset=$charset"))
        ..interceptors.add(manager.interceptor)
        ..interceptors.add(LogInterceptor(responseBody: true));
    }
    return _dio;
  }
}
