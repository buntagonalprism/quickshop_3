// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShoppingItem {

 String get id; String get path; String get product; String get quantity; List<String> get categories; String get addedByUserId; String get lastModifiedByUserId; DateTime get lastModifiedAt; bool get completed;
/// Create a copy of ShoppingItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShoppingItemCopyWith<ShoppingItem> get copyWith => _$ShoppingItemCopyWithImpl<ShoppingItem>(this as ShoppingItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShoppingItem&&(identical(other.id, id) || other.id == id)&&(identical(other.path, path) || other.path == path)&&(identical(other.product, product) || other.product == product)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.addedByUserId, addedByUserId) || other.addedByUserId == addedByUserId)&&(identical(other.lastModifiedByUserId, lastModifiedByUserId) || other.lastModifiedByUserId == lastModifiedByUserId)&&(identical(other.lastModifiedAt, lastModifiedAt) || other.lastModifiedAt == lastModifiedAt)&&(identical(other.completed, completed) || other.completed == completed));
}


@override
int get hashCode => Object.hash(runtimeType,id,path,product,quantity,const DeepCollectionEquality().hash(categories),addedByUserId,lastModifiedByUserId,lastModifiedAt,completed);

@override
String toString() {
  return 'ShoppingItem(id: $id, path: $path, product: $product, quantity: $quantity, categories: $categories, addedByUserId: $addedByUserId, lastModifiedByUserId: $lastModifiedByUserId, lastModifiedAt: $lastModifiedAt, completed: $completed)';
}


}

