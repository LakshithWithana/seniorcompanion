// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SCUser? user) authStatusChanged,
    required TResult Function() logoutRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SCUser? user)? authStatusChanged,
    TResult? Function()? logoutRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SCUser? user)? authStatusChanged,
    TResult Function()? logoutRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStatusChanged value) authStatusChanged,
    required TResult Function(_LogoutRequested value) logoutRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthStatusChanged value)? authStatusChanged,
    TResult? Function(_LogoutRequested value)? logoutRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStatusChanged value)? authStatusChanged,
    TResult Function(_LogoutRequested value)? logoutRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppEventCopyWith<$Res> {
  factory $AppEventCopyWith(AppEvent value, $Res Function(AppEvent) then) =
      _$AppEventCopyWithImpl<$Res, AppEvent>;
}

/// @nodoc
class _$AppEventCopyWithImpl<$Res, $Val extends AppEvent>
    implements $AppEventCopyWith<$Res> {
  _$AppEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_AuthStatusChangedCopyWith<$Res> {
  factory _$$_AuthStatusChangedCopyWith(_$_AuthStatusChanged value,
          $Res Function(_$_AuthStatusChanged) then) =
      __$$_AuthStatusChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({SCUser? user});

  $SCUserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_AuthStatusChangedCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$_AuthStatusChanged>
    implements _$$_AuthStatusChangedCopyWith<$Res> {
  __$$_AuthStatusChangedCopyWithImpl(
      _$_AuthStatusChanged _value, $Res Function(_$_AuthStatusChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$_AuthStatusChanged(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as SCUser?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SCUserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $SCUserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$_AuthStatusChanged implements _AuthStatusChanged {
  const _$_AuthStatusChanged({this.user});

  @override
  final SCUser? user;

  @override
  String toString() {
    return 'AppEvent.authStatusChanged(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthStatusChanged &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthStatusChangedCopyWith<_$_AuthStatusChanged> get copyWith =>
      __$$_AuthStatusChangedCopyWithImpl<_$_AuthStatusChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SCUser? user) authStatusChanged,
    required TResult Function() logoutRequested,
  }) {
    return authStatusChanged(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SCUser? user)? authStatusChanged,
    TResult? Function()? logoutRequested,
  }) {
    return authStatusChanged?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SCUser? user)? authStatusChanged,
    TResult Function()? logoutRequested,
    required TResult orElse(),
  }) {
    if (authStatusChanged != null) {
      return authStatusChanged(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStatusChanged value) authStatusChanged,
    required TResult Function(_LogoutRequested value) logoutRequested,
  }) {
    return authStatusChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthStatusChanged value)? authStatusChanged,
    TResult? Function(_LogoutRequested value)? logoutRequested,
  }) {
    return authStatusChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStatusChanged value)? authStatusChanged,
    TResult Function(_LogoutRequested value)? logoutRequested,
    required TResult orElse(),
  }) {
    if (authStatusChanged != null) {
      return authStatusChanged(this);
    }
    return orElse();
  }
}

abstract class _AuthStatusChanged implements AppEvent {
  const factory _AuthStatusChanged({final SCUser? user}) = _$_AuthStatusChanged;

  SCUser? get user;
  @JsonKey(ignore: true)
  _$$_AuthStatusChangedCopyWith<_$_AuthStatusChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LogoutRequestedCopyWith<$Res> {
  factory _$$_LogoutRequestedCopyWith(
          _$_LogoutRequested value, $Res Function(_$_LogoutRequested) then) =
      __$$_LogoutRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LogoutRequestedCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$_LogoutRequested>
    implements _$$_LogoutRequestedCopyWith<$Res> {
  __$$_LogoutRequestedCopyWithImpl(
      _$_LogoutRequested _value, $Res Function(_$_LogoutRequested) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LogoutRequested implements _LogoutRequested {
  const _$_LogoutRequested();

  @override
  String toString() {
    return 'AppEvent.logoutRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LogoutRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SCUser? user) authStatusChanged,
    required TResult Function() logoutRequested,
  }) {
    return logoutRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SCUser? user)? authStatusChanged,
    TResult? Function()? logoutRequested,
  }) {
    return logoutRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SCUser? user)? authStatusChanged,
    TResult Function()? logoutRequested,
    required TResult orElse(),
  }) {
    if (logoutRequested != null) {
      return logoutRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStatusChanged value) authStatusChanged,
    required TResult Function(_LogoutRequested value) logoutRequested,
  }) {
    return logoutRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthStatusChanged value)? authStatusChanged,
    TResult? Function(_LogoutRequested value)? logoutRequested,
  }) {
    return logoutRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStatusChanged value)? authStatusChanged,
    TResult Function(_LogoutRequested value)? logoutRequested,
    required TResult orElse(),
  }) {
    if (logoutRequested != null) {
      return logoutRequested(this);
    }
    return orElse();
  }
}

abstract class _LogoutRequested implements AppEvent {
  const factory _LogoutRequested() = _$_LogoutRequested;
}
