// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sc_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SCUser {
  String get uid => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  bool get profileUpdated => throw _privateConstructorUsedError;
  bool get tmpBlock => throw _privateConstructorUsedError;
  bool get pmtBlock => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SCUserCopyWith<SCUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SCUserCopyWith<$Res> {
  factory $SCUserCopyWith(SCUser value, $Res Function(SCUser) then) =
      _$SCUserCopyWithImpl<$Res, SCUser>;
  @useResult
  $Res call(
      {String uid,
      String email,
      String role,
      bool profileUpdated,
      bool tmpBlock,
      bool pmtBlock});
}

/// @nodoc
class _$SCUserCopyWithImpl<$Res, $Val extends SCUser>
    implements $SCUserCopyWith<$Res> {
  _$SCUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? role = null,
    Object? profileUpdated = null,
    Object? tmpBlock = null,
    Object? pmtBlock = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      profileUpdated: null == profileUpdated
          ? _value.profileUpdated
          : profileUpdated // ignore: cast_nullable_to_non_nullable
              as bool,
      tmpBlock: null == tmpBlock
          ? _value.tmpBlock
          : tmpBlock // ignore: cast_nullable_to_non_nullable
              as bool,
      pmtBlock: null == pmtBlock
          ? _value.pmtBlock
          : pmtBlock // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SCUserCopyWith<$Res> implements $SCUserCopyWith<$Res> {
  factory _$$_SCUserCopyWith(_$_SCUser value, $Res Function(_$_SCUser) then) =
      __$$_SCUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String email,
      String role,
      bool profileUpdated,
      bool tmpBlock,
      bool pmtBlock});
}

/// @nodoc
class __$$_SCUserCopyWithImpl<$Res>
    extends _$SCUserCopyWithImpl<$Res, _$_SCUser>
    implements _$$_SCUserCopyWith<$Res> {
  __$$_SCUserCopyWithImpl(_$_SCUser _value, $Res Function(_$_SCUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? role = null,
    Object? profileUpdated = null,
    Object? tmpBlock = null,
    Object? pmtBlock = null,
  }) {
    return _then(_$_SCUser(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      profileUpdated: null == profileUpdated
          ? _value.profileUpdated
          : profileUpdated // ignore: cast_nullable_to_non_nullable
              as bool,
      tmpBlock: null == tmpBlock
          ? _value.tmpBlock
          : tmpBlock // ignore: cast_nullable_to_non_nullable
              as bool,
      pmtBlock: null == pmtBlock
          ? _value.pmtBlock
          : pmtBlock // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SCUser extends _SCUser {
  const _$_SCUser(
      {required this.uid,
      required this.email,
      required this.role,
      required this.profileUpdated,
      required this.tmpBlock,
      required this.pmtBlock})
      : super._();

  @override
  final String uid;
  @override
  final String email;
  @override
  final String role;
  @override
  final bool profileUpdated;
  @override
  final bool tmpBlock;
  @override
  final bool pmtBlock;

  @override
  String toString() {
    return 'SCUser(uid: $uid, email: $email, role: $role, profileUpdated: $profileUpdated, tmpBlock: $tmpBlock, pmtBlock: $pmtBlock)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SCUser &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.profileUpdated, profileUpdated) ||
                other.profileUpdated == profileUpdated) &&
            (identical(other.tmpBlock, tmpBlock) ||
                other.tmpBlock == tmpBlock) &&
            (identical(other.pmtBlock, pmtBlock) ||
                other.pmtBlock == pmtBlock));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, uid, email, role, profileUpdated, tmpBlock, pmtBlock);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SCUserCopyWith<_$_SCUser> get copyWith =>
      __$$_SCUserCopyWithImpl<_$_SCUser>(this, _$identity);
}

abstract class _SCUser extends SCUser {
  const factory _SCUser(
      {required final String uid,
      required final String email,
      required final String role,
      required final bool profileUpdated,
      required final bool tmpBlock,
      required final bool pmtBlock}) = _$_SCUser;
  const _SCUser._() : super._();

  @override
  String get uid;
  @override
  String get email;
  @override
  String get role;
  @override
  bool get profileUpdated;
  @override
  bool get tmpBlock;
  @override
  bool get pmtBlock;
  @override
  @JsonKey(ignore: true)
  _$$_SCUserCopyWith<_$_SCUser> get copyWith =>
      throw _privateConstructorUsedError;
}
