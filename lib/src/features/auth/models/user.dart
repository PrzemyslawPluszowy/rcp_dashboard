import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory User({
    required int id,
    required String firstName,
    required String lastName,
    String? email,
    String? province,
    String? postalCode,
    String? city,
    String? street,
    String? buildingNumber,
    String? apartmentNumber,
    String? businessPhone,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}


///{
///  "id": 0,
/// "first_name": "string",
///  "last_name": "string",
///  "email": "string",
///  "province": "string",
///  "postal_code": "string",
///  "city": "string",
///  "street": "string",
/// "building_number": "string",
/// "business_phone": "string",

///  "apartment_number": "string"}
///
