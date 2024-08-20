import 'package:freezed_annotation/freezed_annotation.dart';

part 'drop_data.freezed.dart';
part 'drop_data.g.dart';

@freezed
abstract class DropData with _$DropData {
  factory DropData({
    required String label,
    required String value,
  }) = _DropData;

  factory DropData.fromJson(Map<String, dynamic> json) =>
      _$DropDataFromJson(json);
}
