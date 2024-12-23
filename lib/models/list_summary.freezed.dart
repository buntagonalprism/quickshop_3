// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ListSummary {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// The ID of the user who created the list
  String get ownerId => throw _privateConstructorUsedError;

  /// List of user IDs who can edit the list, including the owner
  List<String> get editorIds => throw _privateConstructorUsedError;

  /// List of user details of users who can edit the list, including the owner
  List<User> get editors => throw _privateConstructorUsedError;

  /// Number of items in the list
  int get itemCount => throw _privateConstructorUsedError;

  /// When the list was last modified by a specific user, in milliseconds since the epoch.
  Map<String, int> get lastModified => throw _privateConstructorUsedError;
  ListType get listType => throw _privateConstructorUsedError;

  /// Create a copy of ListSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListSummaryCopyWith<ListSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListSummaryCopyWith<$Res> {
  factory $ListSummaryCopyWith(
          ListSummary value, $Res Function(ListSummary) then) =
      _$ListSummaryCopyWithImpl<$Res, ListSummary>;
  @useResult
  $Res call(
      {String id,
      String name,
      String ownerId,
      List<String> editorIds,
      List<User> editors,
      int itemCount,
      Map<String, int> lastModified,
      ListType listType});
}

/// @nodoc
class _$ListSummaryCopyWithImpl<$Res, $Val extends ListSummary>
    implements $ListSummaryCopyWith<$Res> {
  _$ListSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      editorIds: null == editorIds
          ? _value.editorIds
          : editorIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      editors: null == editors
          ? _value.editors
          : editors // ignore: cast_nullable_to_non_nullable
              as List<User>,
      itemCount: null == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastModified: null == lastModified
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      listType: null == listType
          ? _value.listType
          : listType // ignore: cast_nullable_to_non_nullable
              as ListType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListSummaryImplCopyWith<$Res>
    implements $ListSummaryCopyWith<$Res> {
  factory _$$ListSummaryImplCopyWith(
          _$ListSummaryImpl value, $Res Function(_$ListSummaryImpl) then) =
      __$$ListSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String ownerId,
      List<String> editorIds,
      List<User> editors,
      int itemCount,
      Map<String, int> lastModified,
      ListType listType});
}

/// @nodoc
class __$$ListSummaryImplCopyWithImpl<$Res>
    extends _$ListSummaryCopyWithImpl<$Res, _$ListSummaryImpl>
    implements _$$ListSummaryImplCopyWith<$Res> {
  __$$ListSummaryImplCopyWithImpl(
      _$ListSummaryImpl _value, $Res Function(_$ListSummaryImpl) _then)
      : super(_value, _then);

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
    return _then(_$ListSummaryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      editorIds: null == editorIds
          ? _value._editorIds
          : editorIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      editors: null == editors
          ? _value._editors
          : editors // ignore: cast_nullable_to_non_nullable
              as List<User>,
      itemCount: null == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastModified: null == lastModified
          ? _value._lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      listType: null == listType
          ? _value.listType
          : listType // ignore: cast_nullable_to_non_nullable
              as ListType,
    ));
  }
}

/// @nodoc

class _$ListSummaryImpl extends _ListSummary {
  const _$ListSummaryImpl(
      {required this.id,
      required this.name,
      required this.ownerId,
      required final List<String> editorIds,
      required final List<User> editors,
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
  final List<User> _editors;

  /// List of user details of users who can edit the list, including the owner
  @override
  List<User> get editors {
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

  @override
  String toString() {
    return 'ListSummary(id: $id, name: $name, ownerId: $ownerId, editorIds: $editorIds, editors: $editors, itemCount: $itemCount, lastModified: $lastModified, listType: $listType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListSummaryImpl &&
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

  /// Create a copy of ListSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListSummaryImplCopyWith<_$ListSummaryImpl> get copyWith =>
      __$$ListSummaryImplCopyWithImpl<_$ListSummaryImpl>(this, _$identity);
}

abstract class _ListSummary extends ListSummary {
  const factory _ListSummary(
      {required final String id,
      required final String name,
      required final String ownerId,
      required final List<String> editorIds,
      required final List<User> editors,
      required final int itemCount,
      required final Map<String, int> lastModified,
      required final ListType listType}) = _$ListSummaryImpl;
  const _ListSummary._() : super._();

  @override
  String get id;
  @override
  String get name;

  /// The ID of the user who created the list
  @override
  String get ownerId;

  /// List of user IDs who can edit the list, including the owner
  @override
  List<String> get editorIds;

  /// List of user details of users who can edit the list, including the owner
  @override
  List<User> get editors;

  /// Number of items in the list
  @override
  int get itemCount;

  /// When the list was last modified by a specific user, in milliseconds since the epoch.
  @override
  Map<String, int> get lastModified;
  @override
  ListType get listType;

  /// Create a copy of ListSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListSummaryImplCopyWith<_$ListSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
