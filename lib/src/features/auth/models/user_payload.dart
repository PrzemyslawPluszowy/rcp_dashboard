import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_payload.freezed.dart';
part 'user_payload.g.dart';

@freezed
// @JsonSerializable(fieldRename: FieldRename.snake)
class UserPayload with _$UserPayload {
  @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory UserPayload({
    required String email,
    required String password,
    String? fcmToken,
  }) = _UserPayload;

  factory UserPayload.fromJson(Map<String, dynamic> json) =>
      _$UserPayloadFromJson(json);
}
