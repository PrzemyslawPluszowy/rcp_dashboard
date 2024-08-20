// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_logic_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ThemeLogicState {
  FlexScheme get scheme => throw _privateConstructorUsedError;
  ThemeMode get mode => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FlexScheme scheme, ThemeMode mode) changeTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FlexScheme scheme, ThemeMode mode)? changeTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FlexScheme scheme, ThemeMode mode)? changeTheme,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeTheme value) changeTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeTheme value)? changeTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeTheme value)? changeTheme,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ThemeLogicState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThemeLogicStateCopyWith<ThemeLogicState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeLogicStateCopyWith<$Res> {
  factory $ThemeLogicStateCopyWith(
          ThemeLogicState value, $Res Function(ThemeLogicState) then) =
      _$ThemeLogicStateCopyWithImpl<$Res, ThemeLogicState>;
  @useResult
  $Res call({FlexScheme scheme, ThemeMode mode});
}

/// @nodoc
class _$ThemeLogicStateCopyWithImpl<$Res, $Val extends ThemeLogicState>
    implements $ThemeLogicStateCopyWith<$Res> {
  _$ThemeLogicStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThemeLogicState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scheme = null,
    Object? mode = null,
  }) {
    return _then(_value.copyWith(
      scheme: null == scheme
          ? _value.scheme
          : scheme // ignore: cast_nullable_to_non_nullable
              as FlexScheme,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChangeThemeImplCopyWith<$Res>
    implements $ThemeLogicStateCopyWith<$Res> {
  factory _$$ChangeThemeImplCopyWith(
          _$ChangeThemeImpl value, $Res Function(_$ChangeThemeImpl) then) =
      __$$ChangeThemeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FlexScheme scheme, ThemeMode mode});
}

/// @nodoc
class __$$ChangeThemeImplCopyWithImpl<$Res>
    extends _$ThemeLogicStateCopyWithImpl<$Res, _$ChangeThemeImpl>
    implements _$$ChangeThemeImplCopyWith<$Res> {
  __$$ChangeThemeImplCopyWithImpl(
      _$ChangeThemeImpl _value, $Res Function(_$ChangeThemeImpl) _then)
      : super(_value, _then);

  /// Create a copy of ThemeLogicState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scheme = null,
    Object? mode = null,
  }) {
    return _then(_$ChangeThemeImpl(
      null == scheme
          ? _value.scheme
          : scheme // ignore: cast_nullable_to_non_nullable
              as FlexScheme,
      null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ));
  }
}

/// @nodoc

class _$ChangeThemeImpl implements _ChangeTheme {
  const _$ChangeThemeImpl(this.scheme, this.mode);

  @override
  final FlexScheme scheme;
  @override
  final ThemeMode mode;

  @override
  String toString() {
    return 'ThemeLogicState.changeTheme(scheme: $scheme, mode: $mode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeThemeImpl &&
            (identical(other.scheme, scheme) || other.scheme == scheme) &&
            (identical(other.mode, mode) || other.mode == mode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, scheme, mode);

  /// Create a copy of ThemeLogicState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeThemeImplCopyWith<_$ChangeThemeImpl> get copyWith =>
      __$$ChangeThemeImplCopyWithImpl<_$ChangeThemeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FlexScheme scheme, ThemeMode mode) changeTheme,
  }) {
    return changeTheme(scheme, mode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FlexScheme scheme, ThemeMode mode)? changeTheme,
  }) {
    return changeTheme?.call(scheme, mode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FlexScheme scheme, ThemeMode mode)? changeTheme,
    required TResult orElse(),
  }) {
    if (changeTheme != null) {
      return changeTheme(scheme, mode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeTheme value) changeTheme,
  }) {
    return changeTheme(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeTheme value)? changeTheme,
  }) {
    return changeTheme?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeTheme value)? changeTheme,
    required TResult orElse(),
  }) {
    if (changeTheme != null) {
      return changeTheme(this);
    }
    return orElse();
  }
}

abstract class _ChangeTheme implements ThemeLogicState {
  const factory _ChangeTheme(final FlexScheme scheme, final ThemeMode mode) =
      _$ChangeThemeImpl;

  @override
  FlexScheme get scheme;
  @override
  ThemeMode get mode;

  /// Create a copy of ThemeLogicState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeThemeImplCopyWith<_$ChangeThemeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
