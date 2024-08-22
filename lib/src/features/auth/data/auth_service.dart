import 'dart:async';

import 'package:dio/dio.dart';
import 'package:rcp_dashboard/core/dio_helper.dart';
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
    required this.tokenRepository,
  }) {
    authStatusStream =
        BehaviorSubject<AuthStatus>.seeded(AuthStatus.unauthenticated);
  }
  final AuthRepo authRepo;
  final TokenHiveRepository tokenRepository;

  static late User userPayload;
  static User get user => userPayload;
  static late final BehaviorSubject<AuthStatus> authStatusStream;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      final res = await authRepo.login(
        userLogin: UserPayload(
          email: email,
          password: password,
        ),
      );

      await tokenRepository.saveToken(
        res.toTokenResponseHive(),
      );
      DioHelper.setBearer(res.accessToken);
      await DioHelper.setupInterceptors();
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
    final token = await tokenRepository.getToken();
    if (token != null) {
      DioHelper.setBearer(token.accessToken);
      await DioHelper.setupInterceptors();
      await fetchUser();
      authStatusStream.add(AuthStatus.authenticated);
    } else {
      authStatusStream.add(AuthStatus.unauthenticated);
    }
  }

  Future<void> logOut() async {
    await tokenRepository.clearTokens();
    authStatusStream.add(AuthStatus.unauthenticated);
  }
}
