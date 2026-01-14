// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checklist_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChecklistViewModel {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChecklistViewModel);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChecklistViewModel()';
}


}

/// @nodoc
class $ChecklistViewModelCopyWith<$Res>  {
$ChecklistViewModelCopyWith(ChecklistViewModel _, $Res Function(ChecklistViewModel) __);
}


/// Adds pattern-matching-related methods to [ChecklistViewModel].
extension ChecklistViewModelPatterns on ChecklistViewModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Error value)?  error,TResult Function( _Loading value)?  loading,TResult Function( _NotFound value)?  notFound,TResult Function( _Checklist value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Error() when error != null:
return error(_that);case _Loading() when loading != null:
return loading(_that);case _NotFound() when notFound != null:
return notFound(_that);case _Checklist() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Error value)  error,required TResult Function( _Loading value)  loading,required TResult Function( _NotFound value)  notFound,required TResult Function( _Checklist value)  success,}){
final _that = this;
switch (_that) {
case _Error():
return error(_that);case _Loading():
return loading(_that);case _NotFound():
return notFound(_that);case _Checklist():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Error value)?  error,TResult? Function( _Loading value)?  loading,TResult? Function( _NotFound value)?  notFound,TResult? Function( _Checklist value)?  success,}){
final _that = this;
switch (_that) {
case _Error() when error != null:
return error(_that);case _Loading() when loading != null:
return loading(_that);case _NotFound() when notFound != null:
return notFound(_that);case _Checklist() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  error,TResult Function()?  loading,TResult Function()?  notFound,TResult Function( ListSummary list,  List<ChecklistEntry> entries)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Error() when error != null:
return error();case _Loading() when loading != null:
return loading();case _NotFound() when notFound != null:
return notFound();case _Checklist() when success != null:
return success(_that.list,_that.entries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  error,required TResult Function()  loading,required TResult Function()  notFound,required TResult Function( ListSummary list,  List<ChecklistEntry> entries)  success,}) {final _that = this;
switch (_that) {
case _Error():
return error();case _Loading():
return loading();case _NotFound():
return notFound();case _Checklist():
return success(_that.list,_that.entries);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  error,TResult? Function()?  loading,TResult? Function()?  notFound,TResult? Function( ListSummary list,  List<ChecklistEntry> entries)?  success,}) {final _that = this;
switch (_that) {
case _Error() when error != null:
return error();case _Loading() when loading != null:
return loading();case _NotFound() when notFound != null:
return notFound();case _Checklist() when success != null:
return success(_that.list,_that.entries);case _:
  return null;

}
}

}

/// @nodoc


class _Error extends ChecklistViewModel {
  const _Error(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChecklistViewModel.error()';
}


}




/// @nodoc


class _Loading extends ChecklistViewModel {
  const _Loading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChecklistViewModel.loading()';
}


}




/// @nodoc


class _NotFound extends ChecklistViewModel {
  const _NotFound(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChecklistViewModel.notFound()';
}


}




/// @nodoc


class _Checklist extends ChecklistViewModel {
  const _Checklist({required this.list, required final  List<ChecklistEntry> entries}): _entries = entries,super._();
  

 final  ListSummary list;
 final  List<ChecklistEntry> _entries;
 List<ChecklistEntry> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}


/// Create a copy of ChecklistViewModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChecklistCopyWith<_Checklist> get copyWith => __$ChecklistCopyWithImpl<_Checklist>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Checklist&&(identical(other.list, list) || other.list == list)&&const DeepCollectionEquality().equals(other._entries, _entries));
}


@override
int get hashCode => Object.hash(runtimeType,list,const DeepCollectionEquality().hash(_entries));

@override
String toString() {
  return 'ChecklistViewModel.success(list: $list, entries: $entries)';
}


}

/// @nodoc
abstract mixin class _$ChecklistCopyWith<$Res> implements $ChecklistViewModelCopyWith<$Res> {
  factory _$ChecklistCopyWith(_Checklist value, $Res Function(_Checklist) _then) = __$ChecklistCopyWithImpl;
@useResult
$Res call({
 ListSummary list, List<ChecklistEntry> entries
});


$ListSummaryCopyWith<$Res> get list;

}
/// @nodoc
class __$ChecklistCopyWithImpl<$Res>
    implements _$ChecklistCopyWith<$Res> {
  __$ChecklistCopyWithImpl(this._self, this._then);

  final _Checklist _self;
  final $Res Function(_Checklist) _then;

/// Create a copy of ChecklistViewModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? list = null,Object? entries = null,}) {
  return _then(_Checklist(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as ListSummary,entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<ChecklistEntry>,
  ));
}

/// Create a copy of ChecklistViewModel
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
