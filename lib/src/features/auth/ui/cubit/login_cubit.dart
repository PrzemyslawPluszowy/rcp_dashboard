import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rcp_dashboard/main_export.dart';
import 'package:rcp_dashboard/src/features/auth/data/auth_service.dart';
import 'package:rcp_dashboard/src/features/auth/exceptions/auth_exceptions.dart';
import 'package:talker/talker.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

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
      await authService.login(
        email: email,
        password: password,
      );
      await authService.fetchUser();
      AuthService.authStatusStream.sink.add(
        AuthStatus.authenticated,
      );
      router.refresh();

      emit(const LoginState.success());
    } on UnAuthorizedExceptions catch (_) {
      AuthService.authStatusStream.sink.add(
        AuthStatus.unauthenticated,
      );
      emit(
        const LoginState.error(
          '',
        ),
      );
    } on ServerExceptions catch (_) {
      emit(
        const LoginState.error(
          '',
        ),
      );
    } on UnknownExceptions catch (_) {
      emit(
        const LoginState.error(
          '',
        ),
      );
    } catch (e, s) {
      Talker().warning(e, s);

      emit(
        const LoginState.error(
          '',
        ),
      );
    }
  }
}
