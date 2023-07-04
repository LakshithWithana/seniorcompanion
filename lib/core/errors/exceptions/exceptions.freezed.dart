// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exceptions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Exceptions {
  String get message => throw _privateConstructorUsedError;
  String? get devLogs => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? devLogs)
        dataSourceException,
    required TResult Function(String message, String? devLogs)
        customClaimsException,
    required TResult Function(String message, String? devLogs) cacheException,
    required TResult Function(String message, String? devLogs)
        locationPermissionRequest,
    required TResult Function(String message, String? devLogs)
        locationPermissionNotGiven,
    required TResult Function(String message, String? devLogs)
        locationServicesNotEnabled,
    required TResult Function(String message, String? devLogs) locationUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? devLogs)? dataSourceException,
    TResult? Function(String message, String? devLogs)? customClaimsException,
    TResult? Function(String message, String? devLogs)? cacheException,
    TResult? Function(String message, String? devLogs)?
        locationPermissionRequest,
    TResult? Function(String message, String? devLogs)?
        locationPermissionNotGiven,
    TResult? Function(String message, String? devLogs)?
        locationServicesNotEnabled,
    TResult? Function(String message, String? devLogs)? locationUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? devLogs)? dataSourceException,
    TResult Function(String message, String? devLogs)? customClaimsException,
    TResult Function(String message, String? devLogs)? cacheException,
    TResult Function(String message, String? devLogs)?
        locationPermissionRequest,
    TResult Function(String message, String? devLogs)?
        locationPermissionNotGiven,
    TResult Function(String message, String? devLogs)?
        locationServicesNotEnabled,
    TResult Function(String message, String? devLogs)? locationUpdate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataSourceException value) dataSourceException,
    required TResult Function(CustomClaimsException value)
        customClaimsException,
    required TResult Function(CacheException value) cacheException,
    required TResult Function(LocationPermissionRequestException value)
        locationPermissionRequest,
    required TResult Function(LocationPermissionNotGivenException value)
        locationPermissionNotGiven,
    required TResult Function(LocationServicesNotEnabledException value)
        locationServicesNotEnabled,
    required TResult Function(LocationUpdateException value) locationUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataSourceException value)? dataSourceException,
    TResult? Function(CustomClaimsException value)? customClaimsException,
    TResult? Function(CacheException value)? cacheException,
    TResult? Function(LocationPermissionRequestException value)?
        locationPermissionRequest,
    TResult? Function(LocationPermissionNotGivenException value)?
        locationPermissionNotGiven,
    TResult? Function(LocationServicesNotEnabledException value)?
        locationServicesNotEnabled,
    TResult? Function(LocationUpdateException value)? locationUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataSourceException value)? dataSourceException,
    TResult Function(CustomClaimsException value)? customClaimsException,
    TResult Function(CacheException value)? cacheException,
    TResult Function(LocationPermissionRequestException value)?
        locationPermissionRequest,
    TResult Function(LocationPermissionNotGivenException value)?
        locationPermissionNotGiven,
    TResult Function(LocationServicesNotEnabledException value)?
        locationServicesNotEnabled,
    TResult Function(LocationUpdateException value)? locationUpdate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExceptionsCopyWith<Exceptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExceptionsCopyWith<$Res> {
  factory $ExceptionsCopyWith(
          Exceptions value, $Res Function(Exceptions) then) =
      _$ExceptionsCopyWithImpl<$Res, Exceptions>;
  @useResult
  $Res call({String message, String? devLogs});
}

/// @nodoc
class _$ExceptionsCopyWithImpl<$Res, $Val extends Exceptions>
    implements $ExceptionsCopyWith<$Res> {
  _$ExceptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? devLogs = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      devLogs: freezed == devLogs
          ? _value.devLogs
          : devLogs // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataSourceExceptionCopyWith<$Res>
    implements $ExceptionsCopyWith<$Res> {
  factory _$$DataSourceExceptionCopyWith(_$DataSourceException value,
          $Res Function(_$DataSourceException) then) =
      __$$DataSourceExceptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? devLogs});
}

