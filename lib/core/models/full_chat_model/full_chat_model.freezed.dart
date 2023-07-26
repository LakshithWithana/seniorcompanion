// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'full_chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FullChatModel _$FullChatModelFromJson(Map<String, dynamic> json) {
  return _FullChatModel.fromJson(json);
}

/// @nodoc
mixin _$FullChatModel {
  @JsonKey(name: 'myUid')
  Map<String, List<ChatModel>> get myUid => throw _privateConstructorUsedError;
  @JsonKey(name: 'partnerUid')
  Map<String, List<ChatModel>> get partnerUid =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'chatID')
  String get chatID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FullChatModelCopyWith<FullChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FullChatModelCopyWith<$Res> {
  factory $FullChatModelCopyWith(
          FullChatModel value, $Res Function(FullChatModel) then) =
      _$FullChatModelCopyWithImpl<$Res, FullChatModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'myUid') Map<String, List<ChatModel>> myUid,
      @JsonKey(name: 'partnerUid') Map<String, List<ChatModel>> partnerUid,
      @JsonKey(name: 'chatID') String chatID});
}

/// @nodoc
class _$FullChatModelCopyWithImpl<$Res, $Val extends FullChatModel>
    implements $FullChatModelCopyWith<$Res> {
  _$FullChatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myUid = null,
    Object? partnerUid = null,
    Object? chatID = null,
  }) {
    return _then(_value.copyWith(
      myUid: null == myUid
          ? _value.myUid
          : myUid // ignore: cast_nullable_to_non_nullable
              as Map<String, List<ChatModel>>,
      partnerUid: null == partnerUid
          ? _value.partnerUid
          : partnerUid // ignore: cast_nullable_to_non_nullable
              as Map<String, List<ChatModel>>,
      chatID: null == chatID
          ? _value.chatID
          : chatID // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FullChatModelCopyWith<$Res>
    implements $FullChatModelCopyWith<$Res> {
  factory _$$_FullChatModelCopyWith(
          _$_FullChatModel value, $Res Function(_$_FullChatModel) then) =
      __$$_FullChatModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'myUid') Map<String, List<ChatModel>> myUid,
      @JsonKey(name: 'partnerUid') Map<String, List<ChatModel>> partnerUid,
      @JsonKey(name: 'chatID') String chatID});
}

/// @nodoc
class __$$_FullChatModelCopyWithImpl<$Res>
    extends _$FullChatModelCopyWithImpl<$Res, _$_FullChatModel>
    implements _$$_FullChatModelCopyWith<$Res> {
  __$$_FullChatModelCopyWithImpl(
      _$_FullChatModel _value, $Res Function(_$_FullChatModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myUid = null,
    Object? partnerUid = null,
    Object? chatID = null,
  }) {
    return _then(_$_FullChatModel(
      myUid: null == myUid
          ? _value._myUid
          : myUid // ignore: cast_nullable_to_non_nullable
              as Map<String, List<ChatModel>>,
      partnerUid: null == partnerUid
          ? _value._partnerUid
          : partnerUid // ignore: cast_nullable_to_non_nullable
              as Map<String, List<ChatModel>>,
      chatID: null == chatID
          ? _value.chatID
          : chatID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FullChatModel extends _FullChatModel {
  _$_FullChatModel(
      {@JsonKey(name: 'myUid')
          required final Map<String, List<ChatModel>> myUid,
      @JsonKey(name: 'partnerUid')
          required final Map<String, List<ChatModel>> partnerUid,
      @JsonKey(name: 'chatID')
          required this.chatID})
      : _myUid = myUid,
        _partnerUid = partnerUid,
        super._();

  factory _$_FullChatModel.fromJson(Map<String, dynamic> json) =>
      _$$_FullChatModelFromJson(json);

  final Map<String, List<ChatModel>> _myUid;
  @override
  @JsonKey(name: 'myUid')
  Map<String, List<ChatModel>> get myUid {
    if (_myUid is EqualUnmodifiableMapView) return _myUid;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_myUid);
  }

  final Map<String, List<ChatModel>> _partnerUid;
  @override
  @JsonKey(name: 'partnerUid')
  Map<String, List<ChatModel>> get partnerUid {
    if (_partnerUid is EqualUnmodifiableMapView) return _partnerUid;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_partnerUid);
  }

  @override
  @JsonKey(name: 'chatID')
  final String chatID;

  @override
  String toString() {
    return 'FullChatModel(myUid: $myUid, partnerUid: $partnerUid, chatID: $chatID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FullChatModel &&
            const DeepCollectionEquality().equals(other._myUid, _myUid) &&
            const DeepCollectionEquality()
                .equals(other._partnerUid, _partnerUid) &&
            (identical(other.chatID, chatID) || other.chatID == chatID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_myUid),
      const DeepCollectionEquality().hash(_partnerUid),
      chatID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FullChatModelCopyWith<_$_FullChatModel> get copyWith =>
      __$$_FullChatModelCopyWithImpl<_$_FullChatModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FullChatModelToJson(
      this,
    );
  }
}

abstract class _FullChatModel extends FullChatModel {
  factory _FullChatModel(
      {@JsonKey(name: 'myUid')
          required final Map<String, List<ChatModel>> myUid,
      @JsonKey(name: 'partnerUid')
          required final Map<String, List<ChatModel>> partnerUid,
      @JsonKey(name: 'chatID')
          required final String chatID}) = _$_FullChatModel;
  _FullChatModel._() : super._();

  factory _FullChatModel.fromJson(Map<String, dynamic> json) =
      _$_FullChatModel.fromJson;

  @override
  @JsonKey(name: 'myUid')
  Map<String, List<ChatModel>> get myUid;
  @override
  @JsonKey(name: 'partnerUid')
  Map<String, List<ChatModel>> get partnerUid;
  @override
  @JsonKey(name: 'chatID')
  String get chatID;
  @override
  @JsonKey(ignore: true)
  _$$_FullChatModelCopyWith<_$_FullChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}
