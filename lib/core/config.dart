import 'dart:ui';

enum Environment { dev, prod }

class ConfigApp {
  static const String appName = 'User Management';

  static const Size minimumScreenSize = Size(1386, 768);
  static const Size maximumScreenSize = Size(2560, 1440);
}

class Config {
  static const String appName = 'Smart hol';
  static const String sentryDsn =
      'https://17222c8e7beb158c56b7b94ec4171037@o4505789201252352.ingest.us.sentry.io/4507446383017984';
  static const Environment environment = Environment.prod;
  static const tokenHiveKey = 'tokenBerar';
  static const fcmTokenHiveKey = 'fcm_token';
  static late final String appVersion;

  ///******* */////

  static String? baseUrl;
}
