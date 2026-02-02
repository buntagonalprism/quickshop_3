// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_selector_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategorySelectorItem {

 String get name;
/// Create a copy of CategorySelectorItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategorySelectorItemCopyWith<CategorySelectorItem> get copyWith => _$CategorySelectorItemCopyWithImpl<CategorySelectorItem>(this as CategorySelectorItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategorySelectorItem&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'CategorySelectorItem(name: $name)';
}


}

/// @nodoc
abstract mixin class $CategorySelectorItemCopyWith<$Res>  {
  factory $CategorySelectorItemCopyWith(CategorySelectorItem value, $Res Function(CategorySelectorItem) _then) = _$CategorySelectorItemCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class _$CategorySelectorItemCopyWithImpl<$Res>
    implements $CategorySelectorItemCopyWith<$Res> {
  _$CategorySelectorItemCopyWithImpl(this._self, this._then);

  final CategorySelectorItem _self;
  final $Res Function(CategorySelectorItem) _then;

/// Create a copy of CategorySelectorItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CategorySelectorItem].
extension CategorySelectorItemPatterns on CategorySelectorItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Suggestion value)?  suggestion,TResult Function( _History value)?  history,TResult Function( _List value)?  list,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Suggestion() when suggestion != null:
return suggestion(_that);case _History() when history != null:
return history(_that);case _List() when list != null:
return list(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Suggestion value)  suggestion,required TResult Function( _History value)  history,required TResult Function( _List value)  list,}){
final _that = this;
switch (_that) {
case _Suggestion():
return suggestion(_that);case _History():
return history(_that);case _List():
return list(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Suggestion value)?  suggestion,TResult? Function( _History value)?  history,TResult? Function( _List value)?  list,}){
final _that = this;
switch (_that) {
case _Suggestion() when suggestion != null:
return suggestion(_that);case _History() when history != null:
return history(_that);case _List() when list != null:
return list(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String name)?  suggestion,TResult Function( String name)?  history,TResult Function( String name)?  list,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Suggestion() when suggestion != null:
return suggestion(_that.name);case _History() when history != null:
return history(_that.name);case _List() when list != null:
return list(_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String name)  suggestion,required TResult Function( String name)  history,required TResult Function( String name)  list,}) {final _that = this;
switch (_that) {
case _Suggestion():
return suggestion(_that.name);case _History():
return history(_that.name);case _List():
return list(_that.name);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String name)?  suggestion,TResult? Function( String name)?  history,TResult? Function( String name)?  list,}) {final _that = this;
switch (_that) {
case _Suggestion() when suggestion != null:
return suggestion(_that.name);case _History() when history != null:
return history(_that.name);case _List() when list != null:
return list(_that.name);case _:
  return null;

}
}

}

/// @nodoc


class _Suggestion extends CategorySelectorItem {
  const _Suggestion(this.name): super._();
  

@override final  String name;

/// Create a copy of CategorySelectorItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuggestionCopyWith<_Suggestion> get copyWith => __$SuggestionCopyWithImpl<_Suggestion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Suggestion&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'CategorySelectorItem.suggestion(name: $name)';
}


}

/// @nodoc
abstract mixin class _$SuggestionCopyWith<$Res> implements $CategorySelectorItemCopyWith<$Res> {
  factory _$SuggestionCopyWith(_Suggestion value, $Res Function(_Suggestion) _then) = __$SuggestionCopyWithImpl;
@override @useResult
$Res call({
 String name
});




}
/// @nodoc
class __$SuggestionCopyWithImpl<$Res>
    implements _$SuggestionCopyWith<$Res> {
  __$SuggestionCopyWithImpl(this._self, this._then);

  final _Suggestion _self;
  final $Res Function(_Suggestion) _then;

/// Create a copy of CategorySelectorItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_Suggestion(
null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _History extends CategorySelectorItem {
  const _History(this.name): super._();
  

@override final  String name;

/// Create a copy of CategorySelectorItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryCopyWith<_History> get copyWith => __$HistoryCopyWithImpl<_History>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _History&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'CategorySelectorItem.history(name: $name)';
}


}

/// @nodoc
abstract mixin class _$HistoryCopyWith<$Res> implements $CategorySelectorItemCopyWith<$Res> {
  factory _$HistoryCopyWith(_History value, $Res Function(_History) _then) = __$HistoryCopyWithImpl;
@override @useResult
$Res call({
 String name
});




}
/// @nodoc
class __$HistoryCopyWithImpl<$Res>
    implements _$HistoryCopyWith<$Res> {
  __$HistoryCopyWithImpl(this._self, this._then);

  final _History _self;
  final $Res Function(_History) _then;

/// Create a copy of CategorySelectorItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_History(
null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _List extends CategorySelectorItem {
  const _List(this.name): super._();
  

@override final  String name;

/// Create a copy of CategorySelectorItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListCopyWith<_List> get copyWith => __$ListCopyWithImpl<_List>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _List&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'CategorySelectorItem.list(name: $name)';
}


}

/// @nodoc
abstract mixin class _$ListCopyWith<$Res> implements $CategorySelectorItemCopyWith<$Res> {
  factory _$ListCopyWith(_List value, $Res Function(_List) _then) = __$ListCopyWithImpl;
@override @useResult
$Res call({
 String name
});




}
/// @nodoc
class __$ListCopyWithImpl<$Res>
    implements _$ListCopyWith<$Res> {
  __$ListCopyWithImpl(this._self, this._then);

  final _List _self;
  final $Res Function(_List) _then;

/// Create a copy of CategorySelectorItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_List(
null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
