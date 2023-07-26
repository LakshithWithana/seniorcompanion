// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) {
  return _ChatModel.fromJson(json);
}

/// @nodoc
mixin _$ChatModel {
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'sentBy')
  String get sentBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'timestamp')
  int get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatModelCopyWith<ChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatModelCopyWith<$Res> {
  factory $ChatModelCopyWith(ChatModel value, $Res Function(ChatModel) then) =
      _$ChatModelCopyWithImpl<$Res, ChatModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'message') String message,
      @JsonKey(name: 'sentBy') String sentBy,
      @JsonKey(name: 'timestamp') int timestamp});
}

/// @nodoc
class _$ChatModelCopyWithImpl<$Res, $Val extends ChatModel>
    implements $ChatModelCopyWith<$Res> {
  _$ChatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? sentBy = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      sentBy: null == sentBy
          ? _value.sentBy
          : sentBy // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatModelCopyWith<$Res> implements $ChatModelCopyWith<$Res> {
  factory _$$_ChatModelCopyWith(
          _$_ChatModel value, $Res Function(_$_ChatModel) then) =
      __$$_ChatModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'message') String message,
      @JsonKey(name: 'sentBy') String sentBy,
      @JsonKey(name: 'timestamp') int timestamp});
}

/// @nodoc
class __$$_ChatModelCopyWithImpl<$Res>
    extends _$ChatModelCopyWithImpl<$Res, _$_ChatModel>
    implements _$$_ChatModelCopyWith<$Res> {
  __$$_ChatModelCopyWithImpl(
      _$_ChatModel _value, $Res Function(_$_ChatModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? sentBy = null,
    Object? timestamp = null,
  }) {
    return _then(_$_ChatModel(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      sentBy: null == sentBy
          ? _value.sentBy
          : sentBy // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatModel extends _ChatModel {
  const _$_ChatModel(
      {@JsonKey(name: 'message') required this.message,
      @JsonKey(name: 'sentBy') required this.sentBy,
      @JsonKey(name: 'timestamp') required this.timestamp})
      : super._();

  factory _$_ChatModel.fromJson(Map<String, dynamic> json) =>
      _$$_ChatModelFromJson(json);

  @override
  @JsonKey(name: 'message')
  final String message;
  @override
  @JsonKey(name: 'sentBy')
  final String sentBy;
  @override
  @JsonKey(name: 'timestamp')
  final int timestamp;

  @override
  String toString() {
    return 'ChatModel(message: $message, sentBy: $sentBy, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatModel &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.sentBy, sentBy) || other.sentBy == sentBy) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, sentBy, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatModelCopyWith<_$_ChatModel> get copyWith =>
      __$$_ChatModelCopyWithImpl<_$_ChatModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatModelToJson(
      this,
    );
  }
}

abstract class _ChatModel extends ChatModel {
  const factory _ChatModel(
      {@JsonKey(name: 'message') required final String message,
      @JsonKey(name: 'sentBy') required final String sentBy,
      @JsonKey(name: 'timestamp') required final int timestamp}) = _$_ChatModel;
  const _ChatModel._() : super._();

  factory _ChatModel.fromJson(Map<String, dynamic> json) =
      _$_ChatModel.fromJson;

  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'sentBy')
  String get sentBy;
  @override
  @JsonKey(name: 'timestamp')
  int get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$_ChatModelCopyWith<_$_ChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}
