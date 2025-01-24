// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checklist_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChecklistViewModel {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function() loading,
    required TResult Function() notFound,
    required TResult Function(
            ListSummary list, List<ChecklistPageEntry> entries)
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function()? loading,
    TResult? Function()? notFound,
    TResult? Function(ListSummary list, List<ChecklistPageEntry> entries)?
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function()? loading,
    TResult Function()? notFound,
    TResult Function(ListSummary list, List<ChecklistPageEntry> entries)?
        success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_Checklist value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_Checklist value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_Checklist value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChecklistViewModelCopyWith<$Res> {
  factory $ChecklistViewModelCopyWith(
          ChecklistViewModel value, $Res Function(ChecklistViewModel) then) =
      _$ChecklistViewModelCopyWithImpl<$Res, ChecklistViewModel>;
}

/// @nodoc
class _$ChecklistViewModelCopyWithImpl<$Res, $Val extends ChecklistViewModel>
    implements $ChecklistViewModelCopyWith<$Res> {
  _$ChecklistViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChecklistViewModel
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ChecklistViewModelCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChecklistViewModel
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ErrorImpl extends _Error {
  const _$ErrorImpl() : super._();

  @override
  String toString() {
    return 'ChecklistViewModel.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function() loading,
    required TResult Function() notFound,
    required TResult Function(
            ListSummary list, List<ChecklistPageEntry> entries)
        success,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function()? loading,
    TResult? Function()? notFound,
    TResult? Function(ListSummary list, List<ChecklistPageEntry> entries)?
        success,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function()? loading,
    TResult Function()? notFound,
    TResult Function(ListSummary list, List<ChecklistPageEntry> entries)?
        success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_Checklist value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_Checklist value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_Checklist value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error extends ChecklistViewModel {
  const factory _Error() = _$ErrorImpl;
  const _Error._() : super._();
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ChecklistViewModelCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChecklistViewModel
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl extends _Loading {
  const _$LoadingImpl() : super._();

  @override
  String toString() {
    return 'ChecklistViewModel.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function() loading,
    required TResult Function() notFound,
    required TResult Function(
            ListSummary list, List<ChecklistPageEntry> entries)
        success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function()? loading,
    TResult? Function()? notFound,
    TResult? Function(ListSummary list, List<ChecklistPageEntry> entries)?
        success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function()? loading,
    TResult Function()? notFound,
    TResult Function(ListSummary list, List<ChecklistPageEntry> entries)?
        success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_Checklist value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_Checklist value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_Checklist value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends ChecklistViewModel {
  const factory _Loading() = _$LoadingImpl;
  const _Loading._() : super._();
}

/// @nodoc
abstract class _$$NotFoundImplCopyWith<$Res> {
  factory _$$NotFoundImplCopyWith(
          _$NotFoundImpl value, $Res Function(_$NotFoundImpl) then) =
      __$$NotFoundImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotFoundImplCopyWithImpl<$Res>
    extends _$ChecklistViewModelCopyWithImpl<$Res, _$NotFoundImpl>
    implements _$$NotFoundImplCopyWith<$Res> {
  __$$NotFoundImplCopyWithImpl(
      _$NotFoundImpl _value, $Res Function(_$NotFoundImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChecklistViewModel
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NotFoundImpl extends _NotFound {
  const _$NotFoundImpl() : super._();

  @override
  String toString() {
    return 'ChecklistViewModel.notFound()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotFoundImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function() loading,
    required TResult Function() notFound,
    required TResult Function(
            ListSummary list, List<ChecklistPageEntry> entries)
        success,
  }) {
    return notFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function()? loading,
    TResult? Function()? notFound,
    TResult? Function(ListSummary list, List<ChecklistPageEntry> entries)?
        success,
  }) {
    return notFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function()? loading,
    TResult Function()? notFound,
    TResult Function(ListSummary list, List<ChecklistPageEntry> entries)?
        success,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_Checklist value) success,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_Checklist value)? success,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_Checklist value)? success,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class _NotFound extends ChecklistViewModel {
  const factory _NotFound() = _$NotFoundImpl;
  const _NotFound._() : super._();
}

/// @nodoc
abstract class _$$ChecklistImplCopyWith<$Res> {
  factory _$$ChecklistImplCopyWith(
          _$ChecklistImpl value, $Res Function(_$ChecklistImpl) then) =
      __$$ChecklistImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ListSummary list, List<ChecklistPageEntry> entries});

  $ListSummaryCopyWith<$Res> get list;
}

/// @nodoc
class __$$ChecklistImplCopyWithImpl<$Res>
    extends _$ChecklistViewModelCopyWithImpl<$Res, _$ChecklistImpl>
    implements _$$ChecklistImplCopyWith<$Res> {
  __$$ChecklistImplCopyWithImpl(
      _$ChecklistImpl _value, $Res Function(_$ChecklistImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChecklistViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? entries = null,
  }) {
    return _then(_$ChecklistImpl(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as ListSummary,
      entries: null == entries
          ? _value._entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<ChecklistPageEntry>,
    ));
  }

  /// Create a copy of ChecklistViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ListSummaryCopyWith<$Res> get list {
    return $ListSummaryCopyWith<$Res>(_value.list, (value) {
      return _then(_value.copyWith(list: value));
    });
  }
}

/// @nodoc

class _$ChecklistImpl extends _Checklist {
  const _$ChecklistImpl(
      {required this.list, required final List<ChecklistPageEntry> entries})
      : _entries = entries,
        super._();

  @override
  final ListSummary list;
  final List<ChecklistPageEntry> _entries;
  @override
  List<ChecklistPageEntry> get entries {
    if (_entries is EqualUnmodifiableListView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entries);
  }

  @override
  String toString() {
    return 'ChecklistViewModel.success(list: $list, entries: $entries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChecklistImpl &&
            (identical(other.list, list) || other.list == list) &&
            const DeepCollectionEquality().equals(other._entries, _entries));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, list, const DeepCollectionEquality().hash(_entries));

  /// Create a copy of ChecklistViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChecklistImplCopyWith<_$ChecklistImpl> get copyWith =>
      __$$ChecklistImplCopyWithImpl<_$ChecklistImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function() loading,
    required TResult Function() notFound,
    required TResult Function(
            ListSummary list, List<ChecklistPageEntry> entries)
        success,
  }) {
    return success(list, entries);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function()? loading,
    TResult? Function()? notFound,
    TResult? Function(ListSummary list, List<ChecklistPageEntry> entries)?
        success,
  }) {
    return success?.call(list, entries);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function()? loading,
    TResult Function()? notFound,
    TResult Function(ListSummary list, List<ChecklistPageEntry> entries)?
        success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(list, entries);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_Checklist value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_Checklist value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_Checklist value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Checklist extends ChecklistViewModel {
  const factory _Checklist(
      {required final ListSummary list,
      required final List<ChecklistPageEntry> entries}) = _$ChecklistImpl;
  const _Checklist._() : super._();

  ListSummary get list;
  List<ChecklistPageEntry> get entries;

  /// Create a copy of ChecklistViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChecklistImplCopyWith<_$ChecklistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChecklistPageEntry {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ChecklistItem item) ungroupedItem,
    required TResult Function(ChecklistGroup group) header,
    required TResult Function(ChecklistItem item, bool lastInGroup) groupedItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ChecklistItem item)? ungroupedItem,
    TResult? Function(ChecklistGroup group)? header,
    TResult? Function(ChecklistItem item, bool lastInGroup)? groupedItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ChecklistItem item)? ungroupedItem,
    TResult Function(ChecklistGroup group)? header,
    TResult Function(ChecklistItem item, bool lastInGroup)? groupedItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Item value) ungroupedItem,
    required TResult Function(_Header value) header,
    required TResult Function(_GroupedItem value) groupedItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Item value)? ungroupedItem,
    TResult? Function(_Header value)? header,
    TResult? Function(_GroupedItem value)? groupedItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Item value)? ungroupedItem,
    TResult Function(_Header value)? header,
    TResult Function(_GroupedItem value)? groupedItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChecklistPageEntryCopyWith<$Res> {
  factory $ChecklistPageEntryCopyWith(
          ChecklistPageEntry value, $Res Function(ChecklistPageEntry) then) =
      _$ChecklistPageEntryCopyWithImpl<$Res, ChecklistPageEntry>;
}