/// @nodoc
class __$$DataSourceExceptionCopyWithImpl<$Res>
    extends _$ExceptionsCopyWithImpl<$Res, _$DataSourceException>
    implements _$$DataSourceExceptionCopyWith<$Res> {
  __$$DataSourceExceptionCopyWithImpl(
      _$DataSourceException _value, $Res Function(_$DataSourceException) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? devLogs = freezed,
  }) {
    return _then(_$DataSourceException(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == devLogs
          ? _value.devLogs
          : devLogs // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DataSourceException implements DataSourceException {
  const _$DataSourceException(this.message, [this.devLogs]);

  @override
  final String message;
  @override
  final String? devLogs;

  @override
  String toString() {
    return 'Exceptions.dataSourceException(message: $message, devLogs: $devLogs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataSourceException &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.devLogs, devLogs) || other.devLogs == devLogs));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, devLogs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataSourceExceptionCopyWith<_$DataSourceException> get copyWith =>
      __$$DataSourceExceptionCopyWithImpl<_$DataSourceException>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? devLogs)
        dataSourceException,
    required TResult Function(String message, String? devLogs)
        customClaimsException,
    required TResult Function(String message, String? devLogs) cacheException,
    required TResult Function(String message, String? devLogs)
        locationPermissionRequest,
    required TResult Function(String message, String? devLogs)
        locationPermissionNotGiven,
    required TResult Function(String message, String? devLogs)
        locationServicesNotEnabled,
    required TResult Function(String message, String? devLogs) locationUpdate,
  }) {
    return dataSourceException(message, devLogs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? devLogs)? dataSourceException,
    TResult? Function(String message, String? devLogs)? customClaimsException,
    TResult? Function(String message, String? devLogs)? cacheException,
    TResult? Function(String message, String? devLogs)?
        locationPermissionRequest,
    TResult? Function(String message, String? devLogs)?
        locationPermissionNotGiven,
    TResult? Function(String message, String? devLogs)?
        locationServicesNotEnabled,
    TResult? Function(String message, String? devLogs)? locationUpdate,
  }) {
    return dataSourceException?.call(message, devLogs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? devLogs)? dataSourceException,
    TResult Function(String message, String? devLogs)? customClaimsException,
    TResult Function(String message, String? devLogs)? cacheException,
    TResult Function(String message, String? devLogs)?
        locationPermissionRequest,
    TResult Function(String message, String? devLogs)?
        locationPermissionNotGiven,
    TResult Function(String message, String? devLogs)?
        locationServicesNotEnabled,
    TResult Function(String message, String? devLogs)? locationUpdate,
    required TResult orElse(),
  }) {
    if (dataSourceException != null) {
      return dataSourceException(message, devLogs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataSourceException value) dataSourceException,
    required TResult Function(CustomClaimsException value)
        customClaimsException,
    required TResult Function(CacheException value) cacheException,
    required TResult Function(LocationPermissionRequestException value)
        locationPermissionRequest,
    required TResult Function(LocationPermissionNotGivenException value)
        locationPermissionNotGiven,
    required TResult Function(LocationServicesNotEnabledException value)
        locationServicesNotEnabled,
    required TResult Function(LocationUpdateException value) locationUpdate,
  }) {
    return dataSourceException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataSourceException value)? dataSourceException,
    TResult? Function(CustomClaimsException value)? customClaimsException,
    TResult? Function(CacheException value)? cacheException,
    TResult? Function(LocationPermissionRequestException value)?
        locationPermissionRequest,
    TResult? Function(LocationPermissionNotGivenException value)?
        locationPermissionNotGiven,
    TResult? Function(LocationServicesNotEnabledException value)?
        locationServicesNotEnabled,
    TResult? Function(LocationUpdateException value)? locationUpdate,
  }) {
    return dataSourceException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataSourceException value)? dataSourceException,
    TResult Function(CustomClaimsException value)? customClaimsException,
    TResult Function(CacheException value)? cacheException,
    TResult Function(LocationPermissionRequestException value)?
        locationPermissionRequest,
    TResult Function(LocationPermissionNotGivenException value)?
        locationPermissionNotGiven,
    TResult Function(LocationServicesNotEnabledException value)?
        locationServicesNotEnabled,
    TResult Function(LocationUpdateException value)? locationUpdate,
    required TResult orElse(),
  }) {
    if (dataSourceException != null) {
      return dataSourceException(this);
    }
    return orElse();
  }
}

abstract class DataSourceException implements Exceptions {
  const factory DataSourceException(final String message,
      [final String? devLogs]) = _$DataSourceException;

  @override
  String get message;
  @override
  String? get devLogs;
  @override
  @JsonKey(ignore: true)
  _$$DataSourceExceptionCopyWith<_$DataSourceException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CustomClaimsExceptionCopyWith<$Res>
    implements $ExceptionsCopyWith<$Res> {
  factory _$$CustomClaimsExceptionCopyWith(_$CustomClaimsException value,
          $Res Function(_$CustomClaimsException) then) =
      __$$CustomClaimsExceptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? devLogs});
}

