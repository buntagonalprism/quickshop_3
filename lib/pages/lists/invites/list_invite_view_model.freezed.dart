// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_invite_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListInviteViewModel {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ListInviteViewModel);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ListInviteViewModel()';
  }
}

/// @nodoc
class $ListInviteViewModelCopyWith<$Res> {
  $ListInviteViewModelCopyWith(
      ListInviteViewModel _, $Res Function(ListInviteViewModel) __);
}

/// Adds pattern-matching-related methods to [ListInviteViewModel].
extension ListInviteViewModelPatterns on ListInviteViewModel {
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
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_IsOwner value)? isOwner,
    TResult Function(_Pending value)? pending,
    TResult Function(_Accepted value)? accepted,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Loading() when loading != null:
        return loading(_that);
      case _Error() when error != null:
        return error(_that);
      case _NotFound() when notFound != null:
        return notFound(_that);
      case _IsOwner() when isOwner != null:
        return isOwner(_that);
      case _Pending() when pending != null:
        return pending(_that);
      case _Accepted() when accepted != null:
        return accepted(_that);
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_IsOwner value) isOwner,
    required TResult Function(_Pending value) pending,
    required TResult Function(_Accepted value) accepted,
  }) {
    final _that = this;
    switch (_that) {
      case _Loading():
        return loading(_that);
      case _Error():
        return error(_that);
      case _NotFound():
        return notFound(_that);
      case _IsOwner():
        return isOwner(_that);
      case _Pending():
        return pending(_that);
      case _Accepted():
        return accepted(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_IsOwner value)? isOwner,
    TResult? Function(_Pending value)? pending,
    TResult? Function(_Accepted value)? accepted,
  }) {
    final _that = this;
    switch (_that) {
      case _Loading() when loading != null:
        return loading(_that);
      case _Error() when error != null:
        return error(_that);
      case _NotFound() when notFound != null:
        return notFound(_that);
      case _IsOwner() when isOwner != null:
        return isOwner(_that);
      case _Pending() when pending != null:
        return pending(_that);
      case _Accepted() when accepted != null:
        return accepted(_that);
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
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? notFound,
    TResult Function(ListInvite invite)? isOwner,
    TResult Function(ListInvite invite)? pending,
    TResult Function(ListInvite invite)? accepted,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Loading() when loading != null:
        return loading();
      case _Error() when error != null:
        return error();
      case _NotFound() when notFound != null:
        return notFound();
      case _IsOwner() when isOwner != null:
        return isOwner(_that.invite);
      case _Pending() when pending != null:
        return pending(_that.invite);
      case _Accepted() when accepted != null:
        return accepted(_that.invite);
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
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() notFound,
    required TResult Function(ListInvite invite) isOwner,
    required TResult Function(ListInvite invite) pending,
    required TResult Function(ListInvite invite) accepted,
  }) {
    final _that = this;
    switch (_that) {
      case _Loading():
        return loading();
      case _Error():
        return error();
      case _NotFound():
        return notFound();
      case _IsOwner():
        return isOwner(_that.invite);
      case _Pending():
        return pending(_that.invite);
      case _Accepted():
        return accepted(_that.invite);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? notFound,
    TResult? Function(ListInvite invite)? isOwner,
    TResult? Function(ListInvite invite)? pending,
    TResult? Function(ListInvite invite)? accepted,
  }) {
    final _that = this;
    switch (_that) {
      case _Loading() when loading != null:
        return loading();
      case _Error() when error != null:
        return error();
      case _NotFound() when notFound != null:
        return notFound();
      case _IsOwner() when isOwner != null:
        return isOwner(_that.invite);
      case _Pending() when pending != null:
        return pending(_that.invite);
      case _Accepted() when accepted != null:
        return accepted(_that.invite);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Loading extends ListInviteViewModel {
  const _Loading() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ListInviteViewModel.loading()';
  }
}

/// @nodoc

class _Error extends ListInviteViewModel {
  const _Error() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Error);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ListInviteViewModel.error()';
  }
}

/// @nodoc

class _NotFound extends ListInviteViewModel {
  const _NotFound() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _NotFound);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ListInviteViewModel.notFound()';
  }
}

/// @nodoc

class _IsOwner extends ListInviteViewModel {
  const _IsOwner(this.invite) : super._();

  final ListInvite invite;

  /// Create a copy of ListInviteViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IsOwnerCopyWith<_IsOwner> get copyWith =>
      __$IsOwnerCopyWithImpl<_IsOwner>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IsOwner &&
            (identical(other.invite, invite) || other.invite == invite));
  }

  @override
  int get hashCode => Object.hash(runtimeType, invite);

  @override
  String toString() {
    return 'ListInviteViewModel.isOwner(invite: $invite)';
  }
}

