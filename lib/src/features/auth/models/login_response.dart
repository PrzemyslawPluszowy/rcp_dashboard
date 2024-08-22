import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
class TokensResponse with _$TokensResponse {
  @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory TokensResponse({
    required String accessToken,
    required String refreshToken,
  }) = _TokensResponse;

  factory TokensResponse.fromJson(Map<String, dynamic> json) =>
      _$TokensResponseFromJson(json);
}

@freezed
abstract class TokensResponseHive with _$TokensResponseHive {
  @HiveType(typeId: 0, adapterName: 'HiveTokenAdapter')
  @JsonSerializable(explicitToJson: true)
  const factory TokensResponseHive({
    @HiveField(0) required String accessToken,
    @HiveField(1) required String refreshToken,
  }) = _TokensResponseHive;

  factory TokensResponseHive.fromJson(Map<String, dynamic> json) =>
      _$TokensResponseHiveFromJson(json);
}

extension TokensResponseExtension on TokensResponse {
  TokensResponseHive toTokenResponseHive() {
    return TokensResponseHive(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}
