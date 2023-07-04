// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_data_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LocationDataFailure {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) locationRequest,
    required TResult Function(String message) locationPermission,
    required TResult Function(String message) locationUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? locationRequest,
    TResult? Function(String message)? locationPermission,
    TResult? Function(String message)? locationUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? locationRequest,
    TResult Function(String message)? locationPermission,
    TResult Function(String message)? locationUpdate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocationRequestFailure value) locationRequest,
    required TResult Function(LocationPermissionFailure value)
        locationPermission,
    required TResult Function(LocationUpdateFailure value) locationUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LocationRequestFailure value)? locationRequest,
    TResult? Function(LocationPermissionFailure value)? locationPermission,
    TResult? Function(LocationUpdateFailure value)? locationUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocationRequestFailure value)? locationRequest,
    TResult Function(LocationPermissionFailure value)? locationPermission,
    TResult Function(LocationUpdateFailure value)? locationUpdate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocationDataFailureCopyWith<LocationDataFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationDataFailureCopyWith<$Res> {
  factory $LocationDataFailureCopyWith(
          LocationDataFailure value, $Res Function(LocationDataFailure) then) =
      _$LocationDataFailureCopyWithImpl<$Res, LocationDataFailure>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$LocationDataFailureCopyWithImpl<$Res, $Val extends LocationDataFailure>
    implements $LocationDataFailureCopyWith<$Res> {
  _$LocationDataFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationRequestFailureCopyWith<$Res>
    implements $LocationDataFailureCopyWith<$Res> {
  factory _$$LocationRequestFailureCopyWith(_$LocationRequestFailure value,
          $Res Function(_$LocationRequestFailure) then) =
      __$$LocationRequestFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$LocationRequestFailureCopyWithImpl<$Res>
    extends _$LocationDataFailureCopyWithImpl<$Res, _$LocationRequestFailure>
    implements _$$LocationRequestFailureCopyWith<$Res> {
  __$$LocationRequestFailureCopyWithImpl(_$LocationRequestFailure _value,
      $Res Function(_$LocationRequestFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$LocationRequestFailure(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LocationRequestFailure implements LocationRequestFailure {
  const _$LocationRequestFailure(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'LocationDataFailure.locationRequest(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationRequestFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationRequestFailureCopyWith<_$LocationRequestFailure> get copyWith =>
      __$$LocationRequestFailureCopyWithImpl<_$LocationRequestFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) locationRequest,
    required TResult Function(String message) locationPermission,
    required TResult Function(String message) locationUpdate,
  }) {
    return locationRequest(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? locationRequest,
    TResult? Function(String message)? locationPermission,
    TResult? Function(String message)? locationUpdate,
  }) {
    return locationRequest?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? locationRequest,
    TResult Function(String message)? locationPermission,
    TResult Function(String message)? locationUpdate,
    required TResult orElse(),
  }) {
    if (locationRequest != null) {
      return locationRequest(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocationRequestFailure value) locationRequest,
    required TResult Function(LocationPermissionFailure value)
        locationPermission,
    required TResult Function(LocationUpdateFailure value) locationUpdate,
  }) {
    return locationRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LocationRequestFailure value)? locationRequest,
    TResult? Function(LocationPermissionFailure value)? locationPermission,
    TResult? Function(LocationUpdateFailure value)? locationUpdate,
  }) {
    return locationRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocationRequestFailure value)? locationRequest,
    TResult Function(LocationPermissionFailure value)? locationPermission,
    TResult Function(LocationUpdateFailure value)? locationUpdate,
    required TResult orElse(),
  }) {
    if (locationRequest != null) {
      return locationRequest(this);
    }
    return orElse();
  }
}

