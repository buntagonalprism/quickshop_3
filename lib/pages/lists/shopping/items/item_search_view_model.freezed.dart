// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_search_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ItemSuggestion {
  String get item => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  bool get isFromHistory => throw _privateConstructorUsedError;

  /// Create a copy of ItemSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemSuggestionCopyWith<ItemSuggestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemSuggestionCopyWith<$Res> {
  factory $ItemSuggestionCopyWith(
          ItemSuggestion value, $Res Function(ItemSuggestion) then) =
      _$ItemSuggestionCopyWithImpl<$Res, ItemSuggestion>;
  @useResult
  $Res call({String item, String category, bool isFromHistory});
}

/// @nodoc
class _$ItemSuggestionCopyWithImpl<$Res, $Val extends ItemSuggestion>
    implements $ItemSuggestionCopyWith<$Res> {
  _$ItemSuggestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItemSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? category = null,
    Object? isFromHistory = null,
  }) {
    return _then(_value.copyWith(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      isFromHistory: null == isFromHistory
          ? _value.isFromHistory
          : isFromHistory // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemSuggestionImplCopyWith<$Res>
    implements $ItemSuggestionCopyWith<$Res> {
  factory _$$ItemSuggestionImplCopyWith(_$ItemSuggestionImpl value,
          $Res Function(_$ItemSuggestionImpl) then) =
      __$$ItemSuggestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String item, String category, bool isFromHistory});
}

/// @nodoc
class __$$ItemSuggestionImplCopyWithImpl<$Res>
    extends _$ItemSuggestionCopyWithImpl<$Res, _$ItemSuggestionImpl>
    implements _$$ItemSuggestionImplCopyWith<$Res> {
  __$$ItemSuggestionImplCopyWithImpl(
      _$ItemSuggestionImpl _value, $Res Function(_$ItemSuggestionImpl) _then)
      : super(_value, _then);

  /// Create a copy of ItemSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? category = null,
    Object? isFromHistory = null,
  }) {
    return _then(_$ItemSuggestionImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      isFromHistory: null == isFromHistory
          ? _value.isFromHistory
          : isFromHistory // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ItemSuggestionImpl extends _ItemSuggestion {
  const _$ItemSuggestionImpl(
      {required this.item, required this.category, required this.isFromHistory})
      : super._();

  @override
  final String item;
  @override
  final String category;
  @override
  final bool isFromHistory;

  @override
  String toString() {
    return 'ItemSuggestion(item: $item, category: $category, isFromHistory: $isFromHistory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemSuggestionImpl &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.isFromHistory, isFromHistory) ||
                other.isFromHistory == isFromHistory));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item, category, isFromHistory);

  /// Create a copy of ItemSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemSuggestionImplCopyWith<_$ItemSuggestionImpl> get copyWith =>
      __$$ItemSuggestionImplCopyWithImpl<_$ItemSuggestionImpl>(
          this, _$identity);
}

abstract class _ItemSuggestion extends ItemSuggestion {
  const factory _ItemSuggestion(
      {required final String item,
      required final String category,
      required final bool isFromHistory}) = _$ItemSuggestionImpl;
  const _ItemSuggestion._() : super._();

  @override
  String get item;
  @override
  String get category;
  @override
  bool get isFromHistory;

  /// Create a copy of ItemSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemSuggestionImplCopyWith<_$ItemSuggestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
