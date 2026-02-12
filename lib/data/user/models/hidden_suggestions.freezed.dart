// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hidden_suggestions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HiddenSuggestions {

 String get locale; DateTime get lastUpdated; List<String> get items; List<String> get categories;
/// Create a copy of HiddenSuggestions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HiddenSuggestionsCopyWith<HiddenSuggestions> get copyWith => _$HiddenSuggestionsCopyWithImpl<HiddenSuggestions>(this as HiddenSuggestions, _$identity);

  /// Serializes this HiddenSuggestions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HiddenSuggestions&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.categories, categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,locale,lastUpdated,const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(categories));

@override
String toString() {
  return 'HiddenSuggestions(locale: $locale, lastUpdated: $lastUpdated, items: $items, categories: $categories)';
}


}

/// @nodoc
abstract mixin class $HiddenSuggestionsCopyWith<$Res>  {
  factory $HiddenSuggestionsCopyWith(HiddenSuggestions value, $Res Function(HiddenSuggestions) _then) = _$HiddenSuggestionsCopyWithImpl;
@useResult
$Res call({
 String locale, DateTime lastUpdated, List<String> items, List<String> categories
});




}
/// @nodoc
class _$HiddenSuggestionsCopyWithImpl<$Res>
    implements $HiddenSuggestionsCopyWith<$Res> {
  _$HiddenSuggestionsCopyWithImpl(this._self, this._then);

  final HiddenSuggestions _self;
  final $Res Function(HiddenSuggestions) _then;

/// Create a copy of HiddenSuggestions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? locale = null,Object? lastUpdated = null,Object? items = null,Object? categories = null,}) {
  return _then(_self.copyWith(
locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<String>,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [HiddenSuggestions].
extension HiddenSuggestionsPatterns on HiddenSuggestions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HiddenSuggestions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HiddenSuggestions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HiddenSuggestions value)  $default,){
final _that = this;
switch (_that) {
case _HiddenSuggestions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HiddenSuggestions value)?  $default,){
final _that = this;
switch (_that) {
case _HiddenSuggestions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String locale,  DateTime lastUpdated,  List<String> items,  List<String> categories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HiddenSuggestions() when $default != null:
return $default(_that.locale,_that.lastUpdated,_that.items,_that.categories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String locale,  DateTime lastUpdated,  List<String> items,  List<String> categories)  $default,) {final _that = this;
switch (_that) {
case _HiddenSuggestions():
return $default(_that.locale,_that.lastUpdated,_that.items,_that.categories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String locale,  DateTime lastUpdated,  List<String> items,  List<String> categories)?  $default,) {final _that = this;
switch (_that) {
case _HiddenSuggestions() when $default != null:
return $default(_that.locale,_that.lastUpdated,_that.items,_that.categories);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HiddenSuggestions extends HiddenSuggestions {
  const _HiddenSuggestions({required this.locale, required this.lastUpdated, required final  List<String> items, required final  List<String> categories}): _items = items,_categories = categories,super._();
  factory _HiddenSuggestions.fromJson(Map<String, dynamic> json) => _$HiddenSuggestionsFromJson(json);

@override final  String locale;
@override final  DateTime lastUpdated;
 final  List<String> _items;
@override List<String> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  List<String> _categories;
@override List<String> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of HiddenSuggestions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HiddenSuggestionsCopyWith<_HiddenSuggestions> get copyWith => __$HiddenSuggestionsCopyWithImpl<_HiddenSuggestions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HiddenSuggestionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HiddenSuggestions&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._categories, _categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,locale,lastUpdated,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'HiddenSuggestions(locale: $locale, lastUpdated: $lastUpdated, items: $items, categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$HiddenSuggestionsCopyWith<$Res> implements $HiddenSuggestionsCopyWith<$Res> {
  factory _$HiddenSuggestionsCopyWith(_HiddenSuggestions value, $Res Function(_HiddenSuggestions) _then) = __$HiddenSuggestionsCopyWithImpl;
@override @useResult
$Res call({
 String locale, DateTime lastUpdated, List<String> items, List<String> categories
});




}
/// @nodoc
class __$HiddenSuggestionsCopyWithImpl<$Res>
    implements _$HiddenSuggestionsCopyWith<$Res> {
  __$HiddenSuggestionsCopyWithImpl(this._self, this._then);

  final _HiddenSuggestions _self;
  final $Res Function(_HiddenSuggestions) _then;

/// Create a copy of HiddenSuggestions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? locale = null,Object? lastUpdated = null,Object? items = null,Object? categories = null,}) {
  return _then(_HiddenSuggestions(
locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<String>,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