abstract class LocationRequestFailure implements LocationDataFailure {
  const factory LocationRequestFailure(final String message) =
      _$LocationRequestFailure;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$LocationRequestFailureCopyWith<_$LocationRequestFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocationPermissionFailureCopyWith<$Res>
    implements $LocationDataFailureCopyWith<$Res> {
  factory _$$LocationPermissionFailureCopyWith(
          _$LocationPermissionFailure value,
          $Res Function(_$LocationPermissionFailure) then) =
      __$$LocationPermissionFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$LocationPermissionFailureCopyWithImpl<$Res>
    extends _$LocationDataFailureCopyWithImpl<$Res, _$LocationPermissionFailure>
    implements _$$LocationPermissionFailureCopyWith<$Res> {
  __$$LocationPermissionFailureCopyWithImpl(_$LocationPermissionFailure _value,
      $Res Function(_$LocationPermissionFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$LocationPermissionFailure(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LocationPermissionFailure implements LocationPermissionFailure {
  const _$LocationPermissionFailure(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'LocationDataFailure.locationPermission(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationPermissionFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationPermissionFailureCopyWith<_$LocationPermissionFailure>
      get copyWith => __$$LocationPermissionFailureCopyWithImpl<
          _$LocationPermissionFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) locationRequest,
    required TResult Function(String message) locationPermission,
    required TResult Function(String message) locationUpdate,
  }) {
    return locationPermission(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? locationRequest,
    TResult? Function(String message)? locationPermission,
    TResult? Function(String message)? locationUpdate,
  }) {
    return locationPermission?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? locationRequest,
    TResult Function(String message)? locationPermission,
    TResult Function(String message)? locationUpdate,
    required TResult orElse(),
  }) {
    if (locationPermission != null) {
      return locationPermission(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocationRequestFailure value) locationRequest,
    required TResult Function(LocationPermissionFailure value)
        locationPermission,
    required TResult Function(LocationUpdateFailure value) locationUpdate,
  }) {
    return locationPermission(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LocationRequestFailure value)? locationRequest,
    TResult? Function(LocationPermissionFailure value)? locationPermission,
    TResult? Function(LocationUpdateFailure value)? locationUpdate,
  }) {
    return locationPermission?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocationRequestFailure value)? locationRequest,
    TResult Function(LocationPermissionFailure value)? locationPermission,
    TResult Function(LocationUpdateFailure value)? locationUpdate,
    required TResult orElse(),
  }) {
    if (locationPermission != null) {
      return locationPermission(this);
    }
    return orElse();
  }
}

abstract class LocationPermissionFailure implements LocationDataFailure {
  const factory LocationPermissionFailure(final String message) =
      _$LocationPermissionFailure;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$LocationPermissionFailureCopyWith<_$LocationPermissionFailure>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocationUpdateFailureCopyWith<$Res>
    implements $LocationDataFailureCopyWith<$Res> {
  factory _$$LocationUpdateFailureCopyWith(_$LocationUpdateFailure value,
          $Res Function(_$LocationUpdateFailure) then) =
      __$$LocationUpdateFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$LocationUpdateFailureCopyWithImpl<$Res>
    extends _$LocationDataFailureCopyWithImpl<$Res, _$LocationUpdateFailure>
    implements _$$LocationUpdateFailureCopyWith<$Res> {
  __$$LocationUpdateFailureCopyWithImpl(_$LocationUpdateFailure _value,
      $Res Function(_$LocationUpdateFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$LocationUpdateFailure(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LocationUpdateFailure implements LocationUpdateFailure {
  const _$LocationUpdateFailure(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'LocationDataFailure.locationUpdate(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationUpdateFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationUpdateFailureCopyWith<_$LocationUpdateFailure> get copyWith =>
      __$$LocationUpdateFailureCopyWithImpl<_$LocationUpdateFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) locationRequest,
    required TResult Function(String message) locationPermission,
    required TResult Function(String message) locationUpdate,
  }) {
    return locationUpdate(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? locationRequest,
    TResult? Function(String message)? locationPermission,
    TResult? Function(String message)? locationUpdate,
  }) {
    return locationUpdate?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? locationRequest,
    TResult Function(String message)? locationPermission,
    TResult Function(String message)? locationUpdate,
    required TResult orElse(),
  }) {
    if (locationUpdate != null) {
      return locationUpdate(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocationRequestFailure value) locationRequest,
    required TResult Function(LocationPermissionFailure value)
        locationPermission,
    required TResult Function(LocationUpdateFailure value) locationUpdate,
  }) {
    return locationUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LocationRequestFailure value)? locationRequest,
    TResult? Function(LocationPermissionFailure value)? locationPermission,
    TResult? Function(LocationUpdateFailure value)? locationUpdate,
  }) {
    return locationUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocationRequestFailure value)? locationRequest,
    TResult Function(LocationPermissionFailure value)? locationPermission,
    TResult Function(LocationUpdateFailure value)? locationUpdate,
    required TResult orElse(),
  }) {
    if (locationUpdate != null) {
      return locationUpdate(this);
    }
    return orElse();
  }
}

abstract class LocationUpdateFailure implements LocationDataFailure {
  const factory LocationUpdateFailure(final String message) =
      _$LocationUpdateFailure;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$LocationUpdateFailureCopyWith<_$LocationUpdateFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
