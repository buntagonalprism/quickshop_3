// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_selector_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategorySelectorItem {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() newCategory,
    required TResult Function(String name) heading,
    required TResult Function(String name) suggestion,
    required TResult Function(String name) history,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? newCategory,
    TResult? Function(String name)? heading,
    TResult? Function(String name)? suggestion,
    TResult? Function(String name)? history,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? newCategory,
    TResult Function(String name)? heading,
    TResult Function(String name)? suggestion,
    TResult Function(String name)? history,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NewCategory value) newCategory,
    required TResult Function(_Heading value) heading,
    required TResult Function(_Suggestion value) suggestion,
    required TResult Function(_History value) history,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NewCategory value)? newCategory,
    TResult? Function(_Heading value)? heading,
    TResult? Function(_Suggestion value)? suggestion,
    TResult? Function(_History value)? history,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NewCategory value)? newCategory,
    TResult Function(_Heading value)? heading,
    TResult Function(_Suggestion value)? suggestion,
    TResult Function(_History value)? history,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategorySelectorItemCopyWith<$Res> {
  factory $CategorySelectorItemCopyWith(CategorySelectorItem value,
          $Res Function(CategorySelectorItem) then) =
      _$CategorySelectorItemCopyWithImpl<$Res, CategorySelectorItem>;
}

/// @nodoc
class _$CategorySelectorItemCopyWithImpl<$Res,
        $Val extends CategorySelectorItem>
    implements $CategorySelectorItemCopyWith<$Res> {
  _$CategorySelectorItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategorySelectorItem
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$NewCategoryImplCopyWith<$Res> {
  factory _$$NewCategoryImplCopyWith(
          _$NewCategoryImpl value, $Res Function(_$NewCategoryImpl) then) =
      __$$NewCategoryImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NewCategoryImplCopyWithImpl<$Res>
    extends _$CategorySelectorItemCopyWithImpl<$Res, _$NewCategoryImpl>
    implements _$$NewCategoryImplCopyWith<$Res> {
  __$$NewCategoryImplCopyWithImpl(
      _$NewCategoryImpl _value, $Res Function(_$NewCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategorySelectorItem
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NewCategoryImpl extends _NewCategory {
  const _$NewCategoryImpl() : super._();

  @override
  String toString() {
    return 'CategorySelectorItem.newCategory()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NewCategoryImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() newCategory,
    required TResult Function(String name) heading,
    required TResult Function(String name) suggestion,
    required TResult Function(String name) history,
  }) {
    return newCategory();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? newCategory,
    TResult? Function(String name)? heading,
    TResult? Function(String name)? suggestion,
    TResult? Function(String name)? history,
  }) {
    return newCategory?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? newCategory,
    TResult Function(String name)? heading,
    TResult Function(String name)? suggestion,
    TResult Function(String name)? history,
    required TResult orElse(),
  }) {
    if (newCategory != null) {
      return newCategory();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NewCategory value) newCategory,
    required TResult Function(_Heading value) heading,
    required TResult Function(_Suggestion value) suggestion,
    required TResult Function(_History value) history,
  }) {
    return newCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NewCategory value)? newCategory,
    TResult? Function(_Heading value)? heading,
    TResult? Function(_Suggestion value)? suggestion,
    TResult? Function(_History value)? history,
  }) {
    return newCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NewCategory value)? newCategory,
    TResult Function(_Heading value)? heading,
    TResult Function(_Suggestion value)? suggestion,
    TResult Function(_History value)? history,
    required TResult orElse(),
  }) {
    if (newCategory != null) {
      return newCategory(this);
    }
    return orElse();
  }
}

abstract class _NewCategory extends CategorySelectorItem {
  const factory _NewCategory() = _$NewCategoryImpl;
  const _NewCategory._() : super._();
}

/// @nodoc
abstract class _$$HeadingImplCopyWith<$Res> {
  factory _$$HeadingImplCopyWith(
          _$HeadingImpl value, $Res Function(_$HeadingImpl) then) =
      __$$HeadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$HeadingImplCopyWithImpl<$Res>
    extends _$CategorySelectorItemCopyWithImpl<$Res, _$HeadingImpl>
    implements _$$HeadingImplCopyWith<$Res> {
  __$$HeadingImplCopyWithImpl(
      _$HeadingImpl _value, $Res Function(_$HeadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategorySelectorItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$HeadingImpl(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HeadingImpl extends _Heading {
  const _$HeadingImpl(this.name) : super._();

  @override
  final String name;

  @override
  String toString() {
    return 'CategorySelectorItem.heading(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeadingImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of CategorySelectorItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HeadingImplCopyWith<_$HeadingImpl> get copyWith =>
      __$$HeadingImplCopyWithImpl<_$HeadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() newCategory,
    required TResult Function(String name) heading,
    required TResult Function(String name) suggestion,
    required TResult Function(String name) history,
  }) {
    return heading(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? newCategory,
    TResult? Function(String name)? heading,
    TResult? Function(String name)? suggestion,
    TResult? Function(String name)? history,
  }) {
    return heading?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? newCategory,
    TResult Function(String name)? heading,
    TResult Function(String name)? suggestion,
    TResult Function(String name)? history,
    required TResult orElse(),
  }) {
    if (heading != null) {
      return heading(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NewCategory value) newCategory,
    required TResult Function(_Heading value) heading,
    required TResult Function(_Suggestion value) suggestion,
    required TResult Function(_History value) history,
  }) {
    return heading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NewCategory value)? newCategory,
    TResult? Function(_Heading value)? heading,
    TResult? Function(_Suggestion value)? suggestion,
    TResult? Function(_History value)? history,
  }) {
    return heading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NewCategory value)? newCategory,
    TResult Function(_Heading value)? heading,
    TResult Function(_Suggestion value)? suggestion,
    TResult Function(_History value)? history,
    required TResult orElse(),
  }) {
    if (heading != null) {
      return heading(this);
    }
    return orElse();
  }
}

