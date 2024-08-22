import 'dart:async';

import 'package:dio/dio.dart';
import 'package:rcp_dashboard/src/features/auth/models/login_response.dart';
import 'package:rcp_dashboard/src/features/auth/models/user.dart';
import 'package:rcp_dashboard/src/features/auth/models/user_payload.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_repository.g.dart';

@RestApi()
abstract class AuthRepo {
  factory AuthRepo(
    Dio dio, {
    String baseUrl,
  }) = _AuthRepo;

  @POST('/api/auth/login')
  Future<TokensResponse> login({
    @Body() required UserPayload userLogin,
  });

  @GET('/api/profile')
  Future<User> getUser();

  @GET('/api/auth/refresh')
  Future<TokensResponse> refreshToken();
}