/// @nodoc
class __$$CustomClaimsExceptionCopyWithImpl<$Res>
    extends _$ExceptionsCopyWithImpl<$Res, _$CustomClaimsException>
    implements _$$CustomClaimsExceptionCopyWith<$Res> {
  __$$CustomClaimsExceptionCopyWithImpl(_$CustomClaimsException _value,
      $Res Function(_$CustomClaimsException) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? devLogs = freezed,
  }) {
    return _then(_$CustomClaimsException(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == devLogs
          ? _value.devLogs
          : devLogs // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CustomClaimsException implements CustomClaimsException {
  const _$CustomClaimsException(this.message, [this.devLogs]);

  @override
  final String message;
  @override
  final String? devLogs;

  @override
  String toString() {
    return 'Exceptions.customClaimsException(message: $message, devLogs: $devLogs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomClaimsException &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.devLogs, devLogs) || other.devLogs == devLogs));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, devLogs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomClaimsExceptionCopyWith<_$CustomClaimsException> get copyWith =>
      __$$CustomClaimsExceptionCopyWithImpl<_$CustomClaimsException>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? devLogs)
        dataSourceException,
    required TResult Function(String message, String? devLogs)
        customClaimsException,
    required TResult Function(String message, String? devLogs) cacheException,
    required TResult Function(String message, String? devLogs)
        locationPermissionRequest,
    required TResult Function(String message, String? devLogs)
        locationPermissionNotGiven,
    required TResult Function(String message, String? devLogs)
        locationServicesNotEnabled,
    required TResult Function(String message, String? devLogs) locationUpdate,
  }) {
    return customClaimsException(message, devLogs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? devLogs)? dataSourceException,
    TResult? Function(String message, String? devLogs)? customClaimsException,
    TResult? Function(String message, String? devLogs)? cacheException,
    TResult? Function(String message, String? devLogs)?
        locationPermissionRequest,
    TResult? Function(String message, String? devLogs)?
        locationPermissionNotGiven,
    TResult? Function(String message, String? devLogs)?
        locationServicesNotEnabled,
    TResult? Function(String message, String? devLogs)? locationUpdate,
  }) {
    return customClaimsException?.call(message, devLogs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? devLogs)? dataSourceException,
    TResult Function(String message, String? devLogs)? customClaimsException,
    TResult Function(String message, String? devLogs)? cacheException,
    TResult Function(String message, String? devLogs)?
        locationPermissionRequest,
    TResult Function(String message, String? devLogs)?
        locationPermissionNotGiven,
    TResult Function(String message, String? devLogs)?
        locationServicesNotEnabled,
    TResult Function(String message, String? devLogs)? locationUpdate,
    required TResult orElse(),
  }) {
    if (customClaimsException != null) {
      return customClaimsException(message, devLogs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataSourceException value) dataSourceException,
    required TResult Function(CustomClaimsException value)
        customClaimsException,
    required TResult Function(CacheException value) cacheException,
    required TResult Function(LocationPermissionRequestException value)
        locationPermissionRequest,
    required TResult Function(LocationPermissionNotGivenException value)
        locationPermissionNotGiven,
    required TResult Function(LocationServicesNotEnabledException value)
        locationServicesNotEnabled,
    required TResult Function(LocationUpdateException value) locationUpdate,
  }) {
    return customClaimsException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataSourceException value)? dataSourceException,
    TResult? Function(CustomClaimsException value)? customClaimsException,
    TResult? Function(CacheException value)? cacheException,
    TResult? Function(LocationPermissionRequestException value)?
        locationPermissionRequest,
    TResult? Function(LocationPermissionNotGivenException value)?
        locationPermissionNotGiven,
    TResult? Function(LocationServicesNotEnabledException value)?
        locationServicesNotEnabled,
    TResult? Function(LocationUpdateException value)? locationUpdate,
  }) {
    return customClaimsException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataSourceException value)? dataSourceException,
    TResult Function(CustomClaimsException value)? customClaimsException,
    TResult Function(CacheException value)? cacheException,
    TResult Function(LocationPermissionRequestException value)?
        locationPermissionRequest,
    TResult Function(LocationPermissionNotGivenException value)?
        locationPermissionNotGiven,
    TResult Function(LocationServicesNotEnabledException value)?
        locationServicesNotEnabled,
    TResult Function(LocationUpdateException value)? locationUpdate,
    required TResult orElse(),
  }) {
    if (customClaimsException != null) {
      return customClaimsException(this);
    }
    return orElse();
  }
}

abstract class CustomClaimsException implements Exceptions {
  const factory CustomClaimsException(final String message,
      [final String? devLogs]) = _$CustomClaimsException;

  @override
  String get message;
  @override
  String? get devLogs;
  @override
  @JsonKey(ignore: true)
  _$$CustomClaimsExceptionCopyWith<_$CustomClaimsException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CacheExceptionCopyWith<$Res>
    implements $ExceptionsCopyWith<$Res> {
  factory _$$CacheExceptionCopyWith(
          _$CacheException value, $Res Function(_$CacheException) then) =
      __$$CacheExceptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? devLogs});
}

