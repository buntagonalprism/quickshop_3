// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checklist_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChecklistEntry {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ChecklistEntry);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChecklistEntry()';
  }
}

/// @nodoc
class $ChecklistEntryCopyWith<$Res> {
  $ChecklistEntryCopyWith(ChecklistEntry _, $Res Function(ChecklistEntry) __);
}

/// Adds pattern-matching-related methods to [ChecklistEntry].
extension ChecklistEntryPatterns on ChecklistEntry {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChecklistEntryItem value)? item,
    TResult Function(_ChecklistEntryHeading value)? heading,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChecklistEntryItem() when item != null:
        return item(_that);
      case _ChecklistEntryHeading() when heading != null:
        return heading(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChecklistEntryItem value) item,
    required TResult Function(_ChecklistEntryHeading value) heading,
  }) {
    final _that = this;
    switch (_that) {
      case _ChecklistEntryItem():
        return item(_that);
      case _ChecklistEntryHeading():
        return heading(_that);
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChecklistEntryItem value)? item,
    TResult? Function(_ChecklistEntryHeading value)? heading,
  }) {
    final _that = this;
    switch (_that) {
      case _ChecklistEntryItem() when item != null:
        return item(_that);
      case _ChecklistEntryHeading() when heading != null:
        return heading(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ChecklistItem item)? item,
    TResult Function(ChecklistHeading heading)? heading,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChecklistEntryItem() when item != null:
        return item(_that.item);
      case _ChecklistEntryHeading() when heading != null:
        return heading(_that.heading);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ChecklistItem item) item,
    required TResult Function(ChecklistHeading heading) heading,
  }) {
    final _that = this;
    switch (_that) {
      case _ChecklistEntryItem():
        return item(_that.item);
      case _ChecklistEntryHeading():
        return heading(_that.heading);
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ChecklistItem item)? item,
    TResult? Function(ChecklistHeading heading)? heading,
  }) {
    final _that = this;
    switch (_that) {
      case _ChecklistEntryItem() when item != null:
        return item(_that.item);
      case _ChecklistEntryHeading() when heading != null:
        return heading(_that.heading);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ChecklistEntryItem extends ChecklistEntry {
  const _ChecklistEntryItem(this.item) : super._();

  final ChecklistItem item;

  /// Create a copy of ChecklistEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChecklistEntryItemCopyWith<_ChecklistEntryItem> get copyWith =>
      __$ChecklistEntryItemCopyWithImpl<_ChecklistEntryItem>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChecklistEntryItem &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @override
  String toString() {
    return 'ChecklistEntry.item(item: $item)';
  }
}

/// @nodoc
abstract mixin class _$ChecklistEntryItemCopyWith<$Res>
    implements $ChecklistEntryCopyWith<$Res> {
  factory _$ChecklistEntryItemCopyWith(
          _ChecklistEntryItem value, $Res Function(_ChecklistEntryItem) _then) =
      __$ChecklistEntryItemCopyWithImpl;
  @useResult
  $Res call({ChecklistItem item});

  $ChecklistItemCopyWith<$Res> get item;
}

/// @nodoc
class __$ChecklistEntryItemCopyWithImpl<$Res>
    implements _$ChecklistEntryItemCopyWith<$Res> {
  __$ChecklistEntryItemCopyWithImpl(this._self, this._then);

  final _ChecklistEntryItem _self;
  final $Res Function(_ChecklistEntryItem) _then;

  /// Create a copy of ChecklistEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? item = null,
  }) {
    return _then(_ChecklistEntryItem(
      null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as ChecklistItem,
    ));
  }

  /// Create a copy of ChecklistEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChecklistItemCopyWith<$Res> get item {
    return $ChecklistItemCopyWith<$Res>(_self.item, (value) {
      return _then(_self.copyWith(item: value));
    });
  }
}

/// @nodoc

class _ChecklistEntryHeading extends ChecklistEntry {
  const _ChecklistEntryHeading(this.heading) : super._();

  final ChecklistHeading heading;

  /// Create a copy of ChecklistEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChecklistEntryHeadingCopyWith<_ChecklistEntryHeading> get copyWith =>
      __$ChecklistEntryHeadingCopyWithImpl<_ChecklistEntryHeading>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChecklistEntryHeading &&
            (identical(other.heading, heading) || other.heading == heading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, heading);

  @override
  String toString() {
    return 'ChecklistEntry.heading(heading: $heading)';
  }
}

/// @nodoc
abstract mixin class _$ChecklistEntryHeadingCopyWith<$Res>
    implements $ChecklistEntryCopyWith<$Res> {
  factory _$ChecklistEntryHeadingCopyWith(_ChecklistEntryHeading value,
          $Res Function(_ChecklistEntryHeading) _then) =
      __$ChecklistEntryHeadingCopyWithImpl;
  @useResult
  $Res call({ChecklistHeading heading});

  $ChecklistHeadingCopyWith<$Res> get heading;
}

