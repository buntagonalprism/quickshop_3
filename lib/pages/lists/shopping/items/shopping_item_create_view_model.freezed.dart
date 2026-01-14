// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_item_create_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShoppingItemCreateModel {

 String get filter; ShoppingItemRawData get data; String? get filterError; ShoppingItemErrors? get itemErrors;
/// Create a copy of ShoppingItemCreateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShoppingItemCreateModelCopyWith<ShoppingItemCreateModel> get copyWith => _$ShoppingItemCreateModelCopyWithImpl<ShoppingItemCreateModel>(this as ShoppingItemCreateModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShoppingItemCreateModel&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.data, data) || other.data == data)&&(identical(other.filterError, filterError) || other.filterError == filterError)&&(identical(other.itemErrors, itemErrors) || other.itemErrors == itemErrors));
}


@override
int get hashCode => Object.hash(runtimeType,filter,data,filterError,itemErrors);

@override
String toString() {
  return 'ShoppingItemCreateModel(filter: $filter, data: $data, filterError: $filterError, itemErrors: $itemErrors)';
}


}

/// @nodoc
abstract mixin class $ShoppingItemCreateModelCopyWith<$Res>  {
  factory $ShoppingItemCreateModelCopyWith(ShoppingItemCreateModel value, $Res Function(ShoppingItemCreateModel) _then) = _$ShoppingItemCreateModelCopyWithImpl;
@useResult
$Res call({
 String filter, ShoppingItemRawData data, String? filterError, ShoppingItemErrors? itemErrors
});


$ShoppingItemRawDataCopyWith<$Res> get data;

}
/// @nodoc
class _$ShoppingItemCreateModelCopyWithImpl<$Res>
    implements $ShoppingItemCreateModelCopyWith<$Res> {
  _$ShoppingItemCreateModelCopyWithImpl(this._self, this._then);

  final ShoppingItemCreateModel _self;
  final $Res Function(ShoppingItemCreateModel) _then;

/// Create a copy of ShoppingItemCreateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? filter = null,Object? data = null,Object? filterError = freezed,Object? itemErrors = freezed,}) {
  return _then(_self.copyWith(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ShoppingItemRawData,filterError: freezed == filterError ? _self.filterError : filterError // ignore: cast_nullable_to_non_nullable
as String?,itemErrors: freezed == itemErrors ? _self.itemErrors : itemErrors // ignore: cast_nullable_to_non_nullable
as ShoppingItemErrors?,
  ));
}
/// Create a copy of ShoppingItemCreateModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShoppingItemRawDataCopyWith<$Res> get data {
  
  return $ShoppingItemRawDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ShoppingItemCreateModel].
extension ShoppingItemCreateModelPatterns on ShoppingItemCreateModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShoppingItemCreateData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShoppingItemCreateData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShoppingItemCreateData value)  $default,){
final _that = this;
switch (_that) {
case _ShoppingItemCreateData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShoppingItemCreateData value)?  $default,){
final _that = this;
switch (_that) {
case _ShoppingItemCreateData() when $default != null:
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
case _ShoppingItemCreateData() when $default != null:
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
case _ShoppingItemCreateData():
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
case _ShoppingItemCreateData() when $default != null:
return $default(_that.filter,_that.data,_that.filterError,_that.itemErrors);case _:
  return null;

}
}

}

/// @nodoc


class _ShoppingItemCreateData extends ShoppingItemCreateModel {
  const _ShoppingItemCreateData({required this.filter, required this.data, this.filterError, this.itemErrors}): super._();
  

@override final  String filter;
@override final  ShoppingItemRawData data;
@override final  String? filterError;
@override final  ShoppingItemErrors? itemErrors;

/// Create a copy of ShoppingItemCreateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShoppingItemCreateDataCopyWith<_ShoppingItemCreateData> get copyWith => __$ShoppingItemCreateDataCopyWithImpl<_ShoppingItemCreateData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShoppingItemCreateData&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.data, data) || other.data == data)&&(identical(other.filterError, filterError) || other.filterError == filterError)&&(identical(other.itemErrors, itemErrors) || other.itemErrors == itemErrors));
}


@override
int get hashCode => Object.hash(runtimeType,filter,data,filterError,itemErrors);

@override
String toString() {
  return 'ShoppingItemCreateModel(filter: $filter, data: $data, filterError: $filterError, itemErrors: $itemErrors)';
}


}

/// @nodoc
abstract mixin class _$ShoppingItemCreateDataCopyWith<$Res> implements $ShoppingItemCreateModelCopyWith<$Res> {
  factory _$ShoppingItemCreateDataCopyWith(_ShoppingItemCreateData value, $Res Function(_ShoppingItemCreateData) _then) = __$ShoppingItemCreateDataCopyWithImpl;
@override @useResult
$Res call({
 String filter, ShoppingItemRawData data, String? filterError, ShoppingItemErrors? itemErrors
});


@override $ShoppingItemRawDataCopyWith<$Res> get data;

}
/// @nodoc
class __$ShoppingItemCreateDataCopyWithImpl<$Res>
    implements _$ShoppingItemCreateDataCopyWith<$Res> {
  __$ShoppingItemCreateDataCopyWithImpl(this._self, this._then);

  final _ShoppingItemCreateData _self;
  final $Res Function(_ShoppingItemCreateData) _then;

/// Create a copy of ShoppingItemCreateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filter = null,Object? data = null,Object? filterError = freezed,Object? itemErrors = freezed,}) {
  return _then(_ShoppingItemCreateData(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ShoppingItemRawData,filterError: freezed == filterError ? _self.filterError : filterError // ignore: cast_nullable_to_non_nullable
as String?,itemErrors: freezed == itemErrors ? _self.itemErrors : itemErrors // ignore: cast_nullable_to_non_nullable
as ShoppingItemErrors?,
  ));
}

/// Create a copy of ShoppingItemCreateModel
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