/// @nodoc
class __$$CacheExceptionCopyWithImpl<$Res>
    extends _$ExceptionsCopyWithImpl<$Res, _$CacheException>
    implements _$$CacheExceptionCopyWith<$Res> {
  __$$CacheExceptionCopyWithImpl(
      _$CacheException _value, $Res Function(_$CacheException) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? devLogs = freezed,
  }) {
    return _then(_$CacheException(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == devLogs
          ? _value.devLogs
          : devLogs // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CacheException implements CacheException {
  const _$CacheException(this.message, [this.devLogs]);

  @override
  final String message;
  @override
  final String? devLogs;

  @override
  String toString() {
    return 'Exceptions.cacheException(message: $message, devLogs: $devLogs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CacheException &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.devLogs, devLogs) || other.devLogs == devLogs));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, devLogs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CacheExceptionCopyWith<_$CacheException> get copyWith =>
      __$$CacheExceptionCopyWithImpl<_$CacheException>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? devLogs)
        dataSourceException,
    required TResult Function(String message, String? devLogs)
        customClaimsException,
    required TResult Function(String message, String? devLogs) cacheException,
    required TResult Function(String message, String? devLogs)
        locationPermissionRequest,
    required TResult Function(String message, String? devLogs)
        locationPermissionNotGiven,
    required TResult Function(String message, String? devLogs)
        locationServicesNotEnabled,
    required TResult Function(String message, String? devLogs) locationUpdate,
  }) {
    return cacheException(message, devLogs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? devLogs)? dataSourceException,
    TResult? Function(String message, String? devLogs)? customClaimsException,
    TResult? Function(String message, String? devLogs)? cacheException,
    TResult? Function(String message, String? devLogs)?
        locationPermissionRequest,
    TResult? Function(String message, String? devLogs)?
        locationPermissionNotGiven,
    TResult? Function(String message, String? devLogs)?
        locationServicesNotEnabled,
    TResult? Function(String message, String? devLogs)? locationUpdate,
  }) {
    return cacheException?.call(message, devLogs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? devLogs)? dataSourceException,
    TResult Function(String message, String? devLogs)? customClaimsException,
    TResult Function(String message, String? devLogs)? cacheException,
    TResult Function(String message, String? devLogs)?
        locationPermissionRequest,
    TResult Function(String message, String? devLogs)?
        locationPermissionNotGiven,
    TResult Function(String message, String? devLogs)?
        locationServicesNotEnabled,
    TResult Function(String message, String? devLogs)? locationUpdate,
    required TResult orElse(),
  }) {
    if (cacheException != null) {
      return cacheException(message, devLogs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataSourceException value) dataSourceException,
    required TResult Function(CustomClaimsException value)
        customClaimsException,
    required TResult Function(CacheException value) cacheException,
    required TResult Function(LocationPermissionRequestException value)
        locationPermissionRequest,
    required TResult Function(LocationPermissionNotGivenException value)
        locationPermissionNotGiven,
    required TResult Function(LocationServicesNotEnabledException value)
        locationServicesNotEnabled,
    required TResult Function(LocationUpdateException value) locationUpdate,
  }) {
    return cacheException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataSourceException value)? dataSourceException,
    TResult? Function(CustomClaimsException value)? customClaimsException,
    TResult? Function(CacheException value)? cacheException,
    TResult? Function(LocationPermissionRequestException value)?
        locationPermissionRequest,
    TResult? Function(LocationPermissionNotGivenException value)?
        locationPermissionNotGiven,
    TResult? Function(LocationServicesNotEnabledException value)?
        locationServicesNotEnabled,
    TResult? Function(LocationUpdateException value)? locationUpdate,
  }) {
    return cacheException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataSourceException value)? dataSourceException,
    TResult Function(CustomClaimsException value)? customClaimsException,
    TResult Function(CacheException value)? cacheException,
    TResult Function(LocationPermissionRequestException value)?
        locationPermissionRequest,
    TResult Function(LocationPermissionNotGivenException value)?
        locationPermissionNotGiven,
    TResult Function(LocationServicesNotEnabledException value)?
        locationServicesNotEnabled,
    TResult Function(LocationUpdateException value)? locationUpdate,
    required TResult orElse(),
  }) {
    if (cacheException != null) {
      return cacheException(this);
    }
    return orElse();
  }
}

abstract class CacheException implements Exceptions {
  const factory CacheException(final String message, [final String? devLogs]) =
      _$CacheException;

  @override
  String get message;
  @override
  String? get devLogs;
  @override
  @JsonKey(ignore: true)
  _$$CacheExceptionCopyWith<_$CacheException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocationPermissionRequestExceptionCopyWith<$Res>
    implements $ExceptionsCopyWith<$Res> {
  factory _$$LocationPermissionRequestExceptionCopyWith(
          _$LocationPermissionRequestException value,
          $Res Function(_$LocationPermissionRequestException) then) =
      __$$LocationPermissionRequestExceptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? devLogs});
}

