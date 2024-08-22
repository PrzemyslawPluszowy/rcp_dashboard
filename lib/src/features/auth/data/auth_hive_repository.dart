import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:rcp_dashboard/core/config.dart';
import 'package:rcp_dashboard/src/features/auth/models/login_response.dart';

class TokenHiveRepository {
  static const _boxName = 'token';
  Future<Box<TokensResponseHive>> get _box async =>
      Hive.openBox<TokensResponseHive>(_boxName);

  Future<TokensResponseHive?> getToken() async {
    final box = await _box;
    return box.get(Config.tokenHiveKey);
  }

  Future<void> saveToken(TokensResponseHive tokens) async {
    final box = await _box;
    await box.put(Config.tokenHiveKey, tokens);
  }

  Future<void> clearTokens() async {
    final box = await _box;
    await box.clear();
  }
}
