// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_list_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ShoppingListViewModel {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function() loading,
    required TResult Function() notFound,
    required TResult Function(
            ListSummary list, List<ShoppingListPageItem> items)
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function()? loading,
    TResult? Function()? notFound,
    TResult? Function(ListSummary list, List<ShoppingListPageItem> items)?
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function()? loading,
    TResult Function()? notFound,
    TResult Function(ListSummary list, List<ShoppingListPageItem> items)?
        success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_ShoppingList value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_ShoppingList value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_ShoppingList value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingListViewModelCopyWith<$Res> {
  factory $ShoppingListViewModelCopyWith(ShoppingListViewModel value,
          $Res Function(ShoppingListViewModel) then) =
      _$ShoppingListViewModelCopyWithImpl<$Res, ShoppingListViewModel>;
}

/// @nodoc
class _$ShoppingListViewModelCopyWithImpl<$Res,
        $Val extends ShoppingListViewModel>
    implements $ShoppingListViewModelCopyWith<$Res> {
  _$ShoppingListViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShoppingListViewModel
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
    extends _$ShoppingListViewModelCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShoppingListViewModel
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ErrorImpl extends _Error {
  const _$ErrorImpl() : super._();

  @override
  String toString() {
    return 'ShoppingListViewModel.error()';
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
            ListSummary list, List<ShoppingListPageItem> items)
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
    TResult? Function(ListSummary list, List<ShoppingListPageItem> items)?
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
    TResult Function(ListSummary list, List<ShoppingListPageItem> items)?
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
    required TResult Function(_ShoppingList value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_ShoppingList value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_ShoppingList value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error extends ShoppingListViewModel {
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
    extends _$ShoppingListViewModelCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShoppingListViewModel
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl extends _Loading {
  const _$LoadingImpl() : super._();

  @override
  String toString() {
    return 'ShoppingListViewModel.loading()';
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
            ListSummary list, List<ShoppingListPageItem> items)
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
    TResult? Function(ListSummary list, List<ShoppingListPageItem> items)?
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
    TResult Function(ListSummary list, List<ShoppingListPageItem> items)?
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
    required TResult Function(_ShoppingList value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_ShoppingList value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_ShoppingList value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends ShoppingListViewModel {
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
    extends _$ShoppingListViewModelCopyWithImpl<$Res, _$NotFoundImpl>
    implements _$$NotFoundImplCopyWith<$Res> {
  __$$NotFoundImplCopyWithImpl(
      _$NotFoundImpl _value, $Res Function(_$NotFoundImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShoppingListViewModel
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NotFoundImpl extends _NotFound {
  const _$NotFoundImpl() : super._();

  @override
  String toString() {
    return 'ShoppingListViewModel.notFound()';
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
            ListSummary list, List<ShoppingListPageItem> items)
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
    TResult? Function(ListSummary list, List<ShoppingListPageItem> items)?
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
    TResult Function(ListSummary list, List<ShoppingListPageItem> items)?
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
    required TResult Function(_ShoppingList value) success,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_ShoppingList value)? success,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_ShoppingList value)? success,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class _NotFound extends ShoppingListViewModel {
  const factory _NotFound() = _$NotFoundImpl;
  const _NotFound._() : super._();
}

/// @nodoc
abstract class _$$ShoppingListImplCopyWith<$Res> {
  factory _$$ShoppingListImplCopyWith(
          _$ShoppingListImpl value, $Res Function(_$ShoppingListImpl) then) =
      __$$ShoppingListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ListSummary list, List<ShoppingListPageItem> items});

  $ListSummaryCopyWith<$Res> get list;
}

/// @nodoc
class __$$ShoppingListImplCopyWithImpl<$Res>
    extends _$ShoppingListViewModelCopyWithImpl<$Res, _$ShoppingListImpl>
    implements _$$ShoppingListImplCopyWith<$Res> {
  __$$ShoppingListImplCopyWithImpl(
      _$ShoppingListImpl _value, $Res Function(_$ShoppingListImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShoppingListViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? items = null,
  }) {
    return _then(_$ShoppingListImpl(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as ListSummary,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ShoppingListPageItem>,
    ));
  }

  /// Create a copy of ShoppingListViewModel
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

class _$ShoppingListImpl extends _ShoppingList {
  const _$ShoppingListImpl(
      {required this.list, required final List<ShoppingListPageItem> items})
      : _items = items,
        super._();

  @override
  final ListSummary list;
  final List<ShoppingListPageItem> _items;
  @override
  List<ShoppingListPageItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ShoppingListViewModel.success(list: $list, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingListImpl &&
            (identical(other.list, list) || other.list == list) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, list, const DeepCollectionEquality().hash(_items));

  /// Create a copy of ShoppingListViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingListImplCopyWith<_$ShoppingListImpl> get copyWith =>
      __$$ShoppingListImplCopyWithImpl<_$ShoppingListImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function() loading,
    required TResult Function() notFound,
    required TResult Function(
            ListSummary list, List<ShoppingListPageItem> items)
        success,
  }) {
    return success(list, items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function()? loading,
    TResult? Function()? notFound,
    TResult? Function(ListSummary list, List<ShoppingListPageItem> items)?
        success,
  }) {
    return success?.call(list, items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function()? loading,
    TResult Function()? notFound,
    TResult Function(ListSummary list, List<ShoppingListPageItem> items)?
        success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(list, items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_ShoppingList value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_ShoppingList value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_ShoppingList value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _ShoppingList extends ShoppingListViewModel {
  const factory _ShoppingList(
      {required final ListSummary list,
      required final List<ShoppingListPageItem> items}) = _$ShoppingListImpl;
  const _ShoppingList._() : super._();

  ListSummary get list;
  List<ShoppingListPageItem> get items;

  /// Create a copy of ShoppingListViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShoppingListImplCopyWith<_$ShoppingListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ShoppingListPageItem {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ShoppingItem item) item,
    required TResult Function(String name) category,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ShoppingItem item)? item,
    TResult? Function(String name)? category,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ShoppingItem item)? item,
    TResult Function(String name)? category,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Item value) item,
    required TResult Function(_Category value) category,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Item value)? item,
    TResult? Function(_Category value)? category,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Item value)? item,
    TResult Function(_Category value)? category,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingListPageItemCopyWith<$Res> {
  factory $ShoppingListPageItemCopyWith(ShoppingListPageItem value,
          $Res Function(ShoppingListPageItem) then) =
      _$ShoppingListPageItemCopyWithImpl<$Res, ShoppingListPageItem>;
}

/// @nodoc
class _$ShoppingListPageItemCopyWithImpl<$Res,
        $Val extends ShoppingListPageItem>
    implements $ShoppingListPageItemCopyWith<$Res> {
  _$ShoppingListPageItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShoppingListPageItem
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ItemImplCopyWith<$Res> {
  factory _$$ItemImplCopyWith(
          _$ItemImpl value, $Res Function(_$ItemImpl) then) =
      __$$ItemImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ShoppingItem item});

  $ShoppingItemCopyWith<$Res> get item;
}

/// @nodoc
class __$$ItemImplCopyWithImpl<$Res>
    extends _$ShoppingListPageItemCopyWithImpl<$Res, _$ItemImpl>
    implements _$$ItemImplCopyWith<$Res> {
  __$$ItemImplCopyWithImpl(_$ItemImpl _value, $Res Function(_$ItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShoppingListPageItem
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
              as ShoppingItem,
    ));
  }

  /// Create a copy of ShoppingListPageItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShoppingItemCopyWith<$Res> get item {
    return $ShoppingItemCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$ItemImpl implements _Item {
  const _$ItemImpl({required this.item});

  @override
  final ShoppingItem item;

  @override
  String toString() {
    return 'ShoppingListPageItem.item(item: $item)';
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

  /// Create a copy of ShoppingListPageItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      __$$ItemImplCopyWithImpl<_$ItemImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ShoppingItem item) item,
    required TResult Function(String name) category,
  }) {
    return item(this.item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ShoppingItem item)? item,
    TResult? Function(String name)? category,
  }) {
    return item?.call(this.item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ShoppingItem item)? item,
    TResult Function(String name)? category,
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
    required TResult Function(_Item value) item,
    required TResult Function(_Category value) category,
  }) {
    return item(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Item value)? item,
    TResult? Function(_Category value)? category,
  }) {
    return item?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Item value)? item,
    TResult Function(_Category value)? category,
    required TResult orElse(),
  }) {
    if (item != null) {
      return item(this);
    }
    return orElse();
  }
}