/// @nodoc
class __$$LocationPermissionRequestExceptionCopyWithImpl<$Res>
    extends _$ExceptionsCopyWithImpl<$Res, _$LocationPermissionRequestException>
    implements _$$LocationPermissionRequestExceptionCopyWith<$Res> {
  __$$LocationPermissionRequestExceptionCopyWithImpl(
      _$LocationPermissionRequestException _value,
      $Res Function(_$LocationPermissionRequestException) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? devLogs = freezed,
  }) {
    return _then(_$LocationPermissionRequestException(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == devLogs
          ? _value.devLogs
          : devLogs // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LocationPermissionRequestException
    implements LocationPermissionRequestException {
  const _$LocationPermissionRequestException(this.message, [this.devLogs]);

  @override
  final String message;
  @override
  final String? devLogs;

  @override
  String toString() {
    return 'Exceptions.locationPermissionRequest(message: $message, devLogs: $devLogs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationPermissionRequestException &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.devLogs, devLogs) || other.devLogs == devLogs));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, devLogs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationPermissionRequestExceptionCopyWith<
          _$LocationPermissionRequestException>
      get copyWith => __$$LocationPermissionRequestExceptionCopyWithImpl<
          _$LocationPermissionRequestException>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? devLogs)
        dataSourceException,
    required TResult Function(String message, String? devLogs)
        customClaimsException,
    required TResult Function(String message, String? devLogs) cacheException,
    required TResult Function(String message, String? devLogs)
        locationPermissionRequest,
    required TResult Function(String message, String? devLogs)
        locationPermissionNotGiven,
    required TResult Function(String message, String? devLogs)
        locationServicesNotEnabled,
    required TResult Function(String message, String? devLogs) locationUpdate,
  }) {
    return locationPermissionRequest(message, devLogs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? devLogs)? dataSourceException,
    TResult? Function(String message, String? devLogs)? customClaimsException,
    TResult? Function(String message, String? devLogs)? cacheException,
    TResult? Function(String message, String? devLogs)?
        locationPermissionRequest,
    TResult? Function(String message, String? devLogs)?
        locationPermissionNotGiven,
    TResult? Function(String message, String? devLogs)?
        locationServicesNotEnabled,
    TResult? Function(String message, String? devLogs)? locationUpdate,
  }) {
    return locationPermissionRequest?.call(message, devLogs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? devLogs)? dataSourceException,
    TResult Function(String message, String? devLogs)? customClaimsException,
    TResult Function(String message, String? devLogs)? cacheException,
    TResult Function(String message, String? devLogs)?
        locationPermissionRequest,
    TResult Function(String message, String? devLogs)?
        locationPermissionNotGiven,
    TResult Function(String message, String? devLogs)?
        locationServicesNotEnabled,
    TResult Function(String message, String? devLogs)? locationUpdate,
    required TResult orElse(),
  }) {
    if (locationPermissionRequest != null) {
      return locationPermissionRequest(message, devLogs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataSourceException value) dataSourceException,
    required TResult Function(CustomClaimsException value)
        customClaimsException,
    required TResult Function(CacheException value) cacheException,
    required TResult Function(LocationPermissionRequestException value)
        locationPermissionRequest,
    required TResult Function(LocationPermissionNotGivenException value)
        locationPermissionNotGiven,
    required TResult Function(LocationServicesNotEnabledException value)
        locationServicesNotEnabled,
    required TResult Function(LocationUpdateException value) locationUpdate,
  }) {
    return locationPermissionRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataSourceException value)? dataSourceException,
    TResult? Function(CustomClaimsException value)? customClaimsException,
    TResult? Function(CacheException value)? cacheException,
    TResult? Function(LocationPermissionRequestException value)?
        locationPermissionRequest,
    TResult? Function(LocationPermissionNotGivenException value)?
        locationPermissionNotGiven,
    TResult? Function(LocationServicesNotEnabledException value)?
        locationServicesNotEnabled,
    TResult? Function(LocationUpdateException value)? locationUpdate,
  }) {
    return locationPermissionRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataSourceException value)? dataSourceException,
    TResult Function(CustomClaimsException value)? customClaimsException,
    TResult Function(CacheException value)? cacheException,
    TResult Function(LocationPermissionRequestException value)?
        locationPermissionRequest,
    TResult Function(LocationPermissionNotGivenException value)?
        locationPermissionNotGiven,
    TResult Function(LocationServicesNotEnabledException value)?
        locationServicesNotEnabled,
    TResult Function(LocationUpdateException value)? locationUpdate,
    required TResult orElse(),
  }) {
    if (locationPermissionRequest != null) {
      return locationPermissionRequest(this);
    }
    return orElse();
  }
}

abstract class LocationPermissionRequestException implements Exceptions {
  const factory LocationPermissionRequestException(final String message,
      [final String? devLogs]) = _$LocationPermissionRequestException;

  @override
  String get message;
  @override
  String? get devLogs;
  @override
  @JsonKey(ignore: true)
  _$$LocationPermissionRequestExceptionCopyWith<
          _$LocationPermissionRequestException>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocationPermissionNotGivenExceptionCopyWith<$Res>
    implements $ExceptionsCopyWith<$Res> {
  factory _$$LocationPermissionNotGivenExceptionCopyWith(
          _$LocationPermissionNotGivenException value,
          $Res Function(_$LocationPermissionNotGivenException) then) =
      __$$LocationPermissionNotGivenExceptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? devLogs});
}

