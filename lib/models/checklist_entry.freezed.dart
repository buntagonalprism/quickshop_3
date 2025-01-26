// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checklist_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChecklistEntry {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ChecklistItem item) item,
    required TResult Function(ChecklistHeading heading) heading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ChecklistItem item)? item,
    TResult? Function(ChecklistHeading heading)? heading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ChecklistItem item)? item,
    TResult Function(ChecklistHeading heading)? heading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChecklistEntryItem value) item,
    required TResult Function(_ChecklistEntryHeading value) heading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChecklistEntryItem value)? item,
    TResult? Function(_ChecklistEntryHeading value)? heading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChecklistEntryItem value)? item,
    TResult Function(_ChecklistEntryHeading value)? heading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChecklistEntryCopyWith<$Res> {
  factory $ChecklistEntryCopyWith(
          ChecklistEntry value, $Res Function(ChecklistEntry) then) =
      _$ChecklistEntryCopyWithImpl<$Res, ChecklistEntry>;
}

/// @nodoc
class _$ChecklistEntryCopyWithImpl<$Res, $Val extends ChecklistEntry>
    implements $ChecklistEntryCopyWith<$Res> {
  _$ChecklistEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChecklistEntry
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ChecklistEntryItemImplCopyWith<$Res> {
  factory _$$ChecklistEntryItemImplCopyWith(_$ChecklistEntryItemImpl value,
          $Res Function(_$ChecklistEntryItemImpl) then) =
      __$$ChecklistEntryItemImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ChecklistItem item});

  $ChecklistItemCopyWith<$Res> get item;
}

/// @nodoc
class __$$ChecklistEntryItemImplCopyWithImpl<$Res>
    extends _$ChecklistEntryCopyWithImpl<$Res, _$ChecklistEntryItemImpl>
    implements _$$ChecklistEntryItemImplCopyWith<$Res> {
  __$$ChecklistEntryItemImplCopyWithImpl(_$ChecklistEntryItemImpl _value,
      $Res Function(_$ChecklistEntryItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChecklistEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$ChecklistEntryItemImpl(
      null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as ChecklistItem,
    ));
  }

  /// Create a copy of ChecklistEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChecklistItemCopyWith<$Res> get item {
    return $ChecklistItemCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$ChecklistEntryItemImpl extends _ChecklistEntryItem {
  const _$ChecklistEntryItemImpl(this.item) : super._();

  @override
  final ChecklistItem item;

  @override
  String toString() {
    return 'ChecklistEntry.item(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChecklistEntryItemImpl &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  /// Create a copy of ChecklistEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChecklistEntryItemImplCopyWith<_$ChecklistEntryItemImpl> get copyWith =>
      __$$ChecklistEntryItemImplCopyWithImpl<_$ChecklistEntryItemImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ChecklistItem item) item,
    required TResult Function(ChecklistHeading heading) heading,
  }) {
    return item(this.item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ChecklistItem item)? item,
    TResult? Function(ChecklistHeading heading)? heading,
  }) {
    return item?.call(this.item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ChecklistItem item)? item,
    TResult Function(ChecklistHeading heading)? heading,
    required TResult orElse(),
  }) {
    if (item != null) {
      return item(this.item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChecklistEntryItem value) item,
    required TResult Function(_ChecklistEntryHeading value) heading,
  }) {
    return item(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChecklistEntryItem value)? item,
    TResult? Function(_ChecklistEntryHeading value)? heading,
  }) {
    return item?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChecklistEntryItem value)? item,
    TResult Function(_ChecklistEntryHeading value)? heading,
    required TResult orElse(),
  }) {
    if (item != null) {
      return item(this);
    }
    return orElse();
  }
}

abstract class _ChecklistEntryItem extends ChecklistEntry {
  const factory _ChecklistEntryItem(final ChecklistItem item) =
      _$ChecklistEntryItemImpl;
  const _ChecklistEntryItem._() : super._();

  ChecklistItem get item;

  /// Create a copy of ChecklistEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChecklistEntryItemImplCopyWith<_$ChecklistEntryItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChecklistEntryHeadingImplCopyWith<$Res> {
  factory _$$ChecklistEntryHeadingImplCopyWith(
          _$ChecklistEntryHeadingImpl value,
          $Res Function(_$ChecklistEntryHeadingImpl) then) =
      __$$ChecklistEntryHeadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ChecklistHeading heading});

  $ChecklistHeadingCopyWith<$Res> get heading;
}

