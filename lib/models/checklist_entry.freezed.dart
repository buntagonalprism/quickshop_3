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
    required TResult Function(ChecklistGroup group) group,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ChecklistItem item)? item,
    TResult? Function(ChecklistGroup group)? group,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ChecklistItem item)? item,
    TResult Function(ChecklistGroup group)? group,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChecklistEntryItem value) item,
    required TResult Function(_ChecklistEntryHeader value) group,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChecklistEntryItem value)? item,
    TResult? Function(_ChecklistEntryHeader value)? group,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChecklistEntryItem value)? item,
    TResult Function(_ChecklistEntryHeader value)? group,
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
    required TResult Function(ChecklistGroup group) group,
  }) {
    return item(this.item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ChecklistItem item)? item,
    TResult? Function(ChecklistGroup group)? group,
  }) {
    return item?.call(this.item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ChecklistItem item)? item,
    TResult Function(ChecklistGroup group)? group,
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
    required TResult Function(_ChecklistEntryHeader value) group,
  }) {
    return item(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChecklistEntryItem value)? item,
    TResult? Function(_ChecklistEntryHeader value)? group,
  }) {
    return item?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChecklistEntryItem value)? item,
    TResult Function(_ChecklistEntryHeader value)? group,
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
abstract class _$$ChecklistEntryHeaderImplCopyWith<$Res> {
  factory _$$ChecklistEntryHeaderImplCopyWith(_$ChecklistEntryHeaderImpl value,
          $Res Function(_$ChecklistEntryHeaderImpl) then) =
      __$$ChecklistEntryHeaderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ChecklistGroup group});

  $ChecklistGroupCopyWith<$Res> get group;
}

/// @nodoc
class __$$ChecklistEntryHeaderImplCopyWithImpl<$Res>
    extends _$ChecklistEntryCopyWithImpl<$Res, _$ChecklistEntryHeaderImpl>
    implements _$$ChecklistEntryHeaderImplCopyWith<$Res> {
  __$$ChecklistEntryHeaderImplCopyWithImpl(_$ChecklistEntryHeaderImpl _value,
      $Res Function(_$ChecklistEntryHeaderImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChecklistEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? group = null,
  }) {
    return _then(_$ChecklistEntryHeaderImpl(
      null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as ChecklistGroup,
    ));
  }

  /// Create a copy of ChecklistEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChecklistGroupCopyWith<$Res> get group {
    return $ChecklistGroupCopyWith<$Res>(_value.group, (value) {
      return _then(_value.copyWith(group: value));
    });
  }
}

/// @nodoc

class _$ChecklistEntryHeaderImpl extends _ChecklistEntryHeader {
  const _$ChecklistEntryHeaderImpl(this.group) : super._();

  @override
  final ChecklistGroup group;

  @override
  String toString() {
    return 'ChecklistEntry.group(group: $group)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChecklistEntryHeaderImpl &&
            (identical(other.group, group) || other.group == group));
  }

  @override
  int get hashCode => Object.hash(runtimeType, group);

  /// Create a copy of ChecklistEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChecklistEntryHeaderImplCopyWith<_$ChecklistEntryHeaderImpl>
      get copyWith =>
          __$$ChecklistEntryHeaderImplCopyWithImpl<_$ChecklistEntryHeaderImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ChecklistItem item) item,
    required TResult Function(ChecklistGroup group) group,
  }) {
    return group(this.group);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ChecklistItem item)? item,
    TResult? Function(ChecklistGroup group)? group,
  }) {
    return group?.call(this.group);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ChecklistItem item)? item,
    TResult Function(ChecklistGroup group)? group,
    required TResult orElse(),
  }) {
    if (group != null) {
      return group(this.group);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChecklistEntryItem value) item,
    required TResult Function(_ChecklistEntryHeader value) group,
  }) {
    return group(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChecklistEntryItem value)? item,
    TResult? Function(_ChecklistEntryHeader value)? group,
  }) {
    return group?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChecklistEntryItem value)? item,
    TResult Function(_ChecklistEntryHeader value)? group,
    required TResult orElse(),
  }) {
    if (group != null) {
      return group(this);
    }
    return orElse();
  }
}

