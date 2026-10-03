// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_list_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShoppingList {

 ListSummary get list; List<ShoppingListRow> get rows;
/// Create a copy of ShoppingList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShoppingListCopyWith<ShoppingList> get copyWith => _$ShoppingListCopyWithImpl<ShoppingList>(this as ShoppingList, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ShoppingList;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShoppingList&&(identical(other.list, _this.list) || other.list == _this.list)&&const DeepCollectionEquality().equals(other.rows, _this.rows));
}


@override
int get hashCode {
  final _this = this as ShoppingList;
  return Object.hash(runtimeType,_this.list,const DeepCollectionEquality().hash(_this.rows));
}

@override
String toString() {
  final _this = this as ShoppingList;
  return 'ShoppingList(list: ${_this.list}, rows: ${_this.rows})';
}


}

/// @nodoc
abstract mixin class $ShoppingListCopyWith<$Res>  {
  factory $ShoppingListCopyWith(ShoppingList value, $Res Function(ShoppingList) _then) = _$ShoppingListCopyWithImpl;
@useResult
$Res call({
 ListSummary list, List<ShoppingListRow> rows
});


$ListSummaryCopyWith<$Res> get list;

}
/// @nodoc
class _$ShoppingListCopyWithImpl<$Res>
    implements $ShoppingListCopyWith<$Res> {
  _$ShoppingListCopyWithImpl(this._self, this._then);

  final ShoppingList _self;
  final $Res Function(ShoppingList) _then;

/// Create a copy of ShoppingList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? list = null,Object? rows = null,}) {
  return _then(ShoppingList(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as ListSummary,rows: null == rows ? _self.rows : rows // ignore: cast_nullable_to_non_nullable
as List<ShoppingListRow>,
  ));
}
/// Create a copy of ShoppingList
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListSummaryCopyWith<$Res> get list {
  
  return $ListSummaryCopyWith<$Res>(_self.list, (value) {
    return _then(_self.copyWith(list: value));
  });
}
}


/// Adds pattern-matching-related methods to [ShoppingList].
extension ShoppingListPatterns on ShoppingList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShoppingList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShoppingList() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShoppingList value)  $default,){
final _that = this;
switch (_that) {
case _ShoppingList():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShoppingList value)?  $default,){
final _that = this;
switch (_that) {
case _ShoppingList() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ListSummary list,  List<ShoppingListRow> rows)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShoppingList() when $default != null:
return $default(_that.list,_that.rows);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ListSummary list,  List<ShoppingListRow> rows)  $default,) {final _that = this;
switch (_that) {
case _ShoppingList():
return $default(_that.list,_that.rows);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ListSummary list,  List<ShoppingListRow> rows)?  $default,) {final _that = this;
switch (_that) {
case _ShoppingList() when $default != null:
return $default(_that.list,_that.rows);case _:
  return null;

}
}

}

/// @nodoc


class _ShoppingList implements ShoppingList {
  const _ShoppingList({required this.list, required  List<ShoppingListRow> rows}): _rows = rows;
  

@override final  ListSummary list;
 final  List<ShoppingListRow> _rows;
@override List<ShoppingListRow> get rows {
  if (_rows is EqualUnmodifiableListView) return _rows;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rows);
}


/// Create a copy of ShoppingList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShoppingListCopyWith<_ShoppingList> get copyWith => __$ShoppingListCopyWithImpl<_ShoppingList>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShoppingList&&(identical(other.list, list) || other.list == list)&&const DeepCollectionEquality().equals(other.rows, _rows));
}


@override
int get hashCode {
    return Object.hash(runtimeType,list,const DeepCollectionEquality().hash(_rows));
}

@override
String toString() {
    return 'ShoppingList(list: $list, rows: $rows)';
}


}

/// @nodoc
abstract mixin class _$ShoppingListCopyWith<$Res> implements $ShoppingListCopyWith<$Res> {
  factory _$ShoppingListCopyWith(_ShoppingList value, $Res Function(_ShoppingList) _then) = __$ShoppingListCopyWithImpl;
@override @useResult
$Res call({
 ListSummary list, List<ShoppingListRow> rows
});


@override $ListSummaryCopyWith<$Res> get list;

}
/// @nodoc
class __$ShoppingListCopyWithImpl<$Res>
    implements _$ShoppingListCopyWith<$Res> {
  __$ShoppingListCopyWithImpl(this._self, this._then);

  final _ShoppingList _self;
  final $Res Function(_ShoppingList) _then;

/// Create a copy of ShoppingList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? list = null,Object? rows = null,}) {
  return _then(_ShoppingList(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as ListSummary,rows: null == rows ? _self._rows : rows // ignore: cast_nullable_to_non_nullable
as List<ShoppingListRow>,
  ));
}

/// Create a copy of ShoppingList
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
mixin _$ShoppingListRow {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ShoppingListRow);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ShoppingListRow()';
}


}

/// @nodoc
class $ShoppingListRowCopyWith<$Res>  {
$ShoppingListRowCopyWith(ShoppingListRow _, $Res Function(ShoppingListRow) __);
}


/// Adds pattern-matching-related methods to [ShoppingListRow].
extension ShoppingListRowPatterns on ShoppingListRow {
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
return category(_that);}
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
return category(_that.name);}
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


class _Item implements ShoppingListRow {
  const _Item({required this.item});
  

 final  ShoppingItem item;

/// Create a copy of ShoppingListRow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemCopyWith<_Item> get copyWith => __$ItemCopyWithImpl<_Item>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Item&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode {
    return Object.hash(runtimeType,item);
}

@override
String toString() {
    return 'ShoppingListRow.item(item: $item)';
}


}

/// @nodoc
abstract mixin class _$ItemCopyWith<$Res> implements $ShoppingListRowCopyWith<$Res> {
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

/// Create a copy of ShoppingListRow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(_Item(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as ShoppingItem,
  ));
}

/// Create a copy of ShoppingListRow
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


class _Category implements ShoppingListRow {
  const _Category({required this.name});
  

 final  String name;

/// Create a copy of ShoppingListRow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryCopyWith<_Category> get copyWith => __$CategoryCopyWithImpl<_Category>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Category&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode {
    return Object.hash(runtimeType,name);
}

@override
String toString() {
    return 'ShoppingListRow.category(name: $name)';
}


}

/// @nodoc
abstract mixin class _$CategoryCopyWith<$Res> implements $ShoppingListRowCopyWith<$Res> {
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

/// Create a copy of ShoppingListRow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_Category(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