/// @nodoc
class _$ChecklistPageEntryCopyWithImpl<$Res, $Val extends ChecklistPageEntry>
    implements $ChecklistPageEntryCopyWith<$Res> {
  _$ChecklistPageEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChecklistPageEntry
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ItemImplCopyWith<$Res> {
  factory _$$ItemImplCopyWith(
          _$ItemImpl value, $Res Function(_$ItemImpl) then) =
      __$$ItemImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ChecklistItem item});

  $ChecklistItemCopyWith<$Res> get item;
}

/// @nodoc
class __$$ItemImplCopyWithImpl<$Res>
    extends _$ChecklistPageEntryCopyWithImpl<$Res, _$ItemImpl>
    implements _$$ItemImplCopyWith<$Res> {
  __$$ItemImplCopyWithImpl(_$ItemImpl _value, $Res Function(_$ItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChecklistPageEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$ItemImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as ChecklistItem,
    ));
  }

  /// Create a copy of ChecklistPageEntry
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

class _$ItemImpl implements _Item {
  const _$ItemImpl({required this.item});

  @override
  final ChecklistItem item;

  @override
  String toString() {
    return 'ChecklistPageEntry.ungroupedItem(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemImpl &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  /// Create a copy of ChecklistPageEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      __$$ItemImplCopyWithImpl<_$ItemImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ChecklistItem item) ungroupedItem,
    required TResult Function(ChecklistGroup group) header,
    required TResult Function(ChecklistItem item, bool lastInGroup) groupedItem,
  }) {
    return ungroupedItem(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ChecklistItem item)? ungroupedItem,
    TResult? Function(ChecklistGroup group)? header,
    TResult? Function(ChecklistItem item, bool lastInGroup)? groupedItem,
  }) {
    return ungroupedItem?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ChecklistItem item)? ungroupedItem,
    TResult Function(ChecklistGroup group)? header,
    TResult Function(ChecklistItem item, bool lastInGroup)? groupedItem,
    required TResult orElse(),
  }) {
    if (ungroupedItem != null) {
      return ungroupedItem(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Item value) ungroupedItem,
    required TResult Function(_Header value) header,
    required TResult Function(_GroupedItem value) groupedItem,
  }) {
    return ungroupedItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Item value)? ungroupedItem,
    TResult? Function(_Header value)? header,
    TResult? Function(_GroupedItem value)? groupedItem,
  }) {
    return ungroupedItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Item value)? ungroupedItem,
    TResult Function(_Header value)? header,
    TResult Function(_GroupedItem value)? groupedItem,
    required TResult orElse(),
  }) {
    if (ungroupedItem != null) {
      return ungroupedItem(this);
    }
    return orElse();
  }
}