abstract class _ChecklistEntryHeader extends ChecklistEntry {
  const factory _ChecklistEntryHeader(final ChecklistGroup group) =
      _$ChecklistEntryHeaderImpl;
  const _ChecklistEntryHeader._() : super._();

  ChecklistGroup get group;

  /// Create a copy of ChecklistEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChecklistEntryHeaderImplCopyWith<_$ChecklistEntryHeaderImpl>
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
mixin _$ChecklistGroup {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<ChecklistItem> get items => throw _privateConstructorUsedError;
  UserSortKey get sortKey => throw _privateConstructorUsedError;

  /// Create a copy of ChecklistGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChecklistGroupCopyWith<ChecklistGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChecklistGroupCopyWith<$Res> {
  factory $ChecklistGroupCopyWith(
          ChecklistGroup value, $Res Function(ChecklistGroup) then) =
      _$ChecklistGroupCopyWithImpl<$Res, ChecklistGroup>;
  @useResult
  $Res call(
      {String id, String name, List<ChecklistItem> items, UserSortKey sortKey});

  $UserSortKeyCopyWith<$Res> get sortKey;
}

/// @nodoc
class _$ChecklistGroupCopyWithImpl<$Res, $Val extends ChecklistGroup>
    implements $ChecklistGroupCopyWith<$Res> {
  _$ChecklistGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChecklistGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? items = null,
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
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ChecklistItem>,
      sortKey: null == sortKey
          ? _value.sortKey
          : sortKey // ignore: cast_nullable_to_non_nullable
              as UserSortKey,
    ) as $Val);
  }

  /// Create a copy of ChecklistGroup
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
abstract class _$$ChecklistGroupImplCopyWith<$Res>
    implements $ChecklistGroupCopyWith<$Res> {
  factory _$$ChecklistGroupImplCopyWith(_$ChecklistGroupImpl value,
          $Res Function(_$ChecklistGroupImpl) then) =
      __$$ChecklistGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String name, List<ChecklistItem> items, UserSortKey sortKey});

  @override
  $UserSortKeyCopyWith<$Res> get sortKey;
}

/// @nodoc
class __$$ChecklistGroupImplCopyWithImpl<$Res>
    extends _$ChecklistGroupCopyWithImpl<$Res, _$ChecklistGroupImpl>
    implements _$$ChecklistGroupImplCopyWith<$Res> {
  __$$ChecklistGroupImplCopyWithImpl(
      _$ChecklistGroupImpl _value, $Res Function(_$ChecklistGroupImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChecklistGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? items = null,
    Object? sortKey = null,
  }) {
    return _then(_$ChecklistGroupImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ChecklistItem>,
      sortKey: null == sortKey
          ? _value.sortKey
          : sortKey // ignore: cast_nullable_to_non_nullable
              as UserSortKey,
    ));
  }
}

/// @nodoc

class _$ChecklistGroupImpl extends _ChecklistGroup {
  const _$ChecklistGroupImpl(
      {required this.id,
      required this.name,
      required final List<ChecklistItem> items,
      required this.sortKey})
      : _items = items,
        super._();

  @override
  final String id;
  @override
  final String name;
  final List<ChecklistItem> _items;
  @override
  List<ChecklistItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final UserSortKey sortKey;

  @override
  String toString() {
    return 'ChecklistGroup(id: $id, name: $name, items: $items, sortKey: $sortKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChecklistGroupImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.sortKey, sortKey) || other.sortKey == sortKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name,
      const DeepCollectionEquality().hash(_items), sortKey);

  /// Create a copy of ChecklistGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChecklistGroupImplCopyWith<_$ChecklistGroupImpl> get copyWith =>
      __$$ChecklistGroupImplCopyWithImpl<_$ChecklistGroupImpl>(
          this, _$identity);
}

abstract class _ChecklistGroup extends ChecklistGroup {
  const factory _ChecklistGroup(
      {required final String id,
      required final String name,
      required final List<ChecklistItem> items,
      required final UserSortKey sortKey}) = _$ChecklistGroupImpl;
  const _ChecklistGroup._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  List<ChecklistItem> get items;
  @override
  UserSortKey get sortKey;

  /// Create a copy of ChecklistGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChecklistGroupImplCopyWith<_$ChecklistGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
