// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_item_suggestions_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShoppingItemSuggestionsSummary {

 Map<String, DateTime> get updatedAt;
/// Create a copy of ShoppingItemSuggestionsSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShoppingItemSuggestionsSummaryCopyWith<ShoppingItemSuggestionsSummary> get copyWith => _$ShoppingItemSuggestionsSummaryCopyWithImpl<ShoppingItemSuggestionsSummary>(this as ShoppingItemSuggestionsSummary, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShoppingItemSuggestionsSummary&&const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(updatedAt));

@override
String toString() {
  return 'ShoppingItemSuggestionsSummary(updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ShoppingItemSuggestionsSummaryCopyWith<$Res>  {
  factory $ShoppingItemSuggestionsSummaryCopyWith(ShoppingItemSuggestionsSummary value, $Res Function(ShoppingItemSuggestionsSummary) _then) = _$ShoppingItemSuggestionsSummaryCopyWithImpl;
@useResult
$Res call({
 Map<String, DateTime> updatedAt
});




}
/// @nodoc
class _$ShoppingItemSuggestionsSummaryCopyWithImpl<$Res>
    implements $ShoppingItemSuggestionsSummaryCopyWith<$Res> {
  _$ShoppingItemSuggestionsSummaryCopyWithImpl(this._self, this._then);

  final ShoppingItemSuggestionsSummary _self;
  final $Res Function(ShoppingItemSuggestionsSummary) _then;

/// Create a copy of ShoppingItemSuggestionsSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? updatedAt = null,}) {
  return _then(_self.copyWith(
updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Map<String, DateTime>,
  ));
}

}


/// Adds pattern-matching-related methods to [ShoppingItemSuggestionsSummary].
extension ShoppingItemSuggestionsSummaryPatterns on ShoppingItemSuggestionsSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShoppingItemSuggestionsSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShoppingItemSuggestionsSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShoppingItemSuggestionsSummary value)  $default,){
final _that = this;
switch (_that) {
case _ShoppingItemSuggestionsSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShoppingItemSuggestionsSummary value)?  $default,){
final _that = this;
switch (_that) {
case _ShoppingItemSuggestionsSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, DateTime> updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShoppingItemSuggestionsSummary() when $default != null:
return $default(_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, DateTime> updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ShoppingItemSuggestionsSummary():
return $default(_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, DateTime> updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ShoppingItemSuggestionsSummary() when $default != null:
return $default(_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _ShoppingItemSuggestionsSummary extends ShoppingItemSuggestionsSummary {
  const _ShoppingItemSuggestionsSummary({required final  Map<String, DateTime> updatedAt}): _updatedAt = updatedAt,super._();
  

 final  Map<String, DateTime> _updatedAt;
@override Map<String, DateTime> get updatedAt {
  if (_updatedAt is EqualUnmodifiableMapView) return _updatedAt;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_updatedAt);
}


/// Create a copy of ShoppingItemSuggestionsSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShoppingItemSuggestionsSummaryCopyWith<_ShoppingItemSuggestionsSummary> get copyWith => __$ShoppingItemSuggestionsSummaryCopyWithImpl<_ShoppingItemSuggestionsSummary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShoppingItemSuggestionsSummary&&const DeepCollectionEquality().equals(other._updatedAt, _updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_updatedAt));

@override
String toString() {
  return 'ShoppingItemSuggestionsSummary(updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ShoppingItemSuggestionsSummaryCopyWith<$Res> implements $ShoppingItemSuggestionsSummaryCopyWith<$Res> {
  factory _$ShoppingItemSuggestionsSummaryCopyWith(_ShoppingItemSuggestionsSummary value, $Res Function(_ShoppingItemSuggestionsSummary) _then) = __$ShoppingItemSuggestionsSummaryCopyWithImpl;
@override @useResult
$Res call({
 Map<String, DateTime> updatedAt
});




}
/// @nodoc
class __$ShoppingItemSuggestionsSummaryCopyWithImpl<$Res>
    implements _$ShoppingItemSuggestionsSummaryCopyWith<$Res> {
  __$ShoppingItemSuggestionsSummaryCopyWithImpl(this._self, this._then);

  final _ShoppingItemSuggestionsSummary _self;
  final $Res Function(_ShoppingItemSuggestionsSummary) _then;

/// Create a copy of ShoppingItemSuggestionsSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? updatedAt = null,}) {
  return _then(_ShoppingItemSuggestionsSummary(
updatedAt: null == updatedAt ? _self._updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Map<String, DateTime>,
  ));
}


}

// dart format on
