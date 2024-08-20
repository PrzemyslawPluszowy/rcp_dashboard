import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rcp_dashboard/src/features/setting/cubit/theme_logic_cubit.dart';
import 'package:rcp_dashboard/utils/app_sizes.dart';
import 'package:rcp_dashboard/utils/extension/l10n.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(context.l10n.settings),
      ),
      body: BlocBuilder<ThemeLogicCubit, ThemeLogicState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                gapH12,
                _selectTheme(context, state),
                gapH24,
                _selectModeColor(context, state),
              ],
            ),
          );
        },
      ),
    );
  }

  ConstrainedBox _selectTheme(BuildContext context, ThemeLogicState state) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: 200),
      child: DropdownButtonFormField<ThemeMode>(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: context.l10n.setThemeMode,
        ),
        value: state.mode,
        onChanged: (value) {
          context.read<ThemeLogicCubit>().changeMode(value);
        },
        items: ThemeMode.values
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(e.nameL10(context)),
              ),
            )
            .toList(),
      ),
    );
  }

  ConstrainedBox _selectModeColor(BuildContext context, ThemeLogicState state) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: 200),
      child: DropdownButtonFormField<FlexScheme>(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: context.l10n.setColorMode,
        ),
        value: state.scheme,
        onChanged: (value) {
          context.read<ThemeLogicCubit>().changeTheme(
                value,
              );
        },
        items: FlexScheme.values
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(e.name),
              ),
            )
            .toList(),
      ),
    );
  }
}

extension L10n on ThemeMode {
  String nameL10(BuildContext context) {
    switch (this) {
      case ThemeMode.system:
        return context.l10n.systemMode;
      case ThemeMode.light:
        return context.l10n.lightMode;
      case ThemeMode.dark:
        return context.l10n.darkMode;
    }
  }
}