abstract class _Item implements ShoppingListPageItem {
  const factory _Item({required final ShoppingItem item}) = _$ItemImpl;

  ShoppingItem get item;

  /// Create a copy of ShoppingListPageItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CategoryImplCopyWith<$Res> {
  factory _$$CategoryImplCopyWith(
          _$CategoryImpl value, $Res Function(_$CategoryImpl) then) =
      __$$CategoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$CategoryImplCopyWithImpl<$Res>
    extends _$ShoppingListPageItemCopyWithImpl<$Res, _$CategoryImpl>
    implements _$$CategoryImplCopyWith<$Res> {
  __$$CategoryImplCopyWithImpl(
      _$CategoryImpl _value, $Res Function(_$CategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShoppingListPageItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$CategoryImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CategoryImpl implements _Category {
  const _$CategoryImpl({required this.name});

  @override
  final String name;

  @override
  String toString() {
    return 'ShoppingListPageItem.category(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of ShoppingListPageItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      __$$CategoryImplCopyWithImpl<_$CategoryImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ShoppingItem item) item,
    required TResult Function(String name) category,
  }) {
    return category(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ShoppingItem item)? item,
    TResult? Function(String name)? category,
  }) {
    return category?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ShoppingItem item)? item,
    TResult Function(String name)? category,
    required TResult orElse(),
  }) {
    if (category != null) {
      return category(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Item value) item,
    required TResult Function(_Category value) category,
  }) {
    return category(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Item value)? item,
    TResult? Function(_Category value)? category,
  }) {
    return category?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Item value)? item,
    TResult Function(_Category value)? category,
    required TResult orElse(),
  }) {
    if (category != null) {
      return category(this);
    }
    return orElse();
  }
}

abstract class _Category implements ShoppingListPageItem {
  const factory _Category({required final String name}) = _$CategoryImpl;

  String get name;

  /// Create a copy of ShoppingListPageItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
