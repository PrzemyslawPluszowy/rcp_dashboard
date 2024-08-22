import 'package:rcp_dashboard/main_export.dart';

class Validators {
  static String? email(String? value, BuildContext context) {
    if (value!.isEmpty) {
      return context.l10n.cantBeEmpty;
    }
    if (value.length > 255) {
      return context.l10n.formToLong;
    }
    if (value.endsWith(' ') || value.startsWith(' ')) {
      return context.l10n.formWhiteSpace;
    }

    if (!value.contains('@')) {
      return context.l10n.emailNotValid;
    }

    return null;
  }

  static String? password(String? value, BuildContext context) {
    if (value!.isEmpty) {
      return context.l10n.passwordToShort;
    }
    if (value.length < 8) {
      return context.l10n.passwordToShort;
    }
    if (value.length > 255) {
      return context.l10n.formToLong;
    }
    if (value.endsWith(' ') || value.startsWith(' ')) {
      return context.l10n.formWhiteSpace;
    }

    return null;
  }

  static String? name(String? value, BuildContext context) {
    if (value!.isEmpty) {
      return context.l10n.cantBeEmpty;
    }
    if (value.length < 3) {
      return context.l10n.formToShort3;
    }
    if (value.length > 255) {
      return context.l10n.formToLong;
    }
    if (value.endsWith(' ') || value.startsWith(' ')) {
      return context.l10n.formWhiteSpace;
    }
    return null;
  }

  static String? standard(String? value, BuildContext context) {
    if (value!.isEmpty) {
      return context.l10n.cantBeEmpty;
    }
    if (value.length > 255) {
      return context.l10n.formToLong;
    }
    if (value.endsWith(' ') || value.startsWith(' ')) {
      return context.l10n.formWhiteSpace;
    }
    return null;
  }

  static String? urlInput(String? value, BuildContext context) {
    if (value!.isEmpty) {
      return context.l10n.cantBeEmpty;
    }
    if (value.length > 255) {
      return context.l10n.formToLong;
    }
    if (value.endsWith(' ') || value.startsWith(' ')) {
      return context.l10n.formWhiteSpace;
    }
    if (!value.startsWith('https://')) {
      return 'Nie poprawny link';
    }
    return null;
  }

  static String? digitOnly(
    String? value,
    BuildContext context, {
    bool isRequired = false,
  }) {
    if (!isRequired && value!.isEmpty) {
      return null;
    }
    if (value!.isEmpty) {
      return context.l10n.cantBeEmpty;
    }
    if (value.length > 255) {
      return context.l10n.formToLong;
    }
    if (value.endsWith(' ') || value.startsWith(' ')) {
      return context.l10n.formWhiteSpace;
    }
    if (!RegExp(r'^[0-9]*$').hasMatch(value)) {
      return 'To pole moze zawierac tylko liczby';
    }
    return null;
  }

  static String? postalCode(String? value, BuildContext context) {
    if (value!.isEmpty) {
      return context.l10n.cantBeEmpty;
    }
    if (value.length > 6) {
      return context.l10n.formToLong;
    }
    if (value.endsWith(' ') || value.startsWith(' ')) {
      return context.l10n.formWhiteSpace;
    }
    // myslink + digit
    if (!RegExp(r'^[0-9]{2}-[0-9]{3}$').hasMatch(value)) {
      return 'Niepoprawny kod pocztowy';
    }
    return null;
  }

  static String? none(
    String? value,
    BuildContext context,
  ) {
    return null;
  }
}