abstract class _Item implements ChecklistPageEntry {
  const factory _Item({required final ChecklistItem item}) = _$ItemImpl;

  ChecklistItem get item;

  /// Create a copy of ChecklistPageEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HeaderImplCopyWith<$Res> {
  factory _$$HeaderImplCopyWith(
          _$HeaderImpl value, $Res Function(_$HeaderImpl) then) =
      __$$HeaderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ChecklistGroup group});

  $ChecklistGroupCopyWith<$Res> get group;
}

/// @nodoc
class __$$HeaderImplCopyWithImpl<$Res>
    extends _$ChecklistPageEntryCopyWithImpl<$Res, _$HeaderImpl>
    implements _$$HeaderImplCopyWith<$Res> {
  __$$HeaderImplCopyWithImpl(
      _$HeaderImpl _value, $Res Function(_$HeaderImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChecklistPageEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? group = null,
  }) {
    return _then(_$HeaderImpl(
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as ChecklistGroup,
    ));
  }

  /// Create a copy of ChecklistPageEntry
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

class _$HeaderImpl implements _Header {
  const _$HeaderImpl({required this.group});

  @override
  final ChecklistGroup group;

  @override
  String toString() {
    return 'ChecklistPageEntry.header(group: $group)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeaderImpl &&
            (identical(other.group, group) || other.group == group));
  }

  @override
  int get hashCode => Object.hash(runtimeType, group);

  /// Create a copy of ChecklistPageEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HeaderImplCopyWith<_$HeaderImpl> get copyWith =>
      __$$HeaderImplCopyWithImpl<_$HeaderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ChecklistItem item) ungroupedItem,
    required TResult Function(ChecklistGroup group) header,
    required TResult Function(ChecklistItem item, bool lastInGroup) groupedItem,
  }) {
    return header(group);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ChecklistItem item)? ungroupedItem,
    TResult? Function(ChecklistGroup group)? header,
    TResult? Function(ChecklistItem item, bool lastInGroup)? groupedItem,
  }) {
    return header?.call(group);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ChecklistItem item)? ungroupedItem,
    TResult Function(ChecklistGroup group)? header,
    TResult Function(ChecklistItem item, bool lastInGroup)? groupedItem,
    required TResult orElse(),
  }) {
    if (header != null) {
      return header(group);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Item value) ungroupedItem,
    required TResult Function(_Header value) header,
    required TResult Function(_GroupedItem value) groupedItem,
  }) {
    return header(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Item value)? ungroupedItem,
    TResult? Function(_Header value)? header,
    TResult? Function(_GroupedItem value)? groupedItem,
  }) {
    return header?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Item value)? ungroupedItem,
    TResult Function(_Header value)? header,
    TResult Function(_GroupedItem value)? groupedItem,
    required TResult orElse(),
  }) {
    if (header != null) {
      return header(this);
    }
    return orElse();
  }
}

