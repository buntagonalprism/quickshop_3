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
  String get name => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, bool completed) item,
    required TResult Function(String name, List<ChecklistItem> items) header,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, bool completed)? item,
    TResult? Function(String name, List<ChecklistItem> items)? header,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, bool completed)? item,
    TResult Function(String name, List<ChecklistItem> items)? header,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChecklistItem value) item,
    required TResult Function(ChecklistHeader value) header,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChecklistItem value)? item,
    TResult? Function(ChecklistHeader value)? header,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChecklistItem value)? item,
    TResult Function(ChecklistHeader value)? header,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ChecklistEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChecklistEntryCopyWith<ChecklistEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChecklistEntryCopyWith<$Res> {
  factory $ChecklistEntryCopyWith(
          ChecklistEntry value, $Res Function(ChecklistEntry) then) =
      _$ChecklistEntryCopyWithImpl<$Res, ChecklistEntry>;
  @useResult
  $Res call({String name});
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
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChecklistItemImplCopyWith<$Res>
    implements $ChecklistEntryCopyWith<$Res> {
  factory _$$ChecklistItemImplCopyWith(
          _$ChecklistItemImpl value, $Res Function(_$ChecklistItemImpl) then) =
      __$$ChecklistItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, bool completed});
}

/// @nodoc
class __$$ChecklistItemImplCopyWithImpl<$Res>
    extends _$ChecklistEntryCopyWithImpl<$Res, _$ChecklistItemImpl>
    implements _$$ChecklistItemImplCopyWith<$Res> {
  __$$ChecklistItemImplCopyWithImpl(
      _$ChecklistItemImpl _value, $Res Function(_$ChecklistItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChecklistEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? completed = null,
  }) {
    return _then(_$ChecklistItemImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChecklistItemImpl extends ChecklistItem {
  const _$ChecklistItemImpl({required this.name, required this.completed})
      : super._();

  @override
  final String name;
  @override
  final bool completed;

  @override
  String toString() {
    return 'ChecklistEntry.item(name: $name, completed: $completed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChecklistItemImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, completed);

  /// Create a copy of ChecklistEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChecklistItemImplCopyWith<_$ChecklistItemImpl> get copyWith =>
      __$$ChecklistItemImplCopyWithImpl<_$ChecklistItemImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, bool completed) item,
    required TResult Function(String name, List<ChecklistItem> items) header,
  }) {
    return item(name, completed);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, bool completed)? item,
    TResult? Function(String name, List<ChecklistItem> items)? header,
  }) {
    return item?.call(name, completed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, bool completed)? item,
    TResult Function(String name, List<ChecklistItem> items)? header,
    required TResult orElse(),
  }) {
    if (item != null) {
      return item(name, completed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChecklistItem value) item,
    required TResult Function(ChecklistHeader value) header,
  }) {
    return item(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChecklistItem value)? item,
    TResult? Function(ChecklistHeader value)? header,
  }) {
    return item?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChecklistItem value)? item,
    TResult Function(ChecklistHeader value)? header,
    required TResult orElse(),
  }) {
    if (item != null) {
      return item(this);
    }
    return orElse();
  }
}

abstract class ChecklistItem extends ChecklistEntry {
  const factory ChecklistItem(
      {required final String name,
      required final bool completed}) = _$ChecklistItemImpl;
  const ChecklistItem._() : super._();

  @override
  String get name;
  bool get completed;

  /// Create a copy of ChecklistEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChecklistItemImplCopyWith<_$ChecklistItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChecklistHeaderImplCopyWith<$Res>
    implements $ChecklistEntryCopyWith<$Res> {
  factory _$$ChecklistHeaderImplCopyWith(_$ChecklistHeaderImpl value,
          $Res Function(_$ChecklistHeaderImpl) then) =
      __$$ChecklistHeaderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<ChecklistItem> items});
}

/// @nodoc
class __$$ChecklistHeaderImplCopyWithImpl<$Res>
    extends _$ChecklistEntryCopyWithImpl<$Res, _$ChecklistHeaderImpl>
    implements _$$ChecklistHeaderImplCopyWith<$Res> {
  __$$ChecklistHeaderImplCopyWithImpl(
      _$ChecklistHeaderImpl _value, $Res Function(_$ChecklistHeaderImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChecklistEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? items = null,
  }) {
    return _then(_$ChecklistHeaderImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ChecklistItem>,
    ));
  }
}

/// @nodoc

class _$ChecklistHeaderImpl extends ChecklistHeader {
  const _$ChecklistHeaderImpl(
      {required this.name, required final List<ChecklistItem> items})
      : _items = items,
        super._();

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
  String toString() {
    return 'ChecklistEntry.header(name: $name, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChecklistHeaderImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_items));

  /// Create a copy of ChecklistEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChecklistHeaderImplCopyWith<_$ChecklistHeaderImpl> get copyWith =>
      __$$ChecklistHeaderImplCopyWithImpl<_$ChecklistHeaderImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, bool completed) item,
    required TResult Function(String name, List<ChecklistItem> items) header,
  }) {
    return header(name, items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, bool completed)? item,
    TResult? Function(String name, List<ChecklistItem> items)? header,
  }) {
    return header?.call(name, items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, bool completed)? item,
    TResult Function(String name, List<ChecklistItem> items)? header,
    required TResult orElse(),
  }) {
    if (header != null) {
      return header(name, items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChecklistItem value) item,
    required TResult Function(ChecklistHeader value) header,
  }) {
    return header(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChecklistItem value)? item,
    TResult? Function(ChecklistHeader value)? header,
  }) {
    return header?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChecklistItem value)? item,
    TResult Function(ChecklistHeader value)? header,
    required TResult orElse(),
  }) {
    if (header != null) {
      return header(this);
    }
    return orElse();
  }
}

abstract class ChecklistHeader extends ChecklistEntry {
  const factory ChecklistHeader(
      {required final String name,
      required final List<ChecklistItem> items}) = _$ChecklistHeaderImpl;
  const ChecklistHeader._() : super._();

  @override
  String get name;
  List<ChecklistItem> get items;

  /// Create a copy of ChecklistEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChecklistHeaderImplCopyWith<_$ChecklistHeaderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
