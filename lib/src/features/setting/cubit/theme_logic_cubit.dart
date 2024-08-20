import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:rcp_dashboard/main.dart';

part 'theme_logic_cubit.freezed.dart';
part 'theme_logic_state.dart';

class ThemeLogicCubit extends HydratedCubit<ThemeLogicState> {
  ThemeLogicCubit()
      : super(
          const ThemeLogicState.changeTheme(
            FlexScheme.bigStone,
            ThemeMode.light,
          ),
        );
  void changeTheme(FlexScheme? scheme) {
    try {
      final nextScheme = scheme ?? FlexScheme.bigStone;
      emit(
        ThemeLogicState.changeTheme(
          nextScheme,
          state.mode,
        ),
      );
    } catch (e) {
      emit(
        ThemeLogicState.changeTheme(
          FlexScheme.hippieBlue,
          state.mode,
        ),
      );
    }
  }

  void changeMode(ThemeMode? mode) {
    emit(ThemeLogicState.changeTheme(state.scheme, mode ?? ThemeMode.light));
  }

  @override
  ThemeLogicState? fromJson(Map<String, dynamic> json) {
    try {
      final scheme = FlexScheme.values[json['scheme'] as int];
      final mode = ThemeMode.values[json['mode'] as int];
      return ThemeLogicState.changeTheme(scheme, mode);
    } catch (e, s) {
      logE.error(e, s);
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeLogicState state) {
    try {
      return {
        'scheme': state.scheme.index,
        'mode': state.mode.index,
      };
    } catch (e, s) {
      logE.error(e, s);

      return null;
    }
  }
}
