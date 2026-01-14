// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_list_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShoppingListViewModel {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShoppingListViewModel);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ShoppingListViewModel()';
}


}

/// @nodoc
class $ShoppingListViewModelCopyWith<$Res>  {
$ShoppingListViewModelCopyWith(ShoppingListViewModel _, $Res Function(ShoppingListViewModel) __);
}


/// Adds pattern-matching-related methods to [ShoppingListViewModel].
extension ShoppingListViewModelPatterns on ShoppingListViewModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Error value)?  error,TResult Function( _Loading value)?  loading,TResult Function( _NotFound value)?  notFound,TResult Function( _ShoppingList value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Error() when error != null:
return error(_that);case _Loading() when loading != null:
return loading(_that);case _NotFound() when notFound != null:
return notFound(_that);case _ShoppingList() when success != null:
return success(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Error value)  error,required TResult Function( _Loading value)  loading,required TResult Function( _NotFound value)  notFound,required TResult Function( _ShoppingList value)  success,}){
final _that = this;
switch (_that) {
case _Error():
return error(_that);case _Loading():
return loading(_that);case _NotFound():
return notFound(_that);case _ShoppingList():
return success(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Error value)?  error,TResult? Function( _Loading value)?  loading,TResult? Function( _NotFound value)?  notFound,TResult? Function( _ShoppingList value)?  success,}){
final _that = this;
switch (_that) {
case _Error() when error != null:
return error(_that);case _Loading() when loading != null:
return loading(_that);case _NotFound() when notFound != null:
return notFound(_that);case _ShoppingList() when success != null:
return success(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  error,TResult Function()?  loading,TResult Function()?  notFound,TResult Function( ListSummary list,  List<ShoppingListPageItem> items)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Error() when error != null:
return error();case _Loading() when loading != null:
return loading();case _NotFound() when notFound != null:
return notFound();case _ShoppingList() when success != null:
return success(_that.list,_that.items);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  error,required TResult Function()  loading,required TResult Function()  notFound,required TResult Function( ListSummary list,  List<ShoppingListPageItem> items)  success,}) {final _that = this;
switch (_that) {
case _Error():
return error();case _Loading():
return loading();case _NotFound():
return notFound();case _ShoppingList():
return success(_that.list,_that.items);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  error,TResult? Function()?  loading,TResult? Function()?  notFound,TResult? Function( ListSummary list,  List<ShoppingListPageItem> items)?  success,}) {final _that = this;
switch (_that) {
case _Error() when error != null:
return error();case _Loading() when loading != null:
return loading();case _NotFound() when notFound != null:
return notFound();case _ShoppingList() when success != null:
return success(_that.list,_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _Error extends ShoppingListViewModel {
  const _Error(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ShoppingListViewModel.error()';
}


}




/// @nodoc


class _Loading extends ShoppingListViewModel {
  const _Loading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ShoppingListViewModel.loading()';
}


}




/// @nodoc


class _NotFound extends ShoppingListViewModel {
  const _NotFound(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ShoppingListViewModel.notFound()';
}


}




/// @nodoc


class _ShoppingList extends ShoppingListViewModel {
  const _ShoppingList({required this.list, required final  List<ShoppingListPageItem> items}): _items = items,super._();
  

 final  ListSummary list;
 final  List<ShoppingListPageItem> _items;
 List<ShoppingListPageItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of ShoppingListViewModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShoppingListCopyWith<_ShoppingList> get copyWith => __$ShoppingListCopyWithImpl<_ShoppingList>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShoppingList&&(identical(other.list, list) || other.list == list)&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,list,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'ShoppingListViewModel.success(list: $list, items: $items)';
}


}

/// @nodoc
abstract mixin class _$ShoppingListCopyWith<$Res> implements $ShoppingListViewModelCopyWith<$Res> {
  factory _$ShoppingListCopyWith(_ShoppingList value, $Res Function(_ShoppingList) _then) = __$ShoppingListCopyWithImpl;
@useResult
$Res call({
 ListSummary list, List<ShoppingListPageItem> items
});


$ListSummaryCopyWith<$Res> get list;

}
/// @nodoc
class __$ShoppingListCopyWithImpl<$Res>
    implements _$ShoppingListCopyWith<$Res> {
  __$ShoppingListCopyWithImpl(this._self, this._then);

  final _ShoppingList _self;
  final $Res Function(_ShoppingList) _then;

/// Create a copy of ShoppingListViewModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? list = null,Object? items = null,}) {
  return _then(_ShoppingList(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as ListSummary,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ShoppingListPageItem>,
  ));
}

/// Create a copy of ShoppingListViewModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListSummaryCopyWith<$Res> get list {
  
  return $ListSummaryCopyWith<$Res>(_self.list, (value) {
    return _then(_self.copyWith(list: value));
  });
}
}

