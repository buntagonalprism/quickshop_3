// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_item_suggestion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShoppingItemSuggestion {

 String get id; String get langCode; String get name; String get category; int? get popularity;
/// Create a copy of ShoppingItemSuggestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShoppingItemSuggestionCopyWith<ShoppingItemSuggestion> get copyWith => _$ShoppingItemSuggestionCopyWithImpl<ShoppingItemSuggestion>(this as ShoppingItemSuggestion, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShoppingItemSuggestion&&(identical(other.id, id) || other.id == id)&&(identical(other.langCode, langCode) || other.langCode == langCode)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.popularity, popularity) || other.popularity == popularity));
}


@override
int get hashCode => Object.hash(runtimeType,id,langCode,name,category,popularity);

@override
String toString() {
  return 'ShoppingItemSuggestion(id: $id, langCode: $langCode, name: $name, category: $category, popularity: $popularity)';
}


}

/// @nodoc
abstract mixin class $ShoppingItemSuggestionCopyWith<$Res>  {
  factory $ShoppingItemSuggestionCopyWith(ShoppingItemSuggestion value, $Res Function(ShoppingItemSuggestion) _then) = _$ShoppingItemSuggestionCopyWithImpl;
@useResult
$Res call({
 String id, String langCode, String name, String category, int? popularity
});




}
/// @nodoc
class _$ShoppingItemSuggestionCopyWithImpl<$Res>
    implements $ShoppingItemSuggestionCopyWith<$Res> {
  _$ShoppingItemSuggestionCopyWithImpl(this._self, this._then);

  final ShoppingItemSuggestion _self;
  final $Res Function(ShoppingItemSuggestion) _then;

/// Create a copy of ShoppingItemSuggestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? langCode = null,Object? name = null,Object? category = null,Object? popularity = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,langCode: null == langCode ? _self.langCode : langCode // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,popularity: freezed == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ShoppingItemSuggestion].
extension ShoppingItemSuggestionPatterns on ShoppingItemSuggestion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShoppingItemSuggestion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShoppingItemSuggestion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShoppingItemSuggestion value)  $default,){
final _that = this;
switch (_that) {
case _ShoppingItemSuggestion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShoppingItemSuggestion value)?  $default,){
final _that = this;
switch (_that) {
case _ShoppingItemSuggestion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String langCode,  String name,  String category,  int? popularity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShoppingItemSuggestion() when $default != null:
return $default(_that.id,_that.langCode,_that.name,_that.category,_that.popularity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String langCode,  String name,  String category,  int? popularity)  $default,) {final _that = this;
switch (_that) {
case _ShoppingItemSuggestion():
return $default(_that.id,_that.langCode,_that.name,_that.category,_that.popularity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String langCode,  String name,  String category,  int? popularity)?  $default,) {final _that = this;
switch (_that) {
case _ShoppingItemSuggestion() when $default != null:
return $default(_that.id,_that.langCode,_that.name,_that.category,_that.popularity);case _:
  return null;

}
}

}

/// @nodoc


class _ShoppingItemSuggestion extends ShoppingItemSuggestion {
  const _ShoppingItemSuggestion({required this.id, required this.langCode, required this.name, required this.category, this.popularity}): super._();
  

@override final  String id;
@override final  String langCode;
@override final  String name;
@override final  String category;
@override final  int? popularity;

/// Create a copy of ShoppingItemSuggestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShoppingItemSuggestionCopyWith<_ShoppingItemSuggestion> get copyWith => __$ShoppingItemSuggestionCopyWithImpl<_ShoppingItemSuggestion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShoppingItemSuggestion&&(identical(other.id, id) || other.id == id)&&(identical(other.langCode, langCode) || other.langCode == langCode)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.popularity, popularity) || other.popularity == popularity));
}


@override
int get hashCode => Object.hash(runtimeType,id,langCode,name,category,popularity);

@override
String toString() {
  return 'ShoppingItemSuggestion(id: $id, langCode: $langCode, name: $name, category: $category, popularity: $popularity)';
}


}

/// @nodoc
abstract mixin class _$ShoppingItemSuggestionCopyWith<$Res> implements $ShoppingItemSuggestionCopyWith<$Res> {
  factory _$ShoppingItemSuggestionCopyWith(_ShoppingItemSuggestion value, $Res Function(_ShoppingItemSuggestion) _then) = __$ShoppingItemSuggestionCopyWithImpl;
@override @useResult
$Res call({
 String id, String langCode, String name, String category, int? popularity
});




}
/// @nodoc
class __$ShoppingItemSuggestionCopyWithImpl<$Res>
    implements _$ShoppingItemSuggestionCopyWith<$Res> {
  __$ShoppingItemSuggestionCopyWithImpl(this._self, this._then);

  final _ShoppingItemSuggestion _self;
  final $Res Function(_ShoppingItemSuggestion) _then;

/// Create a copy of ShoppingItemSuggestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? langCode = null,Object? name = null,Object? category = null,Object? popularity = freezed,}) {
  return _then(_ShoppingItemSuggestion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,langCode: null == langCode ? _self.langCode : langCode // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,popularity: freezed == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
