// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserProfile {
  DateTime get lastHistoryUpdate => throw _privateConstructorUsedError;
  HiddenSuggestions get hiddenSuggestions => throw _privateConstructorUsedError;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) then) =
      _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call({DateTime lastHistoryUpdate, HiddenSuggestions hiddenSuggestions});

  $HiddenSuggestionsCopyWith<$Res> get hiddenSuggestions;
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastHistoryUpdate = null,
    Object? hiddenSuggestions = null,
  }) {
    return _then(_value.copyWith(
      lastHistoryUpdate: null == lastHistoryUpdate
          ? _value.lastHistoryUpdate
          : lastHistoryUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      hiddenSuggestions: null == hiddenSuggestions
          ? _value.hiddenSuggestions
          : hiddenSuggestions // ignore: cast_nullable_to_non_nullable
              as HiddenSuggestions,
    ) as $Val);
  }

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HiddenSuggestionsCopyWith<$Res> get hiddenSuggestions {
    return $HiddenSuggestionsCopyWith<$Res>(_value.hiddenSuggestions, (value) {
      return _then(_value.copyWith(hiddenSuggestions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserProfileImplCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$UserProfileImplCopyWith(
          _$UserProfileImpl value, $Res Function(_$UserProfileImpl) then) =
      __$$UserProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime lastHistoryUpdate, HiddenSuggestions hiddenSuggestions});

  @override
  $HiddenSuggestionsCopyWith<$Res> get hiddenSuggestions;
}

/// @nodoc
class __$$UserProfileImplCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$UserProfileImpl>
    implements _$$UserProfileImplCopyWith<$Res> {
  __$$UserProfileImplCopyWithImpl(
      _$UserProfileImpl _value, $Res Function(_$UserProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastHistoryUpdate = null,
    Object? hiddenSuggestions = null,
  }) {
    return _then(_$UserProfileImpl(
      lastHistoryUpdate: null == lastHistoryUpdate
          ? _value.lastHistoryUpdate
          : lastHistoryUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      hiddenSuggestions: null == hiddenSuggestions
          ? _value.hiddenSuggestions
          : hiddenSuggestions // ignore: cast_nullable_to_non_nullable
              as HiddenSuggestions,
    ));
  }
}

/// @nodoc

class _$UserProfileImpl extends _UserProfile {
  const _$UserProfileImpl(
      {required this.lastHistoryUpdate, required this.hiddenSuggestions})
      : super._();

  @override
  final DateTime lastHistoryUpdate;
  @override
  final HiddenSuggestions hiddenSuggestions;

  @override
  String toString() {
    return 'UserProfile(lastHistoryUpdate: $lastHistoryUpdate, hiddenSuggestions: $hiddenSuggestions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileImpl &&
            (identical(other.lastHistoryUpdate, lastHistoryUpdate) ||
                other.lastHistoryUpdate == lastHistoryUpdate) &&
            (identical(other.hiddenSuggestions, hiddenSuggestions) ||
                other.hiddenSuggestions == hiddenSuggestions));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, lastHistoryUpdate, hiddenSuggestions);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      __$$UserProfileImplCopyWithImpl<_$UserProfileImpl>(this, _$identity);
}

abstract class _UserProfile extends UserProfile {
  const factory _UserProfile(
      {required final DateTime lastHistoryUpdate,
      required final HiddenSuggestions hiddenSuggestions}) = _$UserProfileImpl;
  const _UserProfile._() : super._();

  @override
  DateTime get lastHistoryUpdate;
  @override
  HiddenSuggestions get hiddenSuggestions;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HiddenSuggestions {
  List<String> get items => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;

  /// Create a copy of HiddenSuggestions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HiddenSuggestionsCopyWith<HiddenSuggestions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HiddenSuggestionsCopyWith<$Res> {
  factory $HiddenSuggestionsCopyWith(
          HiddenSuggestions value, $Res Function(HiddenSuggestions) then) =
      _$HiddenSuggestionsCopyWithImpl<$Res, HiddenSuggestions>;
  @useResult
  $Res call({List<String> items, List<String> categories});
}

/// @nodoc
class _$HiddenSuggestionsCopyWithImpl<$Res, $Val extends HiddenSuggestions>
    implements $HiddenSuggestionsCopyWith<$Res> {
  _$HiddenSuggestionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HiddenSuggestions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? categories = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HiddenSuggestionsImplCopyWith<$Res>
    implements $HiddenSuggestionsCopyWith<$Res> {
  factory _$$HiddenSuggestionsImplCopyWith(_$HiddenSuggestionsImpl value,
          $Res Function(_$HiddenSuggestionsImpl) then) =
      __$$HiddenSuggestionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> items, List<String> categories});
}

/// @nodoc
class __$$HiddenSuggestionsImplCopyWithImpl<$Res>
    extends _$HiddenSuggestionsCopyWithImpl<$Res, _$HiddenSuggestionsImpl>
    implements _$$HiddenSuggestionsImplCopyWith<$Res> {
  __$$HiddenSuggestionsImplCopyWithImpl(_$HiddenSuggestionsImpl _value,
      $Res Function(_$HiddenSuggestionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of HiddenSuggestions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? categories = null,
  }) {
    return _then(_$HiddenSuggestionsImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$HiddenSuggestionsImpl extends _HiddenSuggestions {
  const _$HiddenSuggestionsImpl(
      {required final List<String> items,
      required final List<String> categories})
      : _items = items,
        _categories = categories,
        super._();

  final List<String> _items;
  @override
  List<String> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  final List<String> _categories;
  @override
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'HiddenSuggestions(items: $items, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HiddenSuggestionsImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(_categories));

  /// Create a copy of HiddenSuggestions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HiddenSuggestionsImplCopyWith<_$HiddenSuggestionsImpl> get copyWith =>
      __$$HiddenSuggestionsImplCopyWithImpl<_$HiddenSuggestionsImpl>(
          this, _$identity);
}

abstract class _HiddenSuggestions extends HiddenSuggestions {
  const factory _HiddenSuggestions(
      {required final List<String> items,
      required final List<String> categories}) = _$HiddenSuggestionsImpl;
  const _HiddenSuggestions._() : super._();

  @override
  List<String> get items;
  @override
  List<String> get categories;

  /// Create a copy of HiddenSuggestions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HiddenSuggestionsImplCopyWith<_$HiddenSuggestionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