/// @nodoc
mixin _$ShoppingListPageItem {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShoppingListPageItem);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ShoppingListPageItem()';
}


}

/// @nodoc
class $ShoppingListPageItemCopyWith<$Res>  {
$ShoppingListPageItemCopyWith(ShoppingListPageItem _, $Res Function(ShoppingListPageItem) __);
}


/// Adds pattern-matching-related methods to [ShoppingListPageItem].
extension ShoppingListPageItemPatterns on ShoppingListPageItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Item value)?  item,TResult Function( _Category value)?  category,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Item() when item != null:
return item(_that);case _Category() when category != null:
return category(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Item value)  item,required TResult Function( _Category value)  category,}){
final _that = this;
switch (_that) {
case _Item():
return item(_that);case _Category():
return category(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Item value)?  item,TResult? Function( _Category value)?  category,}){
final _that = this;
switch (_that) {
case _Item() when item != null:
return item(_that);case _Category() when category != null:
return category(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ShoppingItem item)?  item,TResult Function( String name)?  category,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Item() when item != null:
return item(_that.item);case _Category() when category != null:
return category(_that.name);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ShoppingItem item)  item,required TResult Function( String name)  category,}) {final _that = this;
switch (_that) {
case _Item():
return item(_that.item);case _Category():
return category(_that.name);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ShoppingItem item)?  item,TResult? Function( String name)?  category,}) {final _that = this;
switch (_that) {
case _Item() when item != null:
return item(_that.item);case _Category() when category != null:
return category(_that.name);case _:
  return null;

}
}

}

/// @nodoc


class _Item implements ShoppingListPageItem {
  const _Item({required this.item});
  

 final  ShoppingItem item;

/// Create a copy of ShoppingListPageItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemCopyWith<_Item> get copyWith => __$ItemCopyWithImpl<_Item>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Item&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'ShoppingListPageItem.item(item: $item)';
}


}

/// @nodoc
abstract mixin class _$ItemCopyWith<$Res> implements $ShoppingListPageItemCopyWith<$Res> {
  factory _$ItemCopyWith(_Item value, $Res Function(_Item) _then) = __$ItemCopyWithImpl;
@useResult
$Res call({
 ShoppingItem item
});


$ShoppingItemCopyWith<$Res> get item;

}
/// @nodoc
class __$ItemCopyWithImpl<$Res>
    implements _$ItemCopyWith<$Res> {
  __$ItemCopyWithImpl(this._self, this._then);

  final _Item _self;
  final $Res Function(_Item) _then;

/// Create a copy of ShoppingListPageItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(_Item(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as ShoppingItem,
  ));
}

/// Create a copy of ShoppingListPageItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShoppingItemCopyWith<$Res> get item {
  
  return $ShoppingItemCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}

/// @nodoc


class _Category implements ShoppingListPageItem {
  const _Category({required this.name});
  

 final  String name;

/// Create a copy of ShoppingListPageItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryCopyWith<_Category> get copyWith => __$CategoryCopyWithImpl<_Category>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Category&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'ShoppingListPageItem.category(name: $name)';
}


}

/// @nodoc
abstract mixin class _$CategoryCopyWith<$Res> implements $ShoppingListPageItemCopyWith<$Res> {
  factory _$CategoryCopyWith(_Category value, $Res Function(_Category) _then) = __$CategoryCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class __$CategoryCopyWithImpl<$Res>
    implements _$CategoryCopyWith<$Res> {
  __$CategoryCopyWithImpl(this._self, this._then);

  final _Category _self;
  final $Res Function(_Category) _then;

/// Create a copy of ShoppingListPageItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_Category(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
