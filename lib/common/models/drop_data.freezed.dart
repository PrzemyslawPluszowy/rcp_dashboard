// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drop_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DropData _$DropDataFromJson(Map<String, dynamic> json) {
  return _DropData.fromJson(json);
}

/// @nodoc
mixin _$DropData {
  String get label => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DropDataCopyWith<DropData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DropDataCopyWith<$Res> {
  factory $DropDataCopyWith(DropData value, $Res Function(DropData) then) =
      _$DropDataCopyWithImpl<$Res, DropData>;
  @useResult
  $Res call({String label, String value});
}

/// @nodoc
class _$DropDataCopyWithImpl<$Res, $Val extends DropData>
    implements $DropDataCopyWith<$Res> {
  _$DropDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DropDataImplCopyWith<$Res>
    implements $DropDataCopyWith<$Res> {
  factory _$$DropDataImplCopyWith(
          _$DropDataImpl value, $Res Function(_$DropDataImpl) then) =
      __$$DropDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, String value});
}

/// @nodoc
class __$$DropDataImplCopyWithImpl<$Res>
    extends _$DropDataCopyWithImpl<$Res, _$DropDataImpl>
    implements _$$DropDataImplCopyWith<$Res> {
  __$$DropDataImplCopyWithImpl(
      _$DropDataImpl _value, $Res Function(_$DropDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
  }) {
    return _then(_$DropDataImpl(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DropDataImpl implements _DropData {
  _$DropDataImpl({required this.label, required this.value});

  factory _$DropDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DropDataImplFromJson(json);

  @override
  final String label;
  @override
  final String value;

  @override
  String toString() {
    return 'DropData(label: $label, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DropDataImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, label, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DropDataImplCopyWith<_$DropDataImpl> get copyWith =>
      __$$DropDataImplCopyWithImpl<_$DropDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DropDataImplToJson(
      this,
    );
  }
}

abstract class _DropData implements DropData {
  factory _DropData(
      {required final String label,
      required final String value}) = _$DropDataImpl;

  factory _DropData.fromJson(Map<String, dynamic> json) =
      _$DropDataImpl.fromJson;

  @override
  String get label;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$DropDataImplCopyWith<_$DropDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
