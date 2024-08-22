import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rcp_dashboard/main.dart';
import 'package:rcp_dashboard/main_export.dart';
import 'package:rcp_dashboard/src/features/auth/data/auth_service.dart';
import 'package:rcp_dashboard/src/features/auth/exceptions/auth_exceptions.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

enum AuthExceptions {
  unAuthorized,
  server,
  unknown;

  String getTranslated(BuildContext context) {
    switch (this) {
      case AuthExceptions.unAuthorized:
        return context.l10n.invalidCredential;
      case AuthExceptions.server:
        return context.l10n.serverError;
      case AuthExceptions.unknown:
        return context.l10n.unknownError;
    }
  }
}

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required this.authService,
  }) : super(const LoginState.initial());

  final AuthService authService;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(const LoginState.loading());
    try {
      await authService.login(email: email, password: password);
      await authService.fetchUser();
      AuthService.authStatusStream.sink.add(AuthStatus.authenticated);
      router.refresh();

      emit(const LoginState.success());
    } on UnAuthorizedExceptions catch (_) {
      AuthService.authStatusStream.sink.add(AuthStatus.unauthenticated);
      emit(
        const LoginState.error(AuthExceptions.unAuthorized),
      );
    } on ServerExceptions catch (_) {
      emit(
        const LoginState.error(AuthExceptions.server),
      );
    } on UnknownExceptions catch (_) {
      emit(
        const LoginState.error(AuthExceptions.unknown),
      );
    } catch (e, s) {
      logE.error(e, s);
      emit(
        const LoginState.error(AuthExceptions.unknown),
      );
    }
  }
}