/// @nodoc
class __$ChecklistEntryHeadingCopyWithImpl<$Res>
    implements _$ChecklistEntryHeadingCopyWith<$Res> {
  __$ChecklistEntryHeadingCopyWithImpl(this._self, this._then);

  final _ChecklistEntryHeading _self;
  final $Res Function(_ChecklistEntryHeading) _then;

  /// Create a copy of ChecklistEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? heading = null,
  }) {
    return _then(_ChecklistEntryHeading(
      null == heading
          ? _self.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as ChecklistHeading,
    ));
  }

  /// Create a copy of ChecklistEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChecklistHeadingCopyWith<$Res> get heading {
    return $ChecklistHeadingCopyWith<$Res>(_self.heading, (value) {
      return _then(_self.copyWith(heading: value));
    });
  }
}

/// @nodoc
mixin _$ChecklistItem {
  String get id;
  String get name;
  bool get completed;
  UserSortKey get sortKey;

  /// Create a copy of ChecklistItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChecklistItemCopyWith<ChecklistItem> get copyWith =>
      _$ChecklistItemCopyWithImpl<ChecklistItem>(
          this as ChecklistItem, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChecklistItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.sortKey, sortKey) || other.sortKey == sortKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, completed, sortKey);

  @override
  String toString() {
    return 'ChecklistItem(id: $id, name: $name, completed: $completed, sortKey: $sortKey)';
  }
}

/// @nodoc
abstract mixin class $ChecklistItemCopyWith<$Res> {
  factory $ChecklistItemCopyWith(
          ChecklistItem value, $Res Function(ChecklistItem) _then) =
      _$ChecklistItemCopyWithImpl;
  @useResult
  $Res call({String id, String name, bool completed, UserSortKey sortKey});

  $UserSortKeyCopyWith<$Res> get sortKey;
}

/// @nodoc
class _$ChecklistItemCopyWithImpl<$Res>
    implements $ChecklistItemCopyWith<$Res> {
  _$ChecklistItemCopyWithImpl(this._self, this._then);

  final ChecklistItem _self;
  final $Res Function(ChecklistItem) _then;

  /// Create a copy of ChecklistItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? completed = null,
    Object? sortKey = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      completed: null == completed
          ? _self.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      sortKey: null == sortKey
          ? _self.sortKey
          : sortKey // ignore: cast_nullable_to_non_nullable
              as UserSortKey,
    ));
  }

  /// Create a copy of ChecklistItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserSortKeyCopyWith<$Res> get sortKey {
    return $UserSortKeyCopyWith<$Res>(_self.sortKey, (value) {
      return _then(_self.copyWith(sortKey: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ChecklistItem].
extension ChecklistItemPatterns on ChecklistItem {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ChecklistItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChecklistItem() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ChecklistItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChecklistItem():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ChecklistItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChecklistItem() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id, String name, bool completed, UserSortKey sortKey)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChecklistItem() when $default != null:
        return $default(_that.id, _that.name, _that.completed, _that.sortKey);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id, String name, bool completed, UserSortKey sortKey)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChecklistItem():
        return $default(_that.id, _that.name, _that.completed, _that.sortKey);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id, String name, bool completed, UserSortKey sortKey)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChecklistItem() when $default != null:
        return $default(_that.id, _that.name, _that.completed, _that.sortKey);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ChecklistItem extends ChecklistItem {
  const _ChecklistItem(
      {required this.id,
      required this.name,
      required this.completed,
      required this.sortKey})
      : super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final bool completed;
  @override
  final UserSortKey sortKey;

  /// Create a copy of ChecklistItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChecklistItemCopyWith<_ChecklistItem> get copyWith =>
      __$ChecklistItemCopyWithImpl<_ChecklistItem>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChecklistItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.sortKey, sortKey) || other.sortKey == sortKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, completed, sortKey);

  @override
  String toString() {
    return 'ChecklistItem(id: $id, name: $name, completed: $completed, sortKey: $sortKey)';
  }
}

/// @nodoc
abstract mixin class _$ChecklistItemCopyWith<$Res>
    implements $ChecklistItemCopyWith<$Res> {
  factory _$ChecklistItemCopyWith(
          _ChecklistItem value, $Res Function(_ChecklistItem) _then) =
      __$ChecklistItemCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String name, bool completed, UserSortKey sortKey});

  @override
  $UserSortKeyCopyWith<$Res> get sortKey;
}

