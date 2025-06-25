// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_category_suggestions_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ShoppingCategorySuggestionsSummary {
  Map<String, DateTime> get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of ShoppingCategorySuggestionsSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShoppingCategorySuggestionsSummaryCopyWith<
          ShoppingCategorySuggestionsSummary>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingCategorySuggestionsSummaryCopyWith<$Res> {
  factory $ShoppingCategorySuggestionsSummaryCopyWith(
          ShoppingCategorySuggestionsSummary value,
          $Res Function(ShoppingCategorySuggestionsSummary) then) =
      _$ShoppingCategorySuggestionsSummaryCopyWithImpl<$Res,
          ShoppingCategorySuggestionsSummary>;
  @useResult
  $Res call({Map<String, DateTime> updatedAt});
}

/// @nodoc
class _$ShoppingCategorySuggestionsSummaryCopyWithImpl<$Res,
        $Val extends ShoppingCategorySuggestionsSummary>
    implements $ShoppingCategorySuggestionsSummaryCopyWith<$Res> {
  _$ShoppingCategorySuggestionsSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShoppingCategorySuggestionsSummary
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
abstract class _$$ShoppingCategorySuggestionsSummaryImplCopyWith<$Res>
    implements $ShoppingCategorySuggestionsSummaryCopyWith<$Res> {
  factory _$$ShoppingCategorySuggestionsSummaryImplCopyWith(
          _$ShoppingCategorySuggestionsSummaryImpl value,
          $Res Function(_$ShoppingCategorySuggestionsSummaryImpl) then) =
      __$$ShoppingCategorySuggestionsSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, DateTime> updatedAt});
}

/// @nodoc
class __$$ShoppingCategorySuggestionsSummaryImplCopyWithImpl<$Res>
    extends _$ShoppingCategorySuggestionsSummaryCopyWithImpl<$Res,
        _$ShoppingCategorySuggestionsSummaryImpl>
    implements _$$ShoppingCategorySuggestionsSummaryImplCopyWith<$Res> {
  __$$ShoppingCategorySuggestionsSummaryImplCopyWithImpl(
      _$ShoppingCategorySuggestionsSummaryImpl _value,
      $Res Function(_$ShoppingCategorySuggestionsSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShoppingCategorySuggestionsSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updatedAt = null,
  }) {
    return _then(_$ShoppingCategorySuggestionsSummaryImpl(
      updatedAt: null == updatedAt
          ? _value._updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Map<String, DateTime>,
    ));
  }
}

/// @nodoc

class _$ShoppingCategorySuggestionsSummaryImpl
    extends _ShoppingCategorySuggestionsSummary {
  const _$ShoppingCategorySuggestionsSummaryImpl(
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
    return 'ShoppingCategorySuggestionsSummary(updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingCategorySuggestionsSummaryImpl &&
            const DeepCollectionEquality()
                .equals(other._updatedAt, _updatedAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_updatedAt));

  /// Create a copy of ShoppingCategorySuggestionsSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingCategorySuggestionsSummaryImplCopyWith<
          _$ShoppingCategorySuggestionsSummaryImpl>
      get copyWith => __$$ShoppingCategorySuggestionsSummaryImplCopyWithImpl<
          _$ShoppingCategorySuggestionsSummaryImpl>(this, _$identity);
}

abstract class _ShoppingCategorySuggestionsSummary
    extends ShoppingCategorySuggestionsSummary {
  const factory _ShoppingCategorySuggestionsSummary(
          {required final Map<String, DateTime> updatedAt}) =
      _$ShoppingCategorySuggestionsSummaryImpl;
  const _ShoppingCategorySuggestionsSummary._() : super._();

  @override
  Map<String, DateTime> get updatedAt;

  /// Create a copy of ShoppingCategorySuggestionsSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShoppingCategorySuggestionsSummaryImplCopyWith<
          _$ShoppingCategorySuggestionsSummaryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
