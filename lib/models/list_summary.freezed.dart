// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListSummary {
  String get id;
  String get name;

  /// The ID of the user who created the list
  String get ownerId;

  /// List of user IDs who can edit the list, including the owner
  List<String> get editorIds;

  /// List of user details of users who can edit the list, including the owner
  List<UserAuth> get editors;

  /// Number of items in the list
  int get itemCount;

  /// When the list was last modified by a specific user, in milliseconds since the epoch.
  Map<String, int> get lastModified;
  ListType get listType;

  /// Create a copy of ListSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ListSummaryCopyWith<ListSummary> get copyWith =>
      _$ListSummaryCopyWithImpl<ListSummary>(this as ListSummary, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ListSummary &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            const DeepCollectionEquality().equals(other.editorIds, editorIds) &&
            const DeepCollectionEquality().equals(other.editors, editors) &&
            (identical(other.itemCount, itemCount) ||
                other.itemCount == itemCount) &&
            const DeepCollectionEquality()
                .equals(other.lastModified, lastModified) &&
            (identical(other.listType, listType) ||
                other.listType == listType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      ownerId,
      const DeepCollectionEquality().hash(editorIds),
      const DeepCollectionEquality().hash(editors),
      itemCount,
      const DeepCollectionEquality().hash(lastModified),
      listType);

  @override
  String toString() {
    return 'ListSummary(id: $id, name: $name, ownerId: $ownerId, editorIds: $editorIds, editors: $editors, itemCount: $itemCount, lastModified: $lastModified, listType: $listType)';
  }
}

/// @nodoc
abstract mixin class $ListSummaryCopyWith<$Res> {
  factory $ListSummaryCopyWith(
          ListSummary value, $Res Function(ListSummary) _then) =
      _$ListSummaryCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String ownerId,
      List<String> editorIds,
      List<UserAuth> editors,
      int itemCount,
      Map<String, int> lastModified,
      ListType listType});
}

/// @nodoc
class _$ListSummaryCopyWithImpl<$Res> implements $ListSummaryCopyWith<$Res> {
  _$ListSummaryCopyWithImpl(this._self, this._then);

  final ListSummary _self;
  final $Res Function(ListSummary) _then;

  /// Create a copy of ListSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? ownerId = null,
    Object? editorIds = null,
    Object? editors = null,
    Object? itemCount = null,
    Object? lastModified = null,
    Object? listType = null,
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
      ownerId: null == ownerId
          ? _self.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      editorIds: null == editorIds
          ? _self.editorIds
          : editorIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      editors: null == editors
          ? _self.editors
          : editors // ignore: cast_nullable_to_non_nullable
              as List<UserAuth>,
      itemCount: null == itemCount
          ? _self.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastModified: null == lastModified
          ? _self.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      listType: null == listType
          ? _self.listType
          : listType // ignore: cast_nullable_to_non_nullable
              as ListType,
    ));
  }
}

/// Adds pattern-matching-related methods to [ListSummary].
extension ListSummaryPatterns on ListSummary {
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
    TResult Function(_ListSummary value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ListSummary() when $default != null:
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
    TResult Function(_ListSummary value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListSummary():
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
    TResult? Function(_ListSummary value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListSummary() when $default != null:
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
            String id,
            String name,
            String ownerId,
            List<String> editorIds,
            List<UserAuth> editors,
            int itemCount,
            Map<String, int> lastModified,
            ListType listType)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ListSummary() when $default != null:
        return $default(_that.id, _that.name, _that.ownerId, _that.editorIds,
            _that.editors, _that.itemCount, _that.lastModified, _that.listType);
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
            String id,
            String name,
            String ownerId,
            List<String> editorIds,
            List<UserAuth> editors,
            int itemCount,
            Map<String, int> lastModified,
            ListType listType)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListSummary():
        return $default(_that.id, _that.name, _that.ownerId, _that.editorIds,
            _that.editors, _that.itemCount, _that.lastModified, _that.listType);
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
            String id,
            String name,
            String ownerId,
            List<String> editorIds,
            List<UserAuth> editors,
            int itemCount,
            Map<String, int> lastModified,
            ListType listType)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListSummary() when $default != null:
        return $default(_that.id, _that.name, _that.ownerId, _that.editorIds,
            _that.editors, _that.itemCount, _that.lastModified, _that.listType);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ListSummary extends ListSummary {
  const _ListSummary(
      {required this.id,
      required this.name,
      required this.ownerId,
      required final List<String> editorIds,
      required final List<UserAuth> editors,
      required this.itemCount,
      required final Map<String, int> lastModified,
      required this.listType})
      : _editorIds = editorIds,
        _editors = editors,
        _lastModified = lastModified,
        super._();

  @override
  final String id;
  @override
  final String name;

  /// The ID of the user who created the list
  @override
  final String ownerId;

  /// List of user IDs who can edit the list, including the owner
  final List<String> _editorIds;

  /// List of user IDs who can edit the list, including the owner
  @override
  List<String> get editorIds {
    if (_editorIds is EqualUnmodifiableListView) return _editorIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_editorIds);
  }

