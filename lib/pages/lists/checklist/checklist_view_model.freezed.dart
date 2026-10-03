// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checklist_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Checklist {

 ListSummary get list; List<ChecklistEntry> get entries;
/// Create a copy of Checklist
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChecklistCopyWith<Checklist> get copyWith => _$ChecklistCopyWithImpl<Checklist>(this as Checklist, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Checklist;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Checklist&&(identical(other.list, _this.list) || other.list == _this.list)&&const DeepCollectionEquality().equals(other.entries, _this.entries));
}


@override
int get hashCode {
  final _this = this as Checklist;
  return Object.hash(runtimeType,_this.list,const DeepCollectionEquality().hash(_this.entries));
}

@override
String toString() {
  final _this = this as Checklist;
  return 'Checklist(list: ${_this.list}, entries: ${_this.entries})';
}


}

/// @nodoc
abstract mixin class $ChecklistCopyWith<$Res>  {
  factory $ChecklistCopyWith(Checklist value, $Res Function(Checklist) _then) = _$ChecklistCopyWithImpl;
@useResult
$Res call({
 ListSummary list, List<ChecklistEntry> entries
});


$ListSummaryCopyWith<$Res> get list;

}
/// @nodoc
class _$ChecklistCopyWithImpl<$Res>
    implements $ChecklistCopyWith<$Res> {
  _$ChecklistCopyWithImpl(this._self, this._then);

  final Checklist _self;
  final $Res Function(Checklist) _then;

/// Create a copy of Checklist
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? list = null,Object? entries = null,}) {
  return _then(Checklist(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as ListSummary,entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<ChecklistEntry>,
  ));
}
/// Create a copy of Checklist
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListSummaryCopyWith<$Res> get list {
  
  return $ListSummaryCopyWith<$Res>(_self.list, (value) {
    return _then(_self.copyWith(list: value));
  });
}
}


/// Adds pattern-matching-related methods to [Checklist].
extension ChecklistPatterns on Checklist {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Checklist value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Checklist() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Checklist value)  $default,){
final _that = this;
switch (_that) {
case _Checklist():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Checklist value)?  $default,){
final _that = this;
switch (_that) {
case _Checklist() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ListSummary list,  List<ChecklistEntry> entries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Checklist() when $default != null:
return $default(_that.list,_that.entries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ListSummary list,  List<ChecklistEntry> entries)  $default,) {final _that = this;
switch (_that) {
case _Checklist():
return $default(_that.list,_that.entries);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ListSummary list,  List<ChecklistEntry> entries)?  $default,) {final _that = this;
switch (_that) {
case _Checklist() when $default != null:
return $default(_that.list,_that.entries);case _:
  return null;

}
}

}

/// @nodoc


class _Checklist implements Checklist {
  const _Checklist({required this.list, required  List<ChecklistEntry> entries}): _entries = entries;
  

@override final  ListSummary list;
 final  List<ChecklistEntry> _entries;
@override List<ChecklistEntry> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}


/// Create a copy of Checklist
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChecklistCopyWith<_Checklist> get copyWith => __$ChecklistCopyWithImpl<_Checklist>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Checklist&&(identical(other.list, list) || other.list == list)&&const DeepCollectionEquality().equals(other.entries, _entries));
}


@override
int get hashCode {
    return Object.hash(runtimeType,list,const DeepCollectionEquality().hash(_entries));
}

@override
String toString() {
    return 'Checklist(list: $list, entries: $entries)';
}


}

/// @nodoc
abstract mixin class _$ChecklistCopyWith<$Res> implements $ChecklistCopyWith<$Res> {
  factory _$ChecklistCopyWith(_Checklist value, $Res Function(_Checklist) _then) = __$ChecklistCopyWithImpl;
@override @useResult
$Res call({
 ListSummary list, List<ChecklistEntry> entries
});


@override $ListSummaryCopyWith<$Res> get list;

}
/// @nodoc
class __$ChecklistCopyWithImpl<$Res>
    implements _$ChecklistCopyWith<$Res> {
  __$ChecklistCopyWithImpl(this._self, this._then);

  final _Checklist _self;
  final $Res Function(_Checklist) _then;

/// Create a copy of Checklist
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? list = null,Object? entries = null,}) {
  return _then(_Checklist(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as ListSummary,entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<ChecklistEntry>,
  ));
}

/// Create a copy of Checklist
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListSummaryCopyWith<$Res> get list {
  
  return $ListSummaryCopyWith<$Res>(_self.list, (value) {
    return _then(_self.copyWith(list: value));
  });
}
}

// dart format on
