// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_item_edit_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShoppingItemEditModel {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShoppingItemEditModel);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ShoppingItemEditModel()';
}


}

/// @nodoc
class $ShoppingItemEditModelCopyWith<$Res>  {
$ShoppingItemEditModelCopyWith(ShoppingItemEditModel _, $Res Function(ShoppingItemEditModel) __);
}


/// Adds pattern-matching-related methods to [ShoppingItemEditModel].
extension ShoppingItemEditModelPatterns on ShoppingItemEditModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Loading value)?  loading,TResult Function( _Error value)?  error,TResult Function( _NotFound value)?  notFound,TResult Function( _Success value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _Error() when error != null:
return error(_that);case _NotFound() when notFound != null:
return notFound(_that);case _Success() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Loading value)  loading,required TResult Function( _Error value)  error,required TResult Function( _NotFound value)  notFound,required TResult Function( _Success value)  success,}){
final _that = this;
switch (_that) {
case _Loading():
return loading(_that);case _Error():
return error(_that);case _NotFound():
return notFound(_that);case _Success():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Loading value)?  loading,TResult? Function( _Error value)?  error,TResult? Function( _NotFound value)?  notFound,TResult? Function( _Success value)?  success,}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _Error() when error != null:
return error(_that);case _NotFound() when notFound != null:
return notFound(_that);case _Success() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function()?  error,TResult Function()?  notFound,TResult Function( ShoppingItem item)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _Error() when error != null:
return error();case _NotFound() when notFound != null:
return notFound();case _Success() when success != null:
return success(_that.item);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function()  error,required TResult Function()  notFound,required TResult Function( ShoppingItem item)  success,}) {final _that = this;
switch (_that) {
case _Loading():
return loading();case _Error():
return error();case _NotFound():
return notFound();case _Success():
return success(_that.item);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function()?  error,TResult? Function()?  notFound,TResult? Function( ShoppingItem item)?  success,}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _Error() when error != null:
return error();case _NotFound() when notFound != null:
return notFound();case _Success() when success != null:
return success(_that.item);case _:
  return null;

}
}

}

/// @nodoc


class _Loading extends ShoppingItemEditModel {
  const _Loading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ShoppingItemEditModel.loading()';
}


}




/// @nodoc


class _Error extends ShoppingItemEditModel {
  const _Error(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ShoppingItemEditModel.error()';
}


}




/// @nodoc


class _NotFound extends ShoppingItemEditModel {
  const _NotFound(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ShoppingItemEditModel.notFound()';
}


}




/// @nodoc


class _Success extends ShoppingItemEditModel {
  const _Success({required this.item}): super._();
  

 final  ShoppingItem item;

/// Create a copy of ShoppingItemEditModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'ShoppingItemEditModel.success(item: $item)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $ShoppingItemEditModelCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 ShoppingItem item
});


$ShoppingItemCopyWith<$Res> get item;

}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of ShoppingItemEditModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(_Success(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as ShoppingItem,
  ));
}

/// Create a copy of ShoppingItemEditModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShoppingItemCopyWith<$Res> get item {
  
  return $ShoppingItemCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}

// dart format on