abstract class _Header implements ChecklistPageEntry {
  const factory _Header({required final ChecklistGroup group}) = _$HeaderImpl;

  ChecklistGroup get group;

  /// Create a copy of ChecklistPageEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HeaderImplCopyWith<_$HeaderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GroupedItemImplCopyWith<$Res> {
  factory _$$GroupedItemImplCopyWith(
          _$GroupedItemImpl value, $Res Function(_$GroupedItemImpl) then) =
      __$$GroupedItemImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ChecklistItem item, bool lastInGroup});

  $ChecklistItemCopyWith<$Res> get item;
}

/// @nodoc
class __$$GroupedItemImplCopyWithImpl<$Res>
    extends _$ChecklistPageEntryCopyWithImpl<$Res, _$GroupedItemImpl>
    implements _$$GroupedItemImplCopyWith<$Res> {
  __$$GroupedItemImplCopyWithImpl(
      _$GroupedItemImpl _value, $Res Function(_$GroupedItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChecklistPageEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? lastInGroup = null,
  }) {
    return _then(_$GroupedItemImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as ChecklistItem,
      lastInGroup: null == lastInGroup
          ? _value.lastInGroup
          : lastInGroup // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of ChecklistPageEntry
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

class _$GroupedItemImpl implements _GroupedItem {
  const _$GroupedItemImpl({required this.item, required this.lastInGroup});

  @override
  final ChecklistItem item;
  @override
  final bool lastInGroup;

  @override
  String toString() {
    return 'ChecklistPageEntry.groupedItem(item: $item, lastInGroup: $lastInGroup)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupedItemImpl &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.lastInGroup, lastInGroup) ||
                other.lastInGroup == lastInGroup));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item, lastInGroup);

  /// Create a copy of ChecklistPageEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupedItemImplCopyWith<_$GroupedItemImpl> get copyWith =>
      __$$GroupedItemImplCopyWithImpl<_$GroupedItemImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ChecklistItem item) ungroupedItem,
    required TResult Function(ChecklistGroup group) header,
    required TResult Function(ChecklistItem item, bool lastInGroup) groupedItem,
  }) {
    return groupedItem(item, lastInGroup);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ChecklistItem item)? ungroupedItem,
    TResult? Function(ChecklistGroup group)? header,
    TResult? Function(ChecklistItem item, bool lastInGroup)? groupedItem,
  }) {
    return groupedItem?.call(item, lastInGroup);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ChecklistItem item)? ungroupedItem,
    TResult Function(ChecklistGroup group)? header,
    TResult Function(ChecklistItem item, bool lastInGroup)? groupedItem,
    required TResult orElse(),
  }) {
    if (groupedItem != null) {
      return groupedItem(item, lastInGroup);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Item value) ungroupedItem,
    required TResult Function(_Header value) header,
    required TResult Function(_GroupedItem value) groupedItem,
  }) {
    return groupedItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Item value)? ungroupedItem,
    TResult? Function(_Header value)? header,
    TResult? Function(_GroupedItem value)? groupedItem,
  }) {
    return groupedItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Item value)? ungroupedItem,
    TResult Function(_Header value)? header,
    TResult Function(_GroupedItem value)? groupedItem,
    required TResult orElse(),
  }) {
    if (groupedItem != null) {
      return groupedItem(this);
    }
    return orElse();
  }
}

abstract class _GroupedItem implements ChecklistPageEntry {
  const factory _GroupedItem(
      {required final ChecklistItem item,
      required final bool lastInGroup}) = _$GroupedItemImpl;

  ChecklistItem get item;
  bool get lastInGroup;

  /// Create a copy of ChecklistPageEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupedItemImplCopyWith<_$GroupedItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
