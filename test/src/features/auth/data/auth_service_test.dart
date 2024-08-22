import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rcp_dashboard/core/dio_helper.dart';
import 'package:rcp_dashboard/src/features/auth/data/auth_hive_repository.dart';
import 'package:rcp_dashboard/src/features/auth/data/auth_repository.dart';
import 'package:rcp_dashboard/src/features/auth/data/auth_service.dart';
import 'package:rcp_dashboard/src/features/auth/models/login_response.dart';
import 'package:rcp_dashboard/src/features/auth/models/user.dart';
import 'package:rcp_dashboard/src/features/auth/models/user_payload.dart';

class FakeTokensResponseHive extends Fake implements TokensResponseHive {}

class MockAuthRepo extends Mock implements AuthRepo {}

class MockTokenHiveRepository extends Mock implements TokenHiveRepository {}

void main() {
  late AuthService authService;
  late MockAuthRepo mockAuthRepo;
  late MockTokenHiveRepository mockTokenRepository;

  setUpAll(() {
    registerFallbackValue(FakeTokensResponseHive());
    registerFallbackValue(
      const UserPayload(email: 'test@test.com', password: 'password'),
    );
    registerFallbackValue(
      RequestOptions(),
    ); // Dodanie domyślnego RequestOptions
  });

  setUp(() {
    mockAuthRepo = MockAuthRepo();
    mockTokenRepository = MockTokenHiveRepository();
    authService = AuthService(
      authRepo: mockAuthRepo,
      tokenRepository: mockTokenRepository,
    );
  });

  group('AuthService', () {
    test('Powinien poprawnie odświeżyć token i ustawić nagłówek authorization',
        () async {
      when(
        () => mockAuthRepo.login(
          userLogin: any(named: 'userLogin'),
        ),
      ).thenAnswer(
        (_) async => const TokensResponse(
          accessToken: 'token',
          refreshToken: 'refreshToken',
        ),
      );

      when(
        () => mockTokenRepository.saveToken(any()),
      ).thenAnswer((_) async => Future.value());

      await authService.login(email: 'test@test.com', password: 'password');

      expect(
        DioHelper.instance.options.headers['authorization'],
        'Bearer token',
      );

      verify(() => mockTokenRepository.saveToken(any())).called(1);

      when(() => mockAuthRepo.getUser()).thenAnswer(
        (_) async => const User(
          firstName: 'adam',
          lastName: 'kowalski',
          id: 1,
          email: 'test@test.com',
        ),
      );

      // Dokładniejsza konfiguracja DioException
      final dioError = DioException(
        requestOptions: RequestOptions(path: '/api/profile'),
        response: Response(
          statusCode: 401,
          requestOptions: RequestOptions(path: '/api/profile'),
        ),
        type: DioExceptionType.badResponse,
      );

      // Mockowanie błędu 401
      when(() => mockAuthRepo.getUser()).thenThrow(dioError);

      // Mockowanie odświeżenia tokena
      when(() => mockTokenRepository.getToken()).thenAnswer(
        (_) async => const TokensResponseHive(
          accessToken: 'refresh_token',
          refreshToken: 'refresh_token',
        ),
      );

      when(() => mockAuthRepo.refreshToken()).thenAnswer(
        (_) async => const TokensResponse(
          accessToken: 'new_token',
          refreshToken: 'new_token',
        ),
      );
    });
  });
}