/// @nodoc
abstract mixin class _$IsOwnerCopyWith<$Res>
    implements $ListInviteViewModelCopyWith<$Res> {
  factory _$IsOwnerCopyWith(_IsOwner value, $Res Function(_IsOwner) _then) =
      __$IsOwnerCopyWithImpl;
  @useResult
  $Res call({ListInvite invite});

  $ListInviteCopyWith<$Res> get invite;
}

/// @nodoc
class __$IsOwnerCopyWithImpl<$Res> implements _$IsOwnerCopyWith<$Res> {
  __$IsOwnerCopyWithImpl(this._self, this._then);

  final _IsOwner _self;
  final $Res Function(_IsOwner) _then;

  /// Create a copy of ListInviteViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? invite = null,
  }) {
    return _then(_IsOwner(
      null == invite
          ? _self.invite
          : invite // ignore: cast_nullable_to_non_nullable
              as ListInvite,
    ));
  }

  /// Create a copy of ListInviteViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ListInviteCopyWith<$Res> get invite {
    return $ListInviteCopyWith<$Res>(_self.invite, (value) {
      return _then(_self.copyWith(invite: value));
    });
  }
}

/// @nodoc

class _Pending extends ListInviteViewModel {
  const _Pending(this.invite) : super._();

  final ListInvite invite;

  /// Create a copy of ListInviteViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PendingCopyWith<_Pending> get copyWith =>
      __$PendingCopyWithImpl<_Pending>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Pending &&
            (identical(other.invite, invite) || other.invite == invite));
  }

  @override
  int get hashCode => Object.hash(runtimeType, invite);

  @override
  String toString() {
    return 'ListInviteViewModel.pending(invite: $invite)';
  }
}

/// @nodoc
abstract mixin class _$PendingCopyWith<$Res>
    implements $ListInviteViewModelCopyWith<$Res> {
  factory _$PendingCopyWith(_Pending value, $Res Function(_Pending) _then) =
      __$PendingCopyWithImpl;
  @useResult
  $Res call({ListInvite invite});

  $ListInviteCopyWith<$Res> get invite;
}

/// @nodoc
class __$PendingCopyWithImpl<$Res> implements _$PendingCopyWith<$Res> {
  __$PendingCopyWithImpl(this._self, this._then);

  final _Pending _self;
  final $Res Function(_Pending) _then;

  /// Create a copy of ListInviteViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? invite = null,
  }) {
    return _then(_Pending(
      null == invite
          ? _self.invite
          : invite // ignore: cast_nullable_to_non_nullable
              as ListInvite,
    ));
  }

  /// Create a copy of ListInviteViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ListInviteCopyWith<$Res> get invite {
    return $ListInviteCopyWith<$Res>(_self.invite, (value) {
      return _then(_self.copyWith(invite: value));
    });
  }
}

/// @nodoc

class _Accepted extends ListInviteViewModel {
  const _Accepted(this.invite) : super._();

  final ListInvite invite;

  /// Create a copy of ListInviteViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AcceptedCopyWith<_Accepted> get copyWith =>
      __$AcceptedCopyWithImpl<_Accepted>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Accepted &&
            (identical(other.invite, invite) || other.invite == invite));
  }

  @override
  int get hashCode => Object.hash(runtimeType, invite);

  @override
  String toString() {
    return 'ListInviteViewModel.accepted(invite: $invite)';
  }
}

/// @nodoc
abstract mixin class _$AcceptedCopyWith<$Res>
    implements $ListInviteViewModelCopyWith<$Res> {
  factory _$AcceptedCopyWith(_Accepted value, $Res Function(_Accepted) _then) =
      __$AcceptedCopyWithImpl;
  @useResult
  $Res call({ListInvite invite});

  $ListInviteCopyWith<$Res> get invite;
}

/// @nodoc
class __$AcceptedCopyWithImpl<$Res> implements _$AcceptedCopyWith<$Res> {
  __$AcceptedCopyWithImpl(this._self, this._then);

  final _Accepted _self;
  final $Res Function(_Accepted) _then;

  /// Create a copy of ListInviteViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? invite = null,
  }) {
    return _then(_Accepted(
      null == invite
          ? _self.invite
          : invite // ignore: cast_nullable_to_non_nullable
              as ListInvite,
    ));
  }

  /// Create a copy of ListInviteViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ListInviteCopyWith<$Res> get invite {
    return $ListInviteCopyWith<$Res>(_self.invite, (value) {
      return _then(_self.copyWith(invite: value));
    });
  }
}

// dart format on