/// @nodoc
abstract mixin class $ShoppingItemCopyWith<$Res>  {
  factory $ShoppingItemCopyWith(ShoppingItem value, $Res Function(ShoppingItem) _then) = _$ShoppingItemCopyWithImpl;
@useResult
$Res call({
 String id, String path, String product, String quantity, List<String> categories, String addedByUserId, String lastModifiedByUserId, DateTime lastModifiedAt, bool completed
});




}
/// @nodoc
class _$ShoppingItemCopyWithImpl<$Res>
    implements $ShoppingItemCopyWith<$Res> {
  _$ShoppingItemCopyWithImpl(this._self, this._then);

  final ShoppingItem _self;
  final $Res Function(ShoppingItem) _then;

/// Create a copy of ShoppingItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? path = null,Object? product = null,Object? quantity = null,Object? categories = null,Object? addedByUserId = null,Object? lastModifiedByUserId = null,Object? lastModifiedAt = null,Object? completed = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,addedByUserId: null == addedByUserId ? _self.addedByUserId : addedByUserId // ignore: cast_nullable_to_non_nullable
as String,lastModifiedByUserId: null == lastModifiedByUserId ? _self.lastModifiedByUserId : lastModifiedByUserId // ignore: cast_nullable_to_non_nullable
as String,lastModifiedAt: null == lastModifiedAt ? _self.lastModifiedAt : lastModifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ShoppingItem].
extension ShoppingItemPatterns on ShoppingItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShoppingItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShoppingItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShoppingItem value)  $default,){
final _that = this;
switch (_that) {
case _ShoppingItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShoppingItem value)?  $default,){
final _that = this;
switch (_that) {
case _ShoppingItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String path,  String product,  String quantity,  List<String> categories,  String addedByUserId,  String lastModifiedByUserId,  DateTime lastModifiedAt,  bool completed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShoppingItem() when $default != null:
return $default(_that.id,_that.path,_that.product,_that.quantity,_that.categories,_that.addedByUserId,_that.lastModifiedByUserId,_that.lastModifiedAt,_that.completed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String path,  String product,  String quantity,  List<String> categories,  String addedByUserId,  String lastModifiedByUserId,  DateTime lastModifiedAt,  bool completed)  $default,) {final _that = this;
switch (_that) {
case _ShoppingItem():
return $default(_that.id,_that.path,_that.product,_that.quantity,_that.categories,_that.addedByUserId,_that.lastModifiedByUserId,_that.lastModifiedAt,_that.completed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String path,  String product,  String quantity,  List<String> categories,  String addedByUserId,  String lastModifiedByUserId,  DateTime lastModifiedAt,  bool completed)?  $default,) {final _that = this;
switch (_that) {
case _ShoppingItem() when $default != null:
return $default(_that.id,_that.path,_that.product,_that.quantity,_that.categories,_that.addedByUserId,_that.lastModifiedByUserId,_that.lastModifiedAt,_that.completed);case _:
  return null;

}
}

}

/// @nodoc


class _ShoppingItem extends ShoppingItem {
  const _ShoppingItem({required this.id, required this.path, required this.product, required this.quantity, required final  List<String> categories, required this.addedByUserId, required this.lastModifiedByUserId, required this.lastModifiedAt, required this.completed}): _categories = categories,super._();
  

@override final  String id;
@override final  String path;
@override final  String product;
@override final  String quantity;
 final  List<String> _categories;
@override List<String> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override final  String addedByUserId;
@override final  String lastModifiedByUserId;
@override final  DateTime lastModifiedAt;
@override final  bool completed;

/// Create a copy of ShoppingItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShoppingItemCopyWith<_ShoppingItem> get copyWith => __$ShoppingItemCopyWithImpl<_ShoppingItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShoppingItem&&(identical(other.id, id) || other.id == id)&&(identical(other.path, path) || other.path == path)&&(identical(other.product, product) || other.product == product)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.addedByUserId, addedByUserId) || other.addedByUserId == addedByUserId)&&(identical(other.lastModifiedByUserId, lastModifiedByUserId) || other.lastModifiedByUserId == lastModifiedByUserId)&&(identical(other.lastModifiedAt, lastModifiedAt) || other.lastModifiedAt == lastModifiedAt)&&(identical(other.completed, completed) || other.completed == completed));
}


@override
int get hashCode => Object.hash(runtimeType,id,path,product,quantity,const DeepCollectionEquality().hash(_categories),addedByUserId,lastModifiedByUserId,lastModifiedAt,completed);

@override
String toString() {
  return 'ShoppingItem(id: $id, path: $path, product: $product, quantity: $quantity, categories: $categories, addedByUserId: $addedByUserId, lastModifiedByUserId: $lastModifiedByUserId, lastModifiedAt: $lastModifiedAt, completed: $completed)';
}


}

/// @nodoc
abstract mixin class _$ShoppingItemCopyWith<$Res> implements $ShoppingItemCopyWith<$Res> {
  factory _$ShoppingItemCopyWith(_ShoppingItem value, $Res Function(_ShoppingItem) _then) = __$ShoppingItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String path, String product, String quantity, List<String> categories, String addedByUserId, String lastModifiedByUserId, DateTime lastModifiedAt, bool completed
});




}
/// @nodoc
class __$ShoppingItemCopyWithImpl<$Res>
    implements _$ShoppingItemCopyWith<$Res> {
  __$ShoppingItemCopyWithImpl(this._self, this._then);

  final _ShoppingItem _self;
  final $Res Function(_ShoppingItem) _then;

/// Create a copy of ShoppingItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? path = null,Object? product = null,Object? quantity = null,Object? categories = null,Object? addedByUserId = null,Object? lastModifiedByUserId = null,Object? lastModifiedAt = null,Object? completed = null,}) {
  return _then(_ShoppingItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,addedByUserId: null == addedByUserId ? _self.addedByUserId : addedByUserId // ignore: cast_nullable_to_non_nullable
as String,lastModifiedByUserId: null == lastModifiedByUserId ? _self.lastModifiedByUserId : lastModifiedByUserId // ignore: cast_nullable_to_non_nullable
as String,lastModifiedAt: null == lastModifiedAt ? _self.lastModifiedAt : lastModifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
