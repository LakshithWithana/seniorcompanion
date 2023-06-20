// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Failure {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) dataSourceFailure,
    required TResult Function(String message) cacheFailure,
    required TResult Function(String message) customClaimsFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? dataSourceFailure,
    TResult? Function(String message)? cacheFailure,
    TResult? Function(String message)? customClaimsFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? dataSourceFailure,
    TResult Function(String message)? cacheFailure,
    TResult Function(String message)? customClaimsFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataSourceFailure value) dataSourceFailure,
    required TResult Function(CacheFailure value) cacheFailure,
    required TResult Function(CustomClaimsFailure value) customClaimsFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataSourceFailure value)? dataSourceFailure,
    TResult? Function(CacheFailure value)? cacheFailure,
    TResult? Function(CustomClaimsFailure value)? customClaimsFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataSourceFailure value)? dataSourceFailure,
    TResult Function(CacheFailure value)? cacheFailure,
    TResult Function(CustomClaimsFailure value)? customClaimsFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FailureCopyWith<Failure> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

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
abstract class _$$DataSourceFailureCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$DataSourceFailureCopyWith(
          _$DataSourceFailure value, $Res Function(_$DataSourceFailure) then) =
      __$$DataSourceFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$DataSourceFailureCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$DataSourceFailure>
    implements _$$DataSourceFailureCopyWith<$Res> {
  __$$DataSourceFailureCopyWithImpl(
      _$DataSourceFailure _value, $Res Function(_$DataSourceFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$DataSourceFailure(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DataSourceFailure implements DataSourceFailure {
  const _$DataSourceFailure(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.dataSourceFailure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataSourceFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataSourceFailureCopyWith<_$DataSourceFailure> get copyWith =>
      __$$DataSourceFailureCopyWithImpl<_$DataSourceFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) dataSourceFailure,
    required TResult Function(String message) cacheFailure,
    required TResult Function(String message) customClaimsFailure,
  }) {
    return dataSourceFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? dataSourceFailure,
    TResult? Function(String message)? cacheFailure,
    TResult? Function(String message)? customClaimsFailure,
  }) {
    return dataSourceFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? dataSourceFailure,
    TResult Function(String message)? cacheFailure,
    TResult Function(String message)? customClaimsFailure,
    required TResult orElse(),
  }) {
    if (dataSourceFailure != null) {
      return dataSourceFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataSourceFailure value) dataSourceFailure,
    required TResult Function(CacheFailure value) cacheFailure,
    required TResult Function(CustomClaimsFailure value) customClaimsFailure,
  }) {
    return dataSourceFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataSourceFailure value)? dataSourceFailure,
    TResult? Function(CacheFailure value)? cacheFailure,
    TResult? Function(CustomClaimsFailure value)? customClaimsFailure,
  }) {
    return dataSourceFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataSourceFailure value)? dataSourceFailure,
    TResult Function(CacheFailure value)? cacheFailure,
    TResult Function(CustomClaimsFailure value)? customClaimsFailure,
    required TResult orElse(),
  }) {
    if (dataSourceFailure != null) {
      return dataSourceFailure(this);
    }
    return orElse();
  }
}

