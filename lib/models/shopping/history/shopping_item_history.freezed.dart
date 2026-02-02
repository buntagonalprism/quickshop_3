// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_item_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShoppingItemHistory {

 String get id; String get name; String get nameLower; String get category; DateTime get lastUsed; int get usageCount; bool get deleted;
/// Create a copy of ShoppingItemHistory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShoppingItemHistoryCopyWith<ShoppingItemHistory> get copyWith => _$ShoppingItemHistoryCopyWithImpl<ShoppingItemHistory>(this as ShoppingItemHistory, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShoppingItemHistory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nameLower, nameLower) || other.nameLower == nameLower)&&(identical(other.category, category) || other.category == category)&&(identical(other.lastUsed, lastUsed) || other.lastUsed == lastUsed)&&(identical(other.usageCount, usageCount) || other.usageCount == usageCount)&&(identical(other.deleted, deleted) || other.deleted == deleted));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,nameLower,category,lastUsed,usageCount,deleted);

@override
String toString() {
  return 'ShoppingItemHistory(id: $id, name: $name, nameLower: $nameLower, category: $category, lastUsed: $lastUsed, usageCount: $usageCount, deleted: $deleted)';
}


}

/// @nodoc
abstract mixin class $ShoppingItemHistoryCopyWith<$Res>  {
  factory $ShoppingItemHistoryCopyWith(ShoppingItemHistory value, $Res Function(ShoppingItemHistory) _then) = _$ShoppingItemHistoryCopyWithImpl;
@useResult
$Res call({
 String id, String name, String nameLower, String category, DateTime lastUsed, int usageCount, bool deleted
});




}
/// @nodoc
class _$ShoppingItemHistoryCopyWithImpl<$Res>
    implements $ShoppingItemHistoryCopyWith<$Res> {
  _$ShoppingItemHistoryCopyWithImpl(this._self, this._then);

  final ShoppingItemHistory _self;
  final $Res Function(ShoppingItemHistory) _then;

/// Create a copy of ShoppingItemHistory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? nameLower = null,Object? category = null,Object? lastUsed = null,Object? usageCount = null,Object? deleted = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameLower: null == nameLower ? _self.nameLower : nameLower // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,lastUsed: null == lastUsed ? _self.lastUsed : lastUsed // ignore: cast_nullable_to_non_nullable
as DateTime,usageCount: null == usageCount ? _self.usageCount : usageCount // ignore: cast_nullable_to_non_nullable
as int,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ShoppingItemHistory].
extension ShoppingItemHistoryPatterns on ShoppingItemHistory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShoppingItemHistory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShoppingItemHistory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShoppingItemHistory value)  $default,){
final _that = this;
switch (_that) {
case _ShoppingItemHistory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShoppingItemHistory value)?  $default,){
final _that = this;
switch (_that) {
case _ShoppingItemHistory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String nameLower,  String category,  DateTime lastUsed,  int usageCount,  bool deleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShoppingItemHistory() when $default != null:
return $default(_that.id,_that.name,_that.nameLower,_that.category,_that.lastUsed,_that.usageCount,_that.deleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String nameLower,  String category,  DateTime lastUsed,  int usageCount,  bool deleted)  $default,) {final _that = this;
switch (_that) {
case _ShoppingItemHistory():
return $default(_that.id,_that.name,_that.nameLower,_that.category,_that.lastUsed,_that.usageCount,_that.deleted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String nameLower,  String category,  DateTime lastUsed,  int usageCount,  bool deleted)?  $default,) {final _that = this;
switch (_that) {
case _ShoppingItemHistory() when $default != null:
return $default(_that.id,_that.name,_that.nameLower,_that.category,_that.lastUsed,_that.usageCount,_that.deleted);case _:
  return null;

}
}

}

/// @nodoc


class _ShoppingItemHistory extends ShoppingItemHistory {
  const _ShoppingItemHistory({required this.id, required this.name, required this.nameLower, required this.category, required this.lastUsed, required this.usageCount, required this.deleted}): super._();
  

@override final  String id;
@override final  String name;
@override final  String nameLower;
@override final  String category;
@override final  DateTime lastUsed;
@override final  int usageCount;
@override final  bool deleted;

/// Create a copy of ShoppingItemHistory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShoppingItemHistoryCopyWith<_ShoppingItemHistory> get copyWith => __$ShoppingItemHistoryCopyWithImpl<_ShoppingItemHistory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShoppingItemHistory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nameLower, nameLower) || other.nameLower == nameLower)&&(identical(other.category, category) || other.category == category)&&(identical(other.lastUsed, lastUsed) || other.lastUsed == lastUsed)&&(identical(other.usageCount, usageCount) || other.usageCount == usageCount)&&(identical(other.deleted, deleted) || other.deleted == deleted));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,nameLower,category,lastUsed,usageCount,deleted);

@override
String toString() {
  return 'ShoppingItemHistory(id: $id, name: $name, nameLower: $nameLower, category: $category, lastUsed: $lastUsed, usageCount: $usageCount, deleted: $deleted)';
}


}

/// @nodoc
abstract mixin class _$ShoppingItemHistoryCopyWith<$Res> implements $ShoppingItemHistoryCopyWith<$Res> {
  factory _$ShoppingItemHistoryCopyWith(_ShoppingItemHistory value, $Res Function(_ShoppingItemHistory) _then) = __$ShoppingItemHistoryCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String nameLower, String category, DateTime lastUsed, int usageCount, bool deleted
});




}
/// @nodoc
class __$ShoppingItemHistoryCopyWithImpl<$Res>
    implements _$ShoppingItemHistoryCopyWith<$Res> {
  __$ShoppingItemHistoryCopyWithImpl(this._self, this._then);

  final _ShoppingItemHistory _self;
  final $Res Function(_ShoppingItemHistory) _then;

/// Create a copy of ShoppingItemHistory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? nameLower = null,Object? category = null,Object? lastUsed = null,Object? usageCount = null,Object? deleted = null,}) {
  return _then(_ShoppingItemHistory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameLower: null == nameLower ? _self.nameLower : nameLower // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,lastUsed: null == lastUsed ? _self.lastUsed : lastUsed // ignore: cast_nullable_to_non_nullable
as DateTime,usageCount: null == usageCount ? _self.usageCount : usageCount // ignore: cast_nullable_to_non_nullable
as int,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