/// @nodoc
class __$ChecklistItemCopyWithImpl<$Res>
    implements _$ChecklistItemCopyWith<$Res> {
  __$ChecklistItemCopyWithImpl(this._self, this._then);

  final _ChecklistItem _self;
  final $Res Function(_ChecklistItem) _then;

  /// Create a copy of ChecklistItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? completed = null,
    Object? sortKey = null,
  }) {
    return _then(_ChecklistItem(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      completed: null == completed
          ? _self.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      sortKey: null == sortKey
          ? _self.sortKey
          : sortKey // ignore: cast_nullable_to_non_nullable
              as UserSortKey,
    ));
  }

  /// Create a copy of ChecklistItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserSortKeyCopyWith<$Res> get sortKey {
    return $UserSortKeyCopyWith<$Res>(_self.sortKey, (value) {
      return _then(_self.copyWith(sortKey: value));
    });
  }
}

/// @nodoc
mixin _$ChecklistHeading {
  String get id;
  String get name;
  UserSortKey get sortKey;

  /// Create a copy of ChecklistHeading
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChecklistHeadingCopyWith<ChecklistHeading> get copyWith =>
      _$ChecklistHeadingCopyWithImpl<ChecklistHeading>(
          this as ChecklistHeading, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChecklistHeading &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sortKey, sortKey) || other.sortKey == sortKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, sortKey);

  @override
  String toString() {
    return 'ChecklistHeading(id: $id, name: $name, sortKey: $sortKey)';
  }
}

/// @nodoc
abstract mixin class $ChecklistHeadingCopyWith<$Res> {
  factory $ChecklistHeadingCopyWith(
          ChecklistHeading value, $Res Function(ChecklistHeading) _then) =
      _$ChecklistHeadingCopyWithImpl;
  @useResult
  $Res call({String id, String name, UserSortKey sortKey});

  $UserSortKeyCopyWith<$Res> get sortKey;
}

/// @nodoc
class _$ChecklistHeadingCopyWithImpl<$Res>
    implements $ChecklistHeadingCopyWith<$Res> {
  _$ChecklistHeadingCopyWithImpl(this._self, this._then);

  final ChecklistHeading _self;
  final $Res Function(ChecklistHeading) _then;

  /// Create a copy of ChecklistHeading
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? sortKey = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sortKey: null == sortKey
          ? _self.sortKey
          : sortKey // ignore: cast_nullable_to_non_nullable
              as UserSortKey,
    ));
  }

  /// Create a copy of ChecklistHeading
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserSortKeyCopyWith<$Res> get sortKey {
    return $UserSortKeyCopyWith<$Res>(_self.sortKey, (value) {
      return _then(_self.copyWith(sortKey: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ChecklistHeading].
extension ChecklistHeadingPatterns on ChecklistHeading {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ChecklistHeading value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChecklistHeading() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ChecklistHeading value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChecklistHeading():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ChecklistHeading value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChecklistHeading() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String name, UserSortKey sortKey)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChecklistHeading() when $default != null:
        return $default(_that.id, _that.name, _that.sortKey);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, UserSortKey sortKey) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChecklistHeading():
        return $default(_that.id, _that.name, _that.sortKey);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String name, UserSortKey sortKey)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChecklistHeading() when $default != null:
        return $default(_that.id, _that.name, _that.sortKey);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ChecklistHeading extends ChecklistHeading {
  const _ChecklistHeading(
      {required this.id, required this.name, required this.sortKey})
      : super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final UserSortKey sortKey;

  /// Create a copy of ChecklistHeading
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChecklistHeadingCopyWith<_ChecklistHeading> get copyWith =>
      __$ChecklistHeadingCopyWithImpl<_ChecklistHeading>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChecklistHeading &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sortKey, sortKey) || other.sortKey == sortKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, sortKey);

  @override
  String toString() {
    return 'ChecklistHeading(id: $id, name: $name, sortKey: $sortKey)';
  }
}

/// @nodoc
abstract mixin class _$ChecklistHeadingCopyWith<$Res>
    implements $ChecklistHeadingCopyWith<$Res> {
  factory _$ChecklistHeadingCopyWith(
          _ChecklistHeading value, $Res Function(_ChecklistHeading) _then) =
      __$ChecklistHeadingCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String name, UserSortKey sortKey});

  @override
  $UserSortKeyCopyWith<$Res> get sortKey;
}

/// @nodoc
class __$ChecklistHeadingCopyWithImpl<$Res>
    implements _$ChecklistHeadingCopyWith<$Res> {
  __$ChecklistHeadingCopyWithImpl(this._self, this._then);

  final _ChecklistHeading _self;
  final $Res Function(_ChecklistHeading) _then;

  /// Create a copy of ChecklistHeading
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? sortKey = null,
  }) {
    return _then(_ChecklistHeading(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sortKey: null == sortKey
          ? _self.sortKey
          : sortKey // ignore: cast_nullable_to_non_nullable
              as UserSortKey,
    ));
  }

  /// Create a copy of ChecklistHeading
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserSortKeyCopyWith<$Res> get sortKey {
    return $UserSortKeyCopyWith<$Res>(_self.sortKey, (value) {
      return _then(_self.copyWith(sortKey: value));
    });
  }
}

// dart format on