abstract class DataSourceFailure implements Failure {
  const factory DataSourceFailure(final String message) = _$DataSourceFailure;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$DataSourceFailureCopyWith<_$DataSourceFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CacheFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$$CacheFailureCopyWith(
          _$CacheFailure value, $Res Function(_$CacheFailure) then) =
      __$$CacheFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$CacheFailureCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$CacheFailure>
    implements _$$CacheFailureCopyWith<$Res> {
  __$$CacheFailureCopyWithImpl(
      _$CacheFailure _value, $Res Function(_$CacheFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$CacheFailure(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CacheFailure implements CacheFailure {
  const _$CacheFailure(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.cacheFailure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CacheFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CacheFailureCopyWith<_$CacheFailure> get copyWith =>
      __$$CacheFailureCopyWithImpl<_$CacheFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) dataSourceFailure,
    required TResult Function(String message) cacheFailure,
    required TResult Function(String message) customClaimsFailure,
  }) {
    return cacheFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? dataSourceFailure,
    TResult? Function(String message)? cacheFailure,
    TResult? Function(String message)? customClaimsFailure,
  }) {
    return cacheFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? dataSourceFailure,
    TResult Function(String message)? cacheFailure,
    TResult Function(String message)? customClaimsFailure,
    required TResult orElse(),
  }) {
    if (cacheFailure != null) {
      return cacheFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataSourceFailure value) dataSourceFailure,
    required TResult Function(CacheFailure value) cacheFailure,
    required TResult Function(CustomClaimsFailure value) customClaimsFailure,
  }) {
    return cacheFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataSourceFailure value)? dataSourceFailure,
    TResult? Function(CacheFailure value)? cacheFailure,
    TResult? Function(CustomClaimsFailure value)? customClaimsFailure,
  }) {
    return cacheFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataSourceFailure value)? dataSourceFailure,
    TResult Function(CacheFailure value)? cacheFailure,
    TResult Function(CustomClaimsFailure value)? customClaimsFailure,
    required TResult orElse(),
  }) {
    if (cacheFailure != null) {
      return cacheFailure(this);
    }
    return orElse();
  }
}

abstract class CacheFailure implements Failure {
  const factory CacheFailure(final String message) = _$CacheFailure;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$CacheFailureCopyWith<_$CacheFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CustomClaimsFailureCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$CustomClaimsFailureCopyWith(_$CustomClaimsFailure value,
          $Res Function(_$CustomClaimsFailure) then) =
      __$$CustomClaimsFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$CustomClaimsFailureCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$CustomClaimsFailure>
    implements _$$CustomClaimsFailureCopyWith<$Res> {
  __$$CustomClaimsFailureCopyWithImpl(
      _$CustomClaimsFailure _value, $Res Function(_$CustomClaimsFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$CustomClaimsFailure(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CustomClaimsFailure implements CustomClaimsFailure {
  const _$CustomClaimsFailure(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.customClaimsFailure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomClaimsFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomClaimsFailureCopyWith<_$CustomClaimsFailure> get copyWith =>
      __$$CustomClaimsFailureCopyWithImpl<_$CustomClaimsFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) dataSourceFailure,
    required TResult Function(String message) cacheFailure,
    required TResult Function(String message) customClaimsFailure,
  }) {
    return customClaimsFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? dataSourceFailure,
    TResult? Function(String message)? cacheFailure,
    TResult? Function(String message)? customClaimsFailure,
  }) {
    return customClaimsFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? dataSourceFailure,
    TResult Function(String message)? cacheFailure,
    TResult Function(String message)? customClaimsFailure,
    required TResult orElse(),
  }) {
    if (customClaimsFailure != null) {
      return customClaimsFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataSourceFailure value) dataSourceFailure,
    required TResult Function(CacheFailure value) cacheFailure,
    required TResult Function(CustomClaimsFailure value) customClaimsFailure,
  }) {
    return customClaimsFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataSourceFailure value)? dataSourceFailure,
    TResult? Function(CacheFailure value)? cacheFailure,
    TResult? Function(CustomClaimsFailure value)? customClaimsFailure,
  }) {
    return customClaimsFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataSourceFailure value)? dataSourceFailure,
    TResult Function(CacheFailure value)? cacheFailure,
    TResult Function(CustomClaimsFailure value)? customClaimsFailure,
    required TResult orElse(),
  }) {
    if (customClaimsFailure != null) {
      return customClaimsFailure(this);
    }
    return orElse();
  }
}

abstract class CustomClaimsFailure implements Failure {
  const factory CustomClaimsFailure(final String message) =
      _$CustomClaimsFailure;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$CustomClaimsFailureCopyWith<_$CustomClaimsFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