/// @nodoc
class __$$ChecklistEntryHeadingImplCopyWithImpl<$Res>
    extends _$ChecklistEntryCopyWithImpl<$Res, _$ChecklistEntryHeadingImpl>
    implements _$$ChecklistEntryHeadingImplCopyWith<$Res> {
  __$$ChecklistEntryHeadingImplCopyWithImpl(_$ChecklistEntryHeadingImpl _value,
      $Res Function(_$ChecklistEntryHeadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChecklistEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? heading = null,
  }) {
    return _then(_$ChecklistEntryHeadingImpl(
      null == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as ChecklistHeading,
    ));
  }

  /// Create a copy of ChecklistEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChecklistHeadingCopyWith<$Res> get heading {
    return $ChecklistHeadingCopyWith<$Res>(_value.heading, (value) {
      return _then(_value.copyWith(heading: value));
    });
  }
}

/// @nodoc

class _$ChecklistEntryHeadingImpl extends _ChecklistEntryHeading {
  const _$ChecklistEntryHeadingImpl(this.heading) : super._();

  @override
  final ChecklistHeading heading;

  @override
  String toString() {
    return 'ChecklistEntry.heading(heading: $heading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChecklistEntryHeadingImpl &&
            (identical(other.heading, heading) || other.heading == heading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, heading);

  /// Create a copy of ChecklistEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChecklistEntryHeadingImplCopyWith<_$ChecklistEntryHeadingImpl>
      get copyWith => __$$ChecklistEntryHeadingImplCopyWithImpl<
          _$ChecklistEntryHeadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ChecklistItem item) item,
    required TResult Function(ChecklistHeading heading) heading,
  }) {
    return heading(this.heading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ChecklistItem item)? item,
    TResult? Function(ChecklistHeading heading)? heading,
  }) {
    return heading?.call(this.heading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ChecklistItem item)? item,
    TResult Function(ChecklistHeading heading)? heading,
    required TResult orElse(),
  }) {
    if (heading != null) {
      return heading(this.heading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChecklistEntryItem value) item,
    required TResult Function(_ChecklistEntryHeading value) heading,
  }) {
    return heading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChecklistEntryItem value)? item,
    TResult? Function(_ChecklistEntryHeading value)? heading,
  }) {
    return heading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChecklistEntryItem value)? item,
    TResult Function(_ChecklistEntryHeading value)? heading,
    required TResult orElse(),
  }) {
    if (heading != null) {
      return heading(this);
    }
    return orElse();
  }
}

abstract class _ChecklistEntryHeading extends ChecklistEntry {
  const factory _ChecklistEntryHeading(final ChecklistHeading heading) =
      _$ChecklistEntryHeadingImpl;
  const _ChecklistEntryHeading._() : super._();

  ChecklistHeading get heading;

  /// Create a copy of ChecklistEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChecklistEntryHeadingImplCopyWith<_$ChecklistEntryHeadingImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChecklistItem {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;
  UserSortKey get sortKey => throw _privateConstructorUsedError;

  /// Create a copy of ChecklistItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChecklistItemCopyWith<ChecklistItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChecklistItemCopyWith<$Res> {
  factory $ChecklistItemCopyWith(
          ChecklistItem value, $Res Function(ChecklistItem) then) =
      _$ChecklistItemCopyWithImpl<$Res, ChecklistItem>;
  @useResult
  $Res call({String id, String name, bool completed, UserSortKey sortKey});

  $UserSortKeyCopyWith<$Res> get sortKey;
}