/// @nodoc
class __$$LocationPermissionNotGivenExceptionCopyWithImpl<$Res>
    extends _$ExceptionsCopyWithImpl<$Res,
        _$LocationPermissionNotGivenException>
    implements _$$LocationPermissionNotGivenExceptionCopyWith<$Res> {
  __$$LocationPermissionNotGivenExceptionCopyWithImpl(
      _$LocationPermissionNotGivenException _value,
      $Res Function(_$LocationPermissionNotGivenException) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? devLogs = freezed,
  }) {
    return _then(_$LocationPermissionNotGivenException(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == devLogs
          ? _value.devLogs
          : devLogs // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LocationPermissionNotGivenException
    implements LocationPermissionNotGivenException {
  const _$LocationPermissionNotGivenException(this.message, [this.devLogs]);

  @override
  final String message;
  @override
  final String? devLogs;

  @override
  String toString() {
    return 'Exceptions.locationPermissionNotGiven(message: $message, devLogs: $devLogs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationPermissionNotGivenException &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.devLogs, devLogs) || other.devLogs == devLogs));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, devLogs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationPermissionNotGivenExceptionCopyWith<
          _$LocationPermissionNotGivenException>
      get copyWith => __$$LocationPermissionNotGivenExceptionCopyWithImpl<
          _$LocationPermissionNotGivenException>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? devLogs)
        dataSourceException,
    required TResult Function(String message, String? devLogs)
        customClaimsException,
    required TResult Function(String message, String? devLogs) cacheException,
    required TResult Function(String message, String? devLogs)
        locationPermissionRequest,
    required TResult Function(String message, String? devLogs)
        locationPermissionNotGiven,
    required TResult Function(String message, String? devLogs)
        locationServicesNotEnabled,
    required TResult Function(String message, String? devLogs) locationUpdate,
  }) {
    return locationPermissionNotGiven(message, devLogs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? devLogs)? dataSourceException,
    TResult? Function(String message, String? devLogs)? customClaimsException,
    TResult? Function(String message, String? devLogs)? cacheException,
    TResult? Function(String message, String? devLogs)?
        locationPermissionRequest,
    TResult? Function(String message, String? devLogs)?
        locationPermissionNotGiven,
    TResult? Function(String message, String? devLogs)?
        locationServicesNotEnabled,
    TResult? Function(String message, String? devLogs)? locationUpdate,
  }) {
    return locationPermissionNotGiven?.call(message, devLogs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? devLogs)? dataSourceException,
    TResult Function(String message, String? devLogs)? customClaimsException,
    TResult Function(String message, String? devLogs)? cacheException,
    TResult Function(String message, String? devLogs)?
        locationPermissionRequest,
    TResult Function(String message, String? devLogs)?
        locationPermissionNotGiven,
    TResult Function(String message, String? devLogs)?
        locationServicesNotEnabled,
    TResult Function(String message, String? devLogs)? locationUpdate,
    required TResult orElse(),
  }) {
    if (locationPermissionNotGiven != null) {
      return locationPermissionNotGiven(message, devLogs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataSourceException value) dataSourceException,
    required TResult Function(CustomClaimsException value)
        customClaimsException,
    required TResult Function(CacheException value) cacheException,
    required TResult Function(LocationPermissionRequestException value)
        locationPermissionRequest,
    required TResult Function(LocationPermissionNotGivenException value)
        locationPermissionNotGiven,
    required TResult Function(LocationServicesNotEnabledException value)
        locationServicesNotEnabled,
    required TResult Function(LocationUpdateException value) locationUpdate,
  }) {
    return locationPermissionNotGiven(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataSourceException value)? dataSourceException,
    TResult? Function(CustomClaimsException value)? customClaimsException,
    TResult? Function(CacheException value)? cacheException,
    TResult? Function(LocationPermissionRequestException value)?
        locationPermissionRequest,
    TResult? Function(LocationPermissionNotGivenException value)?
        locationPermissionNotGiven,
    TResult? Function(LocationServicesNotEnabledException value)?
        locationServicesNotEnabled,
    TResult? Function(LocationUpdateException value)? locationUpdate,
  }) {
    return locationPermissionNotGiven?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataSourceException value)? dataSourceException,
    TResult Function(CustomClaimsException value)? customClaimsException,
    TResult Function(CacheException value)? cacheException,
    TResult Function(LocationPermissionRequestException value)?
        locationPermissionRequest,
    TResult Function(LocationPermissionNotGivenException value)?
        locationPermissionNotGiven,
    TResult Function(LocationServicesNotEnabledException value)?
        locationServicesNotEnabled,
    TResult Function(LocationUpdateException value)? locationUpdate,
    required TResult orElse(),
  }) {
    if (locationPermissionNotGiven != null) {
      return locationPermissionNotGiven(this);
    }
    return orElse();
  }
}

abstract class LocationPermissionNotGivenException implements Exceptions {
  const factory LocationPermissionNotGivenException(final String message,
      [final String? devLogs]) = _$LocationPermissionNotGivenException;

  @override
  String get message;
  @override
  String? get devLogs;
  @override
  @JsonKey(ignore: true)
  _$$LocationPermissionNotGivenExceptionCopyWith<
          _$LocationPermissionNotGivenException>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocationServicesNotEnabledExceptionCopyWith<$Res>
    implements $ExceptionsCopyWith<$Res> {
  factory _$$LocationServicesNotEnabledExceptionCopyWith(
          _$LocationServicesNotEnabledException value,
          $Res Function(_$LocationServicesNotEnabledException) then) =
      __$$LocationServicesNotEnabledExceptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? devLogs});
}

