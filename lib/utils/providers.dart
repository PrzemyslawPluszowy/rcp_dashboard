import 'package:rcp_dashboard/main_export.dart';
import 'package:rcp_dashboard/src/features/auth/ui/cubit/login_cubit.dart';

class Providers {
  static List<BlocProvider<dynamic>> getBlocProviders() {
    return [
      BlocProvider<ThemeLogicCubit>(
        lazy: false,
        create: (_) => ThemeLogicCubit(),
      ),
      BlocProvider<LoginCubit>(
        create: (_) => LoginCubit(authService: getIt.call()),
      ),
    ];
  }
}
