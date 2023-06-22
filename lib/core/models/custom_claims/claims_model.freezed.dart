// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'claims_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClaimsModel _$ClaimsModelFromJson(Map<String, dynamic> json) {
  return _ClaimsModel.fromJson(json);
}

/// @nodoc
mixin _$ClaimsModel {
  ///user ID of the user
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;

  ///The role of the user
  @JsonKey(name: 'role')
  String? get role => throw _privateConstructorUsedError;

  ///Full name of the user
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;

  ///Profile updated or not
  @JsonKey(name: 'profileUpdated')
  bool? get profileUpdated => throw _privateConstructorUsedError;
  @DateStampConverterForNull()
  @JsonKey(name: '_lastCommitted')
  DateStamp? get lastCommitted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClaimsModelCopyWith<ClaimsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClaimsModelCopyWith<$Res> {
  factory $ClaimsModelCopyWith(
          ClaimsModel value, $Res Function(ClaimsModel) then) =
      _$ClaimsModelCopyWithImpl<$Res, ClaimsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id')
          String userId,
      @JsonKey(name: 'role')
          String? role,
      @JsonKey(name: 'email')
          String? email,
      @JsonKey(name: 'profileUpdated')
          bool? profileUpdated,
      @DateStampConverterForNull()
      @JsonKey(name: '_lastCommitted')
          DateStamp? lastCommitted});
}

/// @nodoc
class _$ClaimsModelCopyWithImpl<$Res, $Val extends ClaimsModel>
    implements $ClaimsModelCopyWith<$Res> {
  _$ClaimsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? role = freezed,
    Object? email = freezed,
    Object? profileUpdated = freezed,
    Object? lastCommitted = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      profileUpdated: freezed == profileUpdated
          ? _value.profileUpdated
          : profileUpdated // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastCommitted: freezed == lastCommitted
          ? _value.lastCommitted
          : lastCommitted // ignore: cast_nullable_to_non_nullable
              as DateStamp?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ClaimsModelCopyWith<$Res>
    implements $ClaimsModelCopyWith<$Res> {
  factory _$$_ClaimsModelCopyWith(
          _$_ClaimsModel value, $Res Function(_$_ClaimsModel) then) =
      __$$_ClaimsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id')
          String userId,
      @JsonKey(name: 'role')
          String? role,
      @JsonKey(name: 'email')
          String? email,
      @JsonKey(name: 'profileUpdated')
          bool? profileUpdated,
      @DateStampConverterForNull()
      @JsonKey(name: '_lastCommitted')
          DateStamp? lastCommitted});
}

/// @nodoc
class __$$_ClaimsModelCopyWithImpl<$Res>
    extends _$ClaimsModelCopyWithImpl<$Res, _$_ClaimsModel>
    implements _$$_ClaimsModelCopyWith<$Res> {
  __$$_ClaimsModelCopyWithImpl(
      _$_ClaimsModel _value, $Res Function(_$_ClaimsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? role = freezed,
    Object? email = freezed,
    Object? profileUpdated = freezed,
    Object? lastCommitted = freezed,
  }) {
    return _then(_$_ClaimsModel(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      profileUpdated: freezed == profileUpdated
          ? _value.profileUpdated
          : profileUpdated // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastCommitted: freezed == lastCommitted
          ? _value.lastCommitted
          : lastCommitted // ignore: cast_nullable_to_non_nullable
              as DateStamp?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ClaimsModel extends _ClaimsModel {
  const _$_ClaimsModel(
      {@JsonKey(name: 'user_id')
          required this.userId,
      @JsonKey(name: 'role')
          this.role,
      @JsonKey(name: 'email')
          this.email,
      @JsonKey(name: 'profileUpdated')
          this.profileUpdated,
      @DateStampConverterForNull()
      @JsonKey(name: '_lastCommitted')
          this.lastCommitted})
      : super._();

  factory _$_ClaimsModel.fromJson(Map<String, dynamic> json) =>
      _$$_ClaimsModelFromJson(json);

  ///user ID of the user
  @override
  @JsonKey(name: 'user_id')
  final String userId;

  ///The role of the user
  @override
  @JsonKey(name: 'role')
  final String? role;

  ///Full name of the user
  @override
  @JsonKey(name: 'email')
  final String? email;

  ///Profile updated or not
  @override
  @JsonKey(name: 'profileUpdated')
  final bool? profileUpdated;
  @override
  @DateStampConverterForNull()
  @JsonKey(name: '_lastCommitted')
  final DateStamp? lastCommitted;

  @override
  String toString() {
    return 'ClaimsModel(userId: $userId, role: $role, email: $email, profileUpdated: $profileUpdated, lastCommitted: $lastCommitted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClaimsModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.profileUpdated, profileUpdated) ||
                other.profileUpdated == profileUpdated) &&
            (identical(other.lastCommitted, lastCommitted) ||
                other.lastCommitted == lastCommitted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, userId, role, email, profileUpdated, lastCommitted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClaimsModelCopyWith<_$_ClaimsModel> get copyWith =>
      __$$_ClaimsModelCopyWithImpl<_$_ClaimsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClaimsModelToJson(
      this,
    );
  }
}

abstract class _ClaimsModel extends ClaimsModel {
  const factory _ClaimsModel(
      {@JsonKey(name: 'user_id')
          required final String userId,
      @JsonKey(name: 'role')
          final String? role,
      @JsonKey(name: 'email')
          final String? email,
      @JsonKey(name: 'profileUpdated')
          final bool? profileUpdated,
      @DateStampConverterForNull()
      @JsonKey(name: '_lastCommitted')
          final DateStamp? lastCommitted}) = _$_ClaimsModel;
  const _ClaimsModel._() : super._();

  factory _ClaimsModel.fromJson(Map<String, dynamic> json) =
      _$_ClaimsModel.fromJson;

  @override

  ///user ID of the user
  @JsonKey(name: 'user_id')
  String get userId;
  @override

  ///The role of the user
  @JsonKey(name: 'role')
  String? get role;
  @override

  ///Full name of the user
  @JsonKey(name: 'email')
  String? get email;
  @override

  ///Profile updated or not
  @JsonKey(name: 'profileUpdated')
  bool? get profileUpdated;
  @override
  @DateStampConverterForNull()
  @JsonKey(name: '_lastCommitted')
  DateStamp? get lastCommitted;
  @override
  @JsonKey(ignore: true)
  _$$_ClaimsModelCopyWith<_$_ClaimsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
