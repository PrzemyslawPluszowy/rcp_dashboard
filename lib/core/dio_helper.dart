import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:rcp_dashboard/core/di.dart';
import 'package:rcp_dashboard/src/features/auth/data/auth_hive_repository.dart';
import 'package:rcp_dashboard/src/features/auth/data/auth_repository.dart';
import 'package:rcp_dashboard/src/features/auth/models/login_response.dart';

class DioHelper {
  DioHelper._privateConstructor();

  static final Dio _dio = Dio()
    ..interceptors.add(InterceptorsWrapper())
    ..options = BaseOptions(
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
      },
    )
    ..interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
      ),
    );

  static Dio get instance => _dio;

  String get getBaseUrl => _dio.options.baseUrl;

  static void setBearer(String token) {
    _dio.options.headers['authorization'] = 'Bearer $token';
  }

  static Future<void> setupInterceptors() async {
    Future<void> handleUnauthorizedError(
      DioException e,
      ErrorInterceptorHandler handler,
    ) async {
      if (e.response?.statusCode == 401) {
        final authRepo = getIt<AuthRepo>();
        final tokenRepository = getIt<TokenHiveRepository>();
        _dio.interceptors.clear();
        _dio.interceptors.add(_addLoggerInterceptor());
        final res = await tokenRepository.getToken();
        if (res != null) {
          setBearer(res.refreshToken);
          final newToken = await authRepo.refreshToken();
          await tokenRepository.saveToken(
            newToken.toTokenResponseHive(),
          );
          setBearer(newToken.accessToken);
          await setupInterceptors();
        } else {
          _dio.interceptors.clear();
        }

        handler.resolve(await _dio.fetch(e.requestOptions));
      } else {
        handler.next(e);
      }
      return;
    }

    _dio.interceptors.add(_addLoggerInterceptor());
    _dio.interceptors
        .add(InterceptorsWrapper(onError: handleUnauthorizedError));
  }

  static PrettyDioLogger _addLoggerInterceptor() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
    );
  }
}
