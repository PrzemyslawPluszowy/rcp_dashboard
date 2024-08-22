import 'dart:async';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:rcp_dashboard/core/config.dart';
import 'package:rcp_dashboard/src/features/auth/data/auth_hive_repository.dart';
import 'package:rcp_dashboard/src/features/auth/data/auth_repository.dart';
import 'package:rcp_dashboard/src/features/auth/exceptions/auth_exceptions.dart';
import 'package:rcp_dashboard/src/features/auth/models/login_response.dart';
import 'package:rcp_dashboard/src/features/auth/models/user.dart';
import 'package:rcp_dashboard/src/features/auth/models/user_payload.dart';
import 'package:rxdart/rxdart.dart';
import 'package:talker/talker.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
}

class AuthService {
  AuthService({
    required this.authRepo,
    required this.dio,
    required this.tokenRepository,
  }) {
    authStatusStream =
        BehaviorSubject<AuthStatus>.seeded(AuthStatus.unauthenticated);
  }
  final AuthRepo authRepo;
  final TokenHiveRepository tokenRepository;

  final Dio dio;
  static late User userPayload;
  static User get user => userPayload;
  static late final BehaviorSubject<AuthStatus> authStatusStream;
  String get setUpBaseUrl => dio.options.baseUrl;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      dio.options.baseUrl = Config.baseUrl;
      final res = await authRepo.login(
        userLogin: UserPayload(
          email: email,
          password: password,
        ),
      );

      await tokenRepository.saveToken(
        res.toTokenResponseHive(),
      );
      setUpBearer(res.accessToken);
      await setupInterceptors();
    } on DioException catch (e, s) {
      Talker().warning(e, s);

      if (e.response?.statusCode == 401) {
        throw UnAuthorizedExceptions();
      } else if (e.response?.statusCode == 500) {
        throw ServerExceptions();
      } else {
        throw UnknownExceptions();
      }
    }
  }

  Future<User> fetchUser() async {
    try {
      final user = await authRepo.getUser();
      userPayload = user;

      return user;
    } on DioException catch (e, s) {
      Talker().warning(e, s);

      if (e.response?.statusCode == 422) {
        throw UnAuthorizedExceptions();
      } else if (e.response?.statusCode == 500) {
        throw ServerExceptions();
      } else {
        throw UnknownExceptions();
      }
    }
  }

  Future<void> autoLogin() async {
    dio.options.baseUrl = Config.baseUrl;
    final token = await tokenRepository.getToken();
    if (token != null) {
      setUpBearer(token.accessToken);
      await setupInterceptors();
      await fetchUser();
      authStatusStream.add(AuthStatus.authenticated);
    } else {
      authStatusStream.add(AuthStatus.unauthenticated);
    }
  }

  Future<void> setupInterceptors() async {
    Future<void> handleUnauthorizedError(
      DioException e,
      ErrorInterceptorHandler handler,
    ) async {
      if (e.response?.statusCode == 401) {
        dio.interceptors.clear();
        dio.interceptors.add(addLoggerInterceptor());
        final res = await tokenRepository.getToken();
        if (res != null) {
          setUpBearer(res.refreshToken);
          final newToken = await authRepo.refreshToken();
          await tokenRepository.saveToken(
            newToken.toTokenResponseHive(),
          );
          setUpBearer(newToken.accessToken);
          await setupInterceptors();
        } else {
          dio.interceptors.clear();
        }

        handler.resolve(await dio.fetch(e.requestOptions));
      } else {
        handler.next(e);
      }
      return;
    }

    dio.interceptors.add(addLoggerInterceptor());
    dio.interceptors.add(InterceptorsWrapper(onError: handleUnauthorizedError));
  }

  Future<void> logOut() async {
    await tokenRepository.clearTokens();
    authStatusStream.add(AuthStatus.unauthenticated);
    dio.interceptors.clear();
  }

  void setUpBearer(String token) {
    dio.options.headers['authorization'] = 'Bearer $token';
  }

  PrettyDioLogger addLoggerInterceptor() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
    );
  }
}
