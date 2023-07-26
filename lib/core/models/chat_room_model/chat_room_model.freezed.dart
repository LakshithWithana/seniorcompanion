// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_room_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatRoomModel _$ChatRoomModelFromJson(Map<String, dynamic> json) {
  return _ChatRoomModel.fromJson(json);
}

/// @nodoc
mixin _$ChatRoomModel {
  @JsonKey(name: 'chatRoomID')
  String get chatRoomID => throw _privateConstructorUsedError;
  @JsonKey(name: 'myID')
  dynamic get myID => throw _privateConstructorUsedError;
  @JsonKey(name: 'recipientID')
  dynamic get recipientID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatRoomModelCopyWith<ChatRoomModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomModelCopyWith<$Res> {
  factory $ChatRoomModelCopyWith(
          ChatRoomModel value, $Res Function(ChatRoomModel) then) =
      _$ChatRoomModelCopyWithImpl<$Res, ChatRoomModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'chatRoomID') String chatRoomID,
      @JsonKey(name: 'myID') dynamic myID,
      @JsonKey(name: 'recipientID') dynamic recipientID});
}

/// @nodoc
class _$ChatRoomModelCopyWithImpl<$Res, $Val extends ChatRoomModel>
    implements $ChatRoomModelCopyWith<$Res> {
  _$ChatRoomModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatRoomID = null,
    Object? myID = freezed,
    Object? recipientID = freezed,
  }) {
    return _then(_value.copyWith(
      chatRoomID: null == chatRoomID
          ? _value.chatRoomID
          : chatRoomID // ignore: cast_nullable_to_non_nullable
              as String,
      myID: freezed == myID
          ? _value.myID
          : myID // ignore: cast_nullable_to_non_nullable
              as dynamic,
      recipientID: freezed == recipientID
          ? _value.recipientID
          : recipientID // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatRoomModelCopyWith<$Res>
    implements $ChatRoomModelCopyWith<$Res> {
  factory _$$_ChatRoomModelCopyWith(
          _$_ChatRoomModel value, $Res Function(_$_ChatRoomModel) then) =
      __$$_ChatRoomModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'chatRoomID') String chatRoomID,
      @JsonKey(name: 'myID') dynamic myID,
      @JsonKey(name: 'recipientID') dynamic recipientID});
}

/// @nodoc
class __$$_ChatRoomModelCopyWithImpl<$Res>
    extends _$ChatRoomModelCopyWithImpl<$Res, _$_ChatRoomModel>
    implements _$$_ChatRoomModelCopyWith<$Res> {
  __$$_ChatRoomModelCopyWithImpl(
      _$_ChatRoomModel _value, $Res Function(_$_ChatRoomModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatRoomID = null,
    Object? myID = freezed,
    Object? recipientID = freezed,
  }) {
    return _then(_$_ChatRoomModel(
      chatRoomID: null == chatRoomID
          ? _value.chatRoomID
          : chatRoomID // ignore: cast_nullable_to_non_nullable
              as String,
      myID: freezed == myID
          ? _value.myID
          : myID // ignore: cast_nullable_to_non_nullable
              as dynamic,
      recipientID: freezed == recipientID
          ? _value.recipientID
          : recipientID // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatRoomModel extends _ChatRoomModel {
  const _$_ChatRoomModel(
      {@JsonKey(name: 'chatRoomID') required this.chatRoomID,
      @JsonKey(name: 'myID') required this.myID,
      @JsonKey(name: 'recipientID') required this.recipientID})
      : super._();

  factory _$_ChatRoomModel.fromJson(Map<String, dynamic> json) =>
      _$$_ChatRoomModelFromJson(json);

  @override
  @JsonKey(name: 'chatRoomID')
  final String chatRoomID;
  @override
  @JsonKey(name: 'myID')
  final dynamic myID;
  @override
  @JsonKey(name: 'recipientID')
  final dynamic recipientID;

  @override
  String toString() {
    return 'ChatRoomModel(chatRoomID: $chatRoomID, myID: $myID, recipientID: $recipientID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatRoomModel &&
            (identical(other.chatRoomID, chatRoomID) ||
                other.chatRoomID == chatRoomID) &&
            const DeepCollectionEquality().equals(other.myID, myID) &&
            const DeepCollectionEquality()
                .equals(other.recipientID, recipientID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      chatRoomID,
      const DeepCollectionEquality().hash(myID),
      const DeepCollectionEquality().hash(recipientID));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatRoomModelCopyWith<_$_ChatRoomModel> get copyWith =>
      __$$_ChatRoomModelCopyWithImpl<_$_ChatRoomModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatRoomModelToJson(
      this,
    );
  }
}

abstract class _ChatRoomModel extends ChatRoomModel {
  const factory _ChatRoomModel(
          {@JsonKey(name: 'chatRoomID') required final String chatRoomID,
          @JsonKey(name: 'myID') required final dynamic myID,
          @JsonKey(name: 'recipientID') required final dynamic recipientID}) =
      _$_ChatRoomModel;
  const _ChatRoomModel._() : super._();

  factory _ChatRoomModel.fromJson(Map<String, dynamic> json) =
      _$_ChatRoomModel.fromJson;

  @override
  @JsonKey(name: 'chatRoomID')
  String get chatRoomID;
  @override
  @JsonKey(name: 'myID')
  dynamic get myID;
  @override
  @JsonKey(name: 'recipientID')
  dynamic get recipientID;
  @override
  @JsonKey(ignore: true)
  _$$_ChatRoomModelCopyWith<_$_ChatRoomModel> get copyWith =>
      throw _privateConstructorUsedError;
}