  /// List of user details of users who can edit the list, including the owner
  final List<UserAuth> _editors;

  /// List of user details of users who can edit the list, including the owner
  @override
  List<UserAuth> get editors {
    if (_editors is EqualUnmodifiableListView) return _editors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_editors);
  }

  /// Number of items in the list
  @override
  final int itemCount;

  /// When the list was last modified by a specific user, in milliseconds since the epoch.
  final Map<String, int> _lastModified;

  /// When the list was last modified by a specific user, in milliseconds since the epoch.
  @override
  Map<String, int> get lastModified {
    if (_lastModified is EqualUnmodifiableMapView) return _lastModified;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_lastModified);
  }

  @override
  final ListType listType;

  /// Create a copy of ListSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ListSummaryCopyWith<_ListSummary> get copyWith =>
      __$ListSummaryCopyWithImpl<_ListSummary>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListSummary &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            const DeepCollectionEquality()
                .equals(other._editorIds, _editorIds) &&
            const DeepCollectionEquality().equals(other._editors, _editors) &&
            (identical(other.itemCount, itemCount) ||
                other.itemCount == itemCount) &&
            const DeepCollectionEquality()
                .equals(other._lastModified, _lastModified) &&
            (identical(other.listType, listType) ||
                other.listType == listType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      ownerId,
      const DeepCollectionEquality().hash(_editorIds),
      const DeepCollectionEquality().hash(_editors),
      itemCount,
      const DeepCollectionEquality().hash(_lastModified),
      listType);

  @override
  String toString() {
    return 'ListSummary(id: $id, name: $name, ownerId: $ownerId, editorIds: $editorIds, editors: $editors, itemCount: $itemCount, lastModified: $lastModified, listType: $listType)';
  }
}

/// @nodoc
abstract mixin class _$ListSummaryCopyWith<$Res>
    implements $ListSummaryCopyWith<$Res> {
  factory _$ListSummaryCopyWith(
          _ListSummary value, $Res Function(_ListSummary) _then) =
      __$ListSummaryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String ownerId,
      List<String> editorIds,
      List<UserAuth> editors,
      int itemCount,
      Map<String, int> lastModified,
      ListType listType});
}

/// @nodoc
class __$ListSummaryCopyWithImpl<$Res> implements _$ListSummaryCopyWith<$Res> {
  __$ListSummaryCopyWithImpl(this._self, this._then);

  final _ListSummary _self;
  final $Res Function(_ListSummary) _then;

  /// Create a copy of ListSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? ownerId = null,
    Object? editorIds = null,
    Object? editors = null,
    Object? itemCount = null,
    Object? lastModified = null,
    Object? listType = null,
  }) {
    return _then(_ListSummary(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _self.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      editorIds: null == editorIds
          ? _self._editorIds
          : editorIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      editors: null == editors
          ? _self._editors
          : editors // ignore: cast_nullable_to_non_nullable
              as List<UserAuth>,
      itemCount: null == itemCount
          ? _self.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastModified: null == lastModified
          ? _self._lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      listType: null == listType
          ? _self.listType
          : listType // ignore: cast_nullable_to_non_nullable
              as ListType,
    ));
  }
}

// dart format on
