// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserDetailsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserDetails userDetails) loaded,
    required TResult Function(String errorMessage) errorOccuredWhileLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserDetails userDetails)? loaded,
    TResult? Function(String errorMessage)? errorOccuredWhileLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserDetails userDetails)? loaded,
    TResult Function(String errorMessage)? errorOccuredWhileLoading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ErrorOccuredWhileLoading value)
        errorOccuredWhileLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ErrorOccuredWhileLoading value)?
        errorOccuredWhileLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ErrorOccuredWhileLoading value)? errorOccuredWhileLoading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailsStateCopyWith<$Res> {
  factory $UserDetailsStateCopyWith(
          UserDetailsState value, $Res Function(UserDetailsState) then) =
      _$UserDetailsStateCopyWithImpl<$Res, UserDetailsState>;
}

/// @nodoc
class _$UserDetailsStateCopyWithImpl<$Res, $Val extends UserDetailsState>
    implements $UserDetailsStateCopyWith<$Res> {
  _$UserDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$UserDetailsStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'UserDetailsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserDetails userDetails) loaded,
    required TResult Function(String errorMessage) errorOccuredWhileLoading,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserDetails userDetails)? loaded,
    TResult? Function(String errorMessage)? errorOccuredWhileLoading,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserDetails userDetails)? loaded,
    TResult Function(String errorMessage)? errorOccuredWhileLoading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ErrorOccuredWhileLoading value)
        errorOccuredWhileLoading,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ErrorOccuredWhileLoading value)?
        errorOccuredWhileLoading,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ErrorOccuredWhileLoading value)? errorOccuredWhileLoading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements UserDetailsState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$UserDetailsStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'UserDetailsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserDetails userDetails) loaded,
    required TResult Function(String errorMessage) errorOccuredWhileLoading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserDetails userDetails)? loaded,
    TResult? Function(String errorMessage)? errorOccuredWhileLoading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserDetails userDetails)? loaded,
    TResult Function(String errorMessage)? errorOccuredWhileLoading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ErrorOccuredWhileLoading value)
        errorOccuredWhileLoading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ErrorOccuredWhileLoading value)?
        errorOccuredWhileLoading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ErrorOccuredWhileLoading value)? errorOccuredWhileLoading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements UserDetailsState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({UserDetails userDetails});

  $UserDetailsCopyWith<$Res> get userDetails;
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res>
    extends _$UserDetailsStateCopyWithImpl<$Res, _$_Loaded>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userDetails = null,
  }) {
    return _then(_$_Loaded(
      null == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as UserDetails,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDetailsCopyWith<$Res> get userDetails {
    return $UserDetailsCopyWith<$Res>(_value.userDetails, (value) {
      return _then(_value.copyWith(userDetails: value));
    });
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded(this.userDetails);

  @override
  final UserDetails userDetails;

  @override
  String toString() {
    return 'UserDetailsState.loaded(userDetails: $userDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loaded &&
            (identical(other.userDetails, userDetails) ||
                other.userDetails == userDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      __$$_LoadedCopyWithImpl<_$_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserDetails userDetails) loaded,
    required TResult Function(String errorMessage) errorOccuredWhileLoading,
  }) {
    return loaded(userDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserDetails userDetails)? loaded,
    TResult? Function(String errorMessage)? errorOccuredWhileLoading,
  }) {
    return loaded?.call(userDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserDetails userDetails)? loaded,
    TResult Function(String errorMessage)? errorOccuredWhileLoading,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(userDetails);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ErrorOccuredWhileLoading value)
        errorOccuredWhileLoading,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ErrorOccuredWhileLoading value)?
        errorOccuredWhileLoading,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ErrorOccuredWhileLoading value)? errorOccuredWhileLoading,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements UserDetailsState {
  const factory _Loaded(final UserDetails userDetails) = _$_Loaded;

  UserDetails get userDetails;
  @JsonKey(ignore: true)
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorOccuredWhileLoadingCopyWith<$Res> {
  factory _$$_ErrorOccuredWhileLoadingCopyWith(
          _$_ErrorOccuredWhileLoading value,
          $Res Function(_$_ErrorOccuredWhileLoading) then) =
      __$$_ErrorOccuredWhileLoadingCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$_ErrorOccuredWhileLoadingCopyWithImpl<$Res>
    extends _$UserDetailsStateCopyWithImpl<$Res, _$_ErrorOccuredWhileLoading>
    implements _$$_ErrorOccuredWhileLoadingCopyWith<$Res> {
  __$$_ErrorOccuredWhileLoadingCopyWithImpl(_$_ErrorOccuredWhileLoading _value,
      $Res Function(_$_ErrorOccuredWhileLoading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$_ErrorOccuredWhileLoading(
      null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ErrorOccuredWhileLoading implements _ErrorOccuredWhileLoading {
  const _$_ErrorOccuredWhileLoading(this.errorMessage);

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'UserDetailsState.errorOccuredWhileLoading(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ErrorOccuredWhileLoading &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorOccuredWhileLoadingCopyWith<_$_ErrorOccuredWhileLoading>
      get copyWith => __$$_ErrorOccuredWhileLoadingCopyWithImpl<
          _$_ErrorOccuredWhileLoading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserDetails userDetails) loaded,
    required TResult Function(String errorMessage) errorOccuredWhileLoading,
  }) {
    return errorOccuredWhileLoading(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserDetails userDetails)? loaded,
    TResult? Function(String errorMessage)? errorOccuredWhileLoading,
  }) {
    return errorOccuredWhileLoading?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserDetails userDetails)? loaded,
    TResult Function(String errorMessage)? errorOccuredWhileLoading,
    required TResult orElse(),
  }) {
    if (errorOccuredWhileLoading != null) {
      return errorOccuredWhileLoading(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ErrorOccuredWhileLoading value)
        errorOccuredWhileLoading,
  }) {
    return errorOccuredWhileLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ErrorOccuredWhileLoading value)?
        errorOccuredWhileLoading,
  }) {
    return errorOccuredWhileLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ErrorOccuredWhileLoading value)? errorOccuredWhileLoading,
    required TResult orElse(),
  }) {
    if (errorOccuredWhileLoading != null) {
      return errorOccuredWhileLoading(this);
    }
    return orElse();
  }
}

abstract class _ErrorOccuredWhileLoading implements UserDetailsState {
  const factory _ErrorOccuredWhileLoading(final String errorMessage) =
      _$_ErrorOccuredWhileLoading;

  String get errorMessage;
  @JsonKey(ignore: true)
  _$$_ErrorOccuredWhileLoadingCopyWith<_$_ErrorOccuredWhileLoading>
      get copyWith => throw _privateConstructorUsedError;
}
