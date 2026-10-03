// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_item_create_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ItemFormData {

 String get filter; ShoppingItemRawData get data; String? get filterError; ShoppingItemErrors? get itemErrors;
/// Create a copy of ItemFormData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemFormDataCopyWith<ItemFormData> get copyWith => _$ItemFormDataCopyWithImpl<ItemFormData>(this as ItemFormData, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ItemFormData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemFormData&&(identical(other.filter, _this.filter) || other.filter == _this.filter)&&(identical(other.data, _this.data) || other.data == _this.data)&&(identical(other.filterError, _this.filterError) || other.filterError == _this.filterError)&&(identical(other.itemErrors, _this.itemErrors) || other.itemErrors == _this.itemErrors));
}


@override
int get hashCode {
  final _this = this as ItemFormData;
  return Object.hash(runtimeType,_this.filter,_this.data,_this.filterError,_this.itemErrors);
}

@override
String toString() {
  final _this = this as ItemFormData;
  return 'ItemFormData(filter: ${_this.filter}, data: ${_this.data}, filterError: ${_this.filterError}, itemErrors: ${_this.itemErrors})';
}


}

/// @nodoc
abstract mixin class $ItemFormDataCopyWith<$Res>  {
  factory $ItemFormDataCopyWith(ItemFormData value, $Res Function(ItemFormData) _then) = _$ItemFormDataCopyWithImpl;
@useResult
$Res call({
 String filter, ShoppingItemRawData data, String? filterError, ShoppingItemErrors? itemErrors
});


$ShoppingItemRawDataCopyWith<$Res> get data;

}
/// @nodoc
class _$ItemFormDataCopyWithImpl<$Res>
    implements $ItemFormDataCopyWith<$Res> {
  _$ItemFormDataCopyWithImpl(this._self, this._then);

  final ItemFormData _self;
  final $Res Function(ItemFormData) _then;

/// Create a copy of ItemFormData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? filter = null,Object? data = null,Object? filterError = freezed,Object? itemErrors = freezed,}) {
  return _then(ItemFormData(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ShoppingItemRawData,filterError: freezed == filterError ? _self.filterError : filterError // ignore: cast_nullable_to_non_nullable
as String?,itemErrors: freezed == itemErrors ? _self.itemErrors : itemErrors // ignore: cast_nullable_to_non_nullable
as ShoppingItemErrors?,
  ));
}
/// Create a copy of ItemFormData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShoppingItemRawDataCopyWith<$Res> get data {
  
  return $ShoppingItemRawDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ItemFormData].
extension ItemFormDataPatterns on ItemFormData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ItemFormData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ItemFormData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ItemFormData value)  $default,){
final _that = this;
switch (_that) {
case _ItemFormData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ItemFormData value)?  $default,){
final _that = this;
switch (_that) {
case _ItemFormData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String filter,  ShoppingItemRawData data,  String? filterError,  ShoppingItemErrors? itemErrors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ItemFormData() when $default != null:
return $default(_that.filter,_that.data,_that.filterError,_that.itemErrors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String filter,  ShoppingItemRawData data,  String? filterError,  ShoppingItemErrors? itemErrors)  $default,) {final _that = this;
switch (_that) {
case _ItemFormData():
return $default(_that.filter,_that.data,_that.filterError,_that.itemErrors);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String filter,  ShoppingItemRawData data,  String? filterError,  ShoppingItemErrors? itemErrors)?  $default,) {final _that = this;
switch (_that) {
case _ItemFormData() when $default != null:
return $default(_that.filter,_that.data,_that.filterError,_that.itemErrors);case _:
  return null;

}
}

}

/// @nodoc


class _ItemFormData extends ItemFormData {
  const _ItemFormData({required this.filter, required this.data, this.filterError, this.itemErrors}): super._();
  

@override final  String filter;
@override final  ShoppingItemRawData data;
@override final  String? filterError;
@override final  ShoppingItemErrors? itemErrors;

/// Create a copy of ItemFormData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemFormDataCopyWith<_ItemFormData> get copyWith => __$ItemFormDataCopyWithImpl<_ItemFormData>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ItemFormData&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.data, data) || other.data == data)&&(identical(other.filterError, filterError) || other.filterError == filterError)&&(identical(other.itemErrors, itemErrors) || other.itemErrors == itemErrors));
}


@override
int get hashCode {
    return Object.hash(runtimeType,filter,data,filterError,itemErrors);
}

@override
String toString() {
    return 'ItemFormData(filter: $filter, data: $data, filterError: $filterError, itemErrors: $itemErrors)';
}


}

/// @nodoc
abstract mixin class _$ItemFormDataCopyWith<$Res> implements $ItemFormDataCopyWith<$Res> {
  factory _$ItemFormDataCopyWith(_ItemFormData value, $Res Function(_ItemFormData) _then) = __$ItemFormDataCopyWithImpl;
@override @useResult
$Res call({
 String filter, ShoppingItemRawData data, String? filterError, ShoppingItemErrors? itemErrors
});


@override $ShoppingItemRawDataCopyWith<$Res> get data;

}
/// @nodoc
class __$ItemFormDataCopyWithImpl<$Res>
    implements _$ItemFormDataCopyWith<$Res> {
  __$ItemFormDataCopyWithImpl(this._self, this._then);

  final _ItemFormData _self;
  final $Res Function(_ItemFormData) _then;

/// Create a copy of ItemFormData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filter = null,Object? data = null,Object? filterError = freezed,Object? itemErrors = freezed,}) {
  return _then(_ItemFormData(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ShoppingItemRawData,filterError: freezed == filterError ? _self.filterError : filterError // ignore: cast_nullable_to_non_nullable
as String?,itemErrors: freezed == itemErrors ? _self.itemErrors : itemErrors // ignore: cast_nullable_to_non_nullable
as ShoppingItemErrors?,
  ));
}

/// Create a copy of ItemFormData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShoppingItemRawDataCopyWith<$Res> get data {
  
  return $ShoppingItemRawDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