abstract class _Heading extends CategorySelectorItem {
  const factory _Heading(final String name) = _$HeadingImpl;
  const _Heading._() : super._();

  String get name;

  /// Create a copy of CategorySelectorItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HeadingImplCopyWith<_$HeadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuggestionImplCopyWith<$Res> {
  factory _$$SuggestionImplCopyWith(
          _$SuggestionImpl value, $Res Function(_$SuggestionImpl) then) =
      __$$SuggestionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$SuggestionImplCopyWithImpl<$Res>
    extends _$CategorySelectorItemCopyWithImpl<$Res, _$SuggestionImpl>
    implements _$$SuggestionImplCopyWith<$Res> {
  __$$SuggestionImplCopyWithImpl(
      _$SuggestionImpl _value, $Res Function(_$SuggestionImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategorySelectorItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$SuggestionImpl(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SuggestionImpl extends _Suggestion {
  const _$SuggestionImpl(this.name) : super._();

  @override
  final String name;

  @override
  String toString() {
    return 'CategorySelectorItem.suggestion(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestionImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of CategorySelectorItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestionImplCopyWith<_$SuggestionImpl> get copyWith =>
      __$$SuggestionImplCopyWithImpl<_$SuggestionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() newCategory,
    required TResult Function(String name) heading,
    required TResult Function(String name) suggestion,
    required TResult Function(String name) history,
  }) {
    return suggestion(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? newCategory,
    TResult? Function(String name)? heading,
    TResult? Function(String name)? suggestion,
    TResult? Function(String name)? history,
  }) {
    return suggestion?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? newCategory,
    TResult Function(String name)? heading,
    TResult Function(String name)? suggestion,
    TResult Function(String name)? history,
    required TResult orElse(),
  }) {
    if (suggestion != null) {
      return suggestion(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NewCategory value) newCategory,
    required TResult Function(_Heading value) heading,
    required TResult Function(_Suggestion value) suggestion,
    required TResult Function(_History value) history,
  }) {
    return suggestion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NewCategory value)? newCategory,
    TResult? Function(_Heading value)? heading,
    TResult? Function(_Suggestion value)? suggestion,
    TResult? Function(_History value)? history,
  }) {
    return suggestion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NewCategory value)? newCategory,
    TResult Function(_Heading value)? heading,
    TResult Function(_Suggestion value)? suggestion,
    TResult Function(_History value)? history,
    required TResult orElse(),
  }) {
    if (suggestion != null) {
      return suggestion(this);
    }
    return orElse();
  }
}

abstract class _Suggestion extends CategorySelectorItem {
  const factory _Suggestion(final String name) = _$SuggestionImpl;
  const _Suggestion._() : super._();

  String get name;

  /// Create a copy of CategorySelectorItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuggestionImplCopyWith<_$SuggestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HistoryImplCopyWith<$Res> {
  factory _$$HistoryImplCopyWith(
          _$HistoryImpl value, $Res Function(_$HistoryImpl) then) =
      __$$HistoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$HistoryImplCopyWithImpl<$Res>
    extends _$CategorySelectorItemCopyWithImpl<$Res, _$HistoryImpl>
    implements _$$HistoryImplCopyWith<$Res> {
  __$$HistoryImplCopyWithImpl(
      _$HistoryImpl _value, $Res Function(_$HistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategorySelectorItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$HistoryImpl(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HistoryImpl extends _History {
  const _$HistoryImpl(this.name) : super._();

  @override
  final String name;

  @override
  String toString() {
    return 'CategorySelectorItem.history(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of CategorySelectorItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryImplCopyWith<_$HistoryImpl> get copyWith =>
      __$$HistoryImplCopyWithImpl<_$HistoryImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() newCategory,
    required TResult Function(String name) heading,
    required TResult Function(String name) suggestion,
    required TResult Function(String name) history,
  }) {
    return history(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? newCategory,
    TResult? Function(String name)? heading,
    TResult? Function(String name)? suggestion,
    TResult? Function(String name)? history,
  }) {
    return history?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? newCategory,
    TResult Function(String name)? heading,
    TResult Function(String name)? suggestion,
    TResult Function(String name)? history,
    required TResult orElse(),
  }) {
    if (history != null) {
      return history(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NewCategory value) newCategory,
    required TResult Function(_Heading value) heading,
    required TResult Function(_Suggestion value) suggestion,
    required TResult Function(_History value) history,
  }) {
    return history(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NewCategory value)? newCategory,
    TResult? Function(_Heading value)? heading,
    TResult? Function(_Suggestion value)? suggestion,
    TResult? Function(_History value)? history,
  }) {
    return history?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NewCategory value)? newCategory,
    TResult Function(_Heading value)? heading,
    TResult Function(_Suggestion value)? suggestion,
    TResult Function(_History value)? history,
    required TResult orElse(),
  }) {
    if (history != null) {
      return history(this);
    }
    return orElse();
  }
}

abstract class _History extends CategorySelectorItem {
  const factory _History(final String name) = _$HistoryImpl;
  const _History._() : super._();

  String get name;

  /// Create a copy of CategorySelectorItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoryImplCopyWith<_$HistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
