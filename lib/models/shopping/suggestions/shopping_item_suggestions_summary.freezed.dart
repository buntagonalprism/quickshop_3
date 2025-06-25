// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_item_suggestions_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ShoppingItemSuggestionsSummary {
  Map<String, DateTime> get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of ShoppingItemSuggestionsSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShoppingItemSuggestionsSummaryCopyWith<ShoppingItemSuggestionsSummary>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingItemSuggestionsSummaryCopyWith<$Res> {
  factory $ShoppingItemSuggestionsSummaryCopyWith(
          ShoppingItemSuggestionsSummary value,
          $Res Function(ShoppingItemSuggestionsSummary) then) =
      _$ShoppingItemSuggestionsSummaryCopyWithImpl<$Res,
          ShoppingItemSuggestionsSummary>;
  @useResult
  $Res call({Map<String, DateTime> updatedAt});
}

/// @nodoc
class _$ShoppingItemSuggestionsSummaryCopyWithImpl<$Res,
        $Val extends ShoppingItemSuggestionsSummary>
    implements $ShoppingItemSuggestionsSummaryCopyWith<$Res> {
  _$ShoppingItemSuggestionsSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShoppingItemSuggestionsSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Map<String, DateTime>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShoppingItemSuggestionsSummaryImplCopyWith<$Res>
    implements $ShoppingItemSuggestionsSummaryCopyWith<$Res> {
  factory _$$ShoppingItemSuggestionsSummaryImplCopyWith(
          _$ShoppingItemSuggestionsSummaryImpl value,
          $Res Function(_$ShoppingItemSuggestionsSummaryImpl) then) =
      __$$ShoppingItemSuggestionsSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, DateTime> updatedAt});
}

/// @nodoc
class __$$ShoppingItemSuggestionsSummaryImplCopyWithImpl<$Res>
    extends _$ShoppingItemSuggestionsSummaryCopyWithImpl<$Res,
        _$ShoppingItemSuggestionsSummaryImpl>
    implements _$$ShoppingItemSuggestionsSummaryImplCopyWith<$Res> {
  __$$ShoppingItemSuggestionsSummaryImplCopyWithImpl(
      _$ShoppingItemSuggestionsSummaryImpl _value,
      $Res Function(_$ShoppingItemSuggestionsSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShoppingItemSuggestionsSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updatedAt = null,
  }) {
    return _then(_$ShoppingItemSuggestionsSummaryImpl(
      updatedAt: null == updatedAt
          ? _value._updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Map<String, DateTime>,
    ));
  }
}

/// @nodoc

class _$ShoppingItemSuggestionsSummaryImpl
    extends _ShoppingItemSuggestionsSummary {
  const _$ShoppingItemSuggestionsSummaryImpl(
      {required final Map<String, DateTime> updatedAt})
      : _updatedAt = updatedAt,
        super._();

  final Map<String, DateTime> _updatedAt;
  @override
  Map<String, DateTime> get updatedAt {
    if (_updatedAt is EqualUnmodifiableMapView) return _updatedAt;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_updatedAt);
  }

  @override
  String toString() {
    return 'ShoppingItemSuggestionsSummary(updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingItemSuggestionsSummaryImpl &&
            const DeepCollectionEquality()
                .equals(other._updatedAt, _updatedAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_updatedAt));

  /// Create a copy of ShoppingItemSuggestionsSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingItemSuggestionsSummaryImplCopyWith<
          _$ShoppingItemSuggestionsSummaryImpl>
      get copyWith => __$$ShoppingItemSuggestionsSummaryImplCopyWithImpl<
          _$ShoppingItemSuggestionsSummaryImpl>(this, _$identity);
}

abstract class _ShoppingItemSuggestionsSummary
    extends ShoppingItemSuggestionsSummary {
  const factory _ShoppingItemSuggestionsSummary(
          {required final Map<String, DateTime> updatedAt}) =
      _$ShoppingItemSuggestionsSummaryImpl;
  const _ShoppingItemSuggestionsSummary._() : super._();

  @override
  Map<String, DateTime> get updatedAt;

  /// Create a copy of ShoppingItemSuggestionsSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShoppingItemSuggestionsSummaryImplCopyWith<
          _$ShoppingItemSuggestionsSummaryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