/// @nodoc
class _$ChecklistItemCopyWithImpl<$Res, $Val extends ChecklistItem>
    implements $ChecklistItemCopyWith<$Res> {
  _$ChecklistItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChecklistItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? completed = null,
    Object? sortKey = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      sortKey: null == sortKey
          ? _value.sortKey
          : sortKey // ignore: cast_nullable_to_non_nullable
              as UserSortKey,
    ) as $Val);
  }

  /// Create a copy of ChecklistItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserSortKeyCopyWith<$Res> get sortKey {
    return $UserSortKeyCopyWith<$Res>(_value.sortKey, (value) {
      return _then(_value.copyWith(sortKey: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChecklistItemImplCopyWith<$Res>
    implements $ChecklistItemCopyWith<$Res> {
  factory _$$ChecklistItemImplCopyWith(
          _$ChecklistItemImpl value, $Res Function(_$ChecklistItemImpl) then) =
      __$$ChecklistItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, bool completed, UserSortKey sortKey});

  @override
  $UserSortKeyCopyWith<$Res> get sortKey;
}

/// @nodoc
class __$$ChecklistItemImplCopyWithImpl<$Res>
    extends _$ChecklistItemCopyWithImpl<$Res, _$ChecklistItemImpl>
    implements _$$ChecklistItemImplCopyWith<$Res> {
  __$$ChecklistItemImplCopyWithImpl(
      _$ChecklistItemImpl _value, $Res Function(_$ChecklistItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChecklistItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? completed = null,
    Object? sortKey = null,
  }) {
    return _then(_$ChecklistItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      sortKey: null == sortKey
          ? _value.sortKey
          : sortKey // ignore: cast_nullable_to_non_nullable
              as UserSortKey,
    ));
  }
}

/// @nodoc

class _$ChecklistItemImpl extends _ChecklistItem {
  const _$ChecklistItemImpl(
      {required this.id,
      required this.name,
      required this.completed,
      required this.sortKey})
      : super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final bool completed;
  @override
  final UserSortKey sortKey;

  @override
  String toString() {
    return 'ChecklistItem(id: $id, name: $name, completed: $completed, sortKey: $sortKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChecklistItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.sortKey, sortKey) || other.sortKey == sortKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, completed, sortKey);

  /// Create a copy of ChecklistItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChecklistItemImplCopyWith<_$ChecklistItemImpl> get copyWith =>
      __$$ChecklistItemImplCopyWithImpl<_$ChecklistItemImpl>(this, _$identity);
}

abstract class _ChecklistItem extends ChecklistItem {
  const factory _ChecklistItem(
      {required final String id,
      required final String name,
      required final bool completed,
      required final UserSortKey sortKey}) = _$ChecklistItemImpl;
  const _ChecklistItem._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  bool get completed;
  @override
  UserSortKey get sortKey;

  /// Create a copy of ChecklistItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChecklistItemImplCopyWith<_$ChecklistItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChecklistHeading {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  UserSortKey get sortKey => throw _privateConstructorUsedError;

  /// Create a copy of ChecklistHeading
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChecklistHeadingCopyWith<ChecklistHeading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChecklistHeadingCopyWith<$Res> {
  factory $ChecklistHeadingCopyWith(
          ChecklistHeading value, $Res Function(ChecklistHeading) then) =
      _$ChecklistHeadingCopyWithImpl<$Res, ChecklistHeading>;
  @useResult
  $Res call({String id, String name, UserSortKey sortKey});

  $UserSortKeyCopyWith<$Res> get sortKey;
}

/// @nodoc
class _$ChecklistHeadingCopyWithImpl<$Res, $Val extends ChecklistHeading>
    implements $ChecklistHeadingCopyWith<$Res> {
  _$ChecklistHeadingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChecklistHeading
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? sortKey = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sortKey: null == sortKey
          ? _value.sortKey
          : sortKey // ignore: cast_nullable_to_non_nullable
              as UserSortKey,
    ) as $Val);
  }

  /// Create a copy of ChecklistHeading
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserSortKeyCopyWith<$Res> get sortKey {
    return $UserSortKeyCopyWith<$Res>(_value.sortKey, (value) {
      return _then(_value.copyWith(sortKey: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChecklistHeadingImplCopyWith<$Res>
    implements $ChecklistHeadingCopyWith<$Res> {
  factory _$$ChecklistHeadingImplCopyWith(_$ChecklistHeadingImpl value,
          $Res Function(_$ChecklistHeadingImpl) then) =
      __$$ChecklistHeadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, UserSortKey sortKey});

  @override
  $UserSortKeyCopyWith<$Res> get sortKey;
}

/// @nodoc
class __$$ChecklistHeadingImplCopyWithImpl<$Res>
    extends _$ChecklistHeadingCopyWithImpl<$Res, _$ChecklistHeadingImpl>
    implements _$$ChecklistHeadingImplCopyWith<$Res> {
  __$$ChecklistHeadingImplCopyWithImpl(_$ChecklistHeadingImpl _value,
      $Res Function(_$ChecklistHeadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChecklistHeading
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? sortKey = null,
  }) {
    return _then(_$ChecklistHeadingImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sortKey: null == sortKey
          ? _value.sortKey
          : sortKey // ignore: cast_nullable_to_non_nullable
              as UserSortKey,
    ));
  }
}

/// @nodoc

class _$ChecklistHeadingImpl extends _ChecklistHeading {
  const _$ChecklistHeadingImpl(
      {required this.id, required this.name, required this.sortKey})
      : super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final UserSortKey sortKey;

  @override
  String toString() {
    return 'ChecklistHeading(id: $id, name: $name, sortKey: $sortKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChecklistHeadingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sortKey, sortKey) || other.sortKey == sortKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, sortKey);

  /// Create a copy of ChecklistHeading
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChecklistHeadingImplCopyWith<_$ChecklistHeadingImpl> get copyWith =>
      __$$ChecklistHeadingImplCopyWithImpl<_$ChecklistHeadingImpl>(
          this, _$identity);
}

abstract class _ChecklistHeading extends ChecklistHeading {
  const factory _ChecklistHeading(
      {required final String id,
      required final String name,
      required final UserSortKey sortKey}) = _$ChecklistHeadingImpl;
  const _ChecklistHeading._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  UserSortKey get sortKey;

  /// Create a copy of ChecklistHeading
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChecklistHeadingImplCopyWith<_$ChecklistHeadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
