import 'package:flutter/widgets.dart';
import 'package:rcp_dashboard/core/l10n/app_localizations.dart';

extension BuildContextExt on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