/// @nodoc
class __$$LocationServicesNotEnabledExceptionCopyWithImpl<$Res>
    extends _$ExceptionsCopyWithImpl<$Res,
        _$LocationServicesNotEnabledException>
    implements _$$LocationServicesNotEnabledExceptionCopyWith<$Res> {
  __$$LocationServicesNotEnabledExceptionCopyWithImpl(
      _$LocationServicesNotEnabledException _value,
      $Res Function(_$LocationServicesNotEnabledException) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? devLogs = freezed,
  }) {
    return _then(_$LocationServicesNotEnabledException(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == devLogs
          ? _value.devLogs
          : devLogs // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LocationServicesNotEnabledException
    implements LocationServicesNotEnabledException {
  const _$LocationServicesNotEnabledException(this.message, [this.devLogs]);

  @override
  final String message;
  @override
  final String? devLogs;

  @override
  String toString() {
    return 'Exceptions.locationServicesNotEnabled(message: $message, devLogs: $devLogs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationServicesNotEnabledException &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.devLogs, devLogs) || other.devLogs == devLogs));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, devLogs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationServicesNotEnabledExceptionCopyWith<
          _$LocationServicesNotEnabledException>
      get copyWith => __$$LocationServicesNotEnabledExceptionCopyWithImpl<
          _$LocationServicesNotEnabledException>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? devLogs)
        dataSourceException,
    required TResult Function(String message, String? devLogs)
        customClaimsException,
    required TResult Function(String message, String? devLogs) cacheException,
    required TResult Function(String message, String? devLogs)
        locationPermissionRequest,
    required TResult Function(String message, String? devLogs)
        locationPermissionNotGiven,
    required TResult Function(String message, String? devLogs)
        locationServicesNotEnabled,
    required TResult Function(String message, String? devLogs) locationUpdate,
  }) {
    return locationServicesNotEnabled(message, devLogs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? devLogs)? dataSourceException,
    TResult? Function(String message, String? devLogs)? customClaimsException,
    TResult? Function(String message, String? devLogs)? cacheException,
    TResult? Function(String message, String? devLogs)?
        locationPermissionRequest,
    TResult? Function(String message, String? devLogs)?
        locationPermissionNotGiven,
    TResult? Function(String message, String? devLogs)?
        locationServicesNotEnabled,
    TResult? Function(String message, String? devLogs)? locationUpdate,
  }) {
    return locationServicesNotEnabled?.call(message, devLogs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? devLogs)? dataSourceException,
    TResult Function(String message, String? devLogs)? customClaimsException,
    TResult Function(String message, String? devLogs)? cacheException,
    TResult Function(String message, String? devLogs)?
        locationPermissionRequest,
    TResult Function(String message, String? devLogs)?
        locationPermissionNotGiven,
    TResult Function(String message, String? devLogs)?
        locationServicesNotEnabled,
    TResult Function(String message, String? devLogs)? locationUpdate,
    required TResult orElse(),
  }) {
    if (locationServicesNotEnabled != null) {
      return locationServicesNotEnabled(message, devLogs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataSourceException value) dataSourceException,
    required TResult Function(CustomClaimsException value)
        customClaimsException,
    required TResult Function(CacheException value) cacheException,
    required TResult Function(LocationPermissionRequestException value)
        locationPermissionRequest,
    required TResult Function(LocationPermissionNotGivenException value)
        locationPermissionNotGiven,
    required TResult Function(LocationServicesNotEnabledException value)
        locationServicesNotEnabled,
    required TResult Function(LocationUpdateException value) locationUpdate,
  }) {
    return locationServicesNotEnabled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataSourceException value)? dataSourceException,
    TResult? Function(CustomClaimsException value)? customClaimsException,
    TResult? Function(CacheException value)? cacheException,
    TResult? Function(LocationPermissionRequestException value)?
        locationPermissionRequest,
    TResult? Function(LocationPermissionNotGivenException value)?
        locationPermissionNotGiven,
    TResult? Function(LocationServicesNotEnabledException value)?
        locationServicesNotEnabled,
    TResult? Function(LocationUpdateException value)? locationUpdate,
  }) {
    return locationServicesNotEnabled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataSourceException value)? dataSourceException,
    TResult Function(CustomClaimsException value)? customClaimsException,
    TResult Function(CacheException value)? cacheException,
    TResult Function(LocationPermissionRequestException value)?
        locationPermissionRequest,
    TResult Function(LocationPermissionNotGivenException value)?
        locationPermissionNotGiven,
    TResult Function(LocationServicesNotEnabledException value)?
        locationServicesNotEnabled,
    TResult Function(LocationUpdateException value)? locationUpdate,
    required TResult orElse(),
  }) {
    if (locationServicesNotEnabled != null) {
      return locationServicesNotEnabled(this);
    }
    return orElse();
  }
}

abstract class LocationServicesNotEnabledException implements Exceptions {
  const factory LocationServicesNotEnabledException(final String message,
      [final String? devLogs]) = _$LocationServicesNotEnabledException;

  @override
  String get message;
  @override
  String? get devLogs;
  @override
  @JsonKey(ignore: true)
  _$$LocationServicesNotEnabledExceptionCopyWith<
          _$LocationServicesNotEnabledException>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocationUpdateExceptionCopyWith<$Res>
    implements $ExceptionsCopyWith<$Res> {
  factory _$$LocationUpdateExceptionCopyWith(_$LocationUpdateException value,
          $Res Function(_$LocationUpdateException) then) =
      __$$LocationUpdateExceptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? devLogs});
}

