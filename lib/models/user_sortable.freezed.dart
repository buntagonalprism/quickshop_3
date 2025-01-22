// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_sortable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserSortKey {
  int get primary => throw _privateConstructorUsedError;
  String get secondary => throw _privateConstructorUsedError;

  /// Create a copy of UserSortKey
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserSortKeyCopyWith<UserSortKey> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSortKeyCopyWith<$Res> {
  factory $UserSortKeyCopyWith(
          UserSortKey value, $Res Function(UserSortKey) then) =
      _$UserSortKeyCopyWithImpl<$Res, UserSortKey>;
  @useResult
  $Res call({int primary, String secondary});
}

/// @nodoc
class _$UserSortKeyCopyWithImpl<$Res, $Val extends UserSortKey>
    implements $UserSortKeyCopyWith<$Res> {
  _$UserSortKeyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserSortKey
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primary = null,
    Object? secondary = null,
  }) {
    return _then(_value.copyWith(
      primary: null == primary
          ? _value.primary
          : primary // ignore: cast_nullable_to_non_nullable
              as int,
      secondary: null == secondary
          ? _value.secondary
          : secondary // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserSortKeyImplCopyWith<$Res>
    implements $UserSortKeyCopyWith<$Res> {
  factory _$$UserSortKeyImplCopyWith(
          _$UserSortKeyImpl value, $Res Function(_$UserSortKeyImpl) then) =
      __$$UserSortKeyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int primary, String secondary});
}

/// @nodoc
class __$$UserSortKeyImplCopyWithImpl<$Res>
    extends _$UserSortKeyCopyWithImpl<$Res, _$UserSortKeyImpl>
    implements _$$UserSortKeyImplCopyWith<$Res> {
  __$$UserSortKeyImplCopyWithImpl(
      _$UserSortKeyImpl _value, $Res Function(_$UserSortKeyImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserSortKey
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primary = null,
    Object? secondary = null,
  }) {
    return _then(_$UserSortKeyImpl(
      primary: null == primary
          ? _value.primary
          : primary // ignore: cast_nullable_to_non_nullable
              as int,
      secondary: null == secondary
          ? _value.secondary
          : secondary // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserSortKeyImpl extends _UserSortKey {
  const _$UserSortKeyImpl({required this.primary, required this.secondary})
      : super._();

  @override
  final int primary;
  @override
  final String secondary;

  @override
  String toString() {
    return 'UserSortKey(primary: $primary, secondary: $secondary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSortKeyImpl &&
            (identical(other.primary, primary) || other.primary == primary) &&
            (identical(other.secondary, secondary) ||
                other.secondary == secondary));
  }

  @override
  int get hashCode => Object.hash(runtimeType, primary, secondary);

  /// Create a copy of UserSortKey
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSortKeyImplCopyWith<_$UserSortKeyImpl> get copyWith =>
      __$$UserSortKeyImplCopyWithImpl<_$UserSortKeyImpl>(this, _$identity);
}

abstract class _UserSortKey extends UserSortKey {
  const factory _UserSortKey(
      {required final int primary,
      required final String secondary}) = _$UserSortKeyImpl;
  const _UserSortKey._() : super._();

  @override
  int get primary;
  @override
  String get secondary;

  /// Create a copy of UserSortKey
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserSortKeyImplCopyWith<_$UserSortKeyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
