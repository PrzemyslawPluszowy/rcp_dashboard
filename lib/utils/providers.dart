import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rcp_dashboard/src/features/setting/cubit/theme_logic_cubit.dart';

class Providers {
  static List<BlocProvider<dynamic>> getBlocProviders() {
    return [
      BlocProvider<ThemeLogicCubit>(
        lazy: false,
        create: (_) => ThemeLogicCubit(),
      ),
    ];
  }
}