/// @nodoc
class __$$LocationUpdateExceptionCopyWithImpl<$Res>
    extends _$ExceptionsCopyWithImpl<$Res, _$LocationUpdateException>
    implements _$$LocationUpdateExceptionCopyWith<$Res> {
  __$$LocationUpdateExceptionCopyWithImpl(_$LocationUpdateException _value,
      $Res Function(_$LocationUpdateException) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? devLogs = freezed,
  }) {
    return _then(_$LocationUpdateException(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == devLogs
          ? _value.devLogs
          : devLogs // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LocationUpdateException implements LocationUpdateException {
  const _$LocationUpdateException(this.message, [this.devLogs]);

  @override
  final String message;
  @override
  final String? devLogs;

  @override
  String toString() {
    return 'Exceptions.locationUpdate(message: $message, devLogs: $devLogs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationUpdateException &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.devLogs, devLogs) || other.devLogs == devLogs));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, devLogs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationUpdateExceptionCopyWith<_$LocationUpdateException> get copyWith =>
      __$$LocationUpdateExceptionCopyWithImpl<_$LocationUpdateException>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? devLogs)
        dataSourceException,
    required TResult Function(String message, String? devLogs)
        customClaimsException,
    required TResult Function(String message, String? devLogs) cacheException,
    required TResult Function(String message, String? devLogs)
        locationPermissionRequest,
    required TResult Function(String message, String? devLogs)
        locationPermissionNotGiven,
    required TResult Function(String message, String? devLogs)
        locationServicesNotEnabled,
    required TResult Function(String message, String? devLogs) locationUpdate,
  }) {
    return locationUpdate(message, devLogs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? devLogs)? dataSourceException,
    TResult? Function(String message, String? devLogs)? customClaimsException,
    TResult? Function(String message, String? devLogs)? cacheException,
    TResult? Function(String message, String? devLogs)?
        locationPermissionRequest,
    TResult? Function(String message, String? devLogs)?
        locationPermissionNotGiven,
    TResult? Function(String message, String? devLogs)?
        locationServicesNotEnabled,
    TResult? Function(String message, String? devLogs)? locationUpdate,
  }) {
    return locationUpdate?.call(message, devLogs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? devLogs)? dataSourceException,
    TResult Function(String message, String? devLogs)? customClaimsException,
    TResult Function(String message, String? devLogs)? cacheException,
    TResult Function(String message, String? devLogs)?
        locationPermissionRequest,
    TResult Function(String message, String? devLogs)?
        locationPermissionNotGiven,
    TResult Function(String message, String? devLogs)?
        locationServicesNotEnabled,
    TResult Function(String message, String? devLogs)? locationUpdate,
    required TResult orElse(),
  }) {
    if (locationUpdate != null) {
      return locationUpdate(message, devLogs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataSourceException value) dataSourceException,
    required TResult Function(CustomClaimsException value)
        customClaimsException,
    required TResult Function(CacheException value) cacheException,
    required TResult Function(LocationPermissionRequestException value)
        locationPermissionRequest,
    required TResult Function(LocationPermissionNotGivenException value)
        locationPermissionNotGiven,
    required TResult Function(LocationServicesNotEnabledException value)
        locationServicesNotEnabled,
    required TResult Function(LocationUpdateException value) locationUpdate,
  }) {
    return locationUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataSourceException value)? dataSourceException,
    TResult? Function(CustomClaimsException value)? customClaimsException,
    TResult? Function(CacheException value)? cacheException,
    TResult? Function(LocationPermissionRequestException value)?
        locationPermissionRequest,
    TResult? Function(LocationPermissionNotGivenException value)?
        locationPermissionNotGiven,
    TResult? Function(LocationServicesNotEnabledException value)?
        locationServicesNotEnabled,
    TResult? Function(LocationUpdateException value)? locationUpdate,
  }) {
    return locationUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataSourceException value)? dataSourceException,
    TResult Function(CustomClaimsException value)? customClaimsException,
    TResult Function(CacheException value)? cacheException,
    TResult Function(LocationPermissionRequestException value)?
        locationPermissionRequest,
    TResult Function(LocationPermissionNotGivenException value)?
        locationPermissionNotGiven,
    TResult Function(LocationServicesNotEnabledException value)?
        locationServicesNotEnabled,
    TResult Function(LocationUpdateException value)? locationUpdate,
    required TResult orElse(),
  }) {
    if (locationUpdate != null) {
      return locationUpdate(this);
    }
    return orElse();
  }
}

abstract class LocationUpdateException implements Exceptions {
  const factory LocationUpdateException(final String message,
      [final String? devLogs]) = _$LocationUpdateException;

  @override
  String get message;
  @override
  String? get devLogs;
  @override
  @JsonKey(ignore: true)
  _$$LocationUpdateExceptionCopyWith<_$LocationUpdateException> get copyWith =>
      throw _privateConstructorUsedError;
}
