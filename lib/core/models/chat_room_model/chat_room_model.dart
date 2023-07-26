import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_room_model.freezed.dart';
part 'chat_room_model.g.dart';

@freezed
class ChatRoomModel with _$ChatRoomModel {
  const factory ChatRoomModel({
    @JsonKey(name: 'chatRoomID') required String chatRoomID,
    @JsonKey(name: 'myID') required dynamic myID,
    @JsonKey(name: 'recipientID') required dynamic recipientID,
  }) = _ChatRoomModel;

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomModelFromJson(json);

  const ChatRoomModel._();
  static const empty = ChatRoomModel(
    chatRoomID: "",
    myID: "",
    recipientID: "",
  );

  /// Convenience getter to determine whether the ChatRoomModel is empty.
  bool get isEmpty => this == ChatRoomModel.empty;

  /// Convenience getter to determine whether the ChatRoomModel is not empty.
  bool get isNotEmpty => this != ChatRoomModel.empty;
}

// class ChatRoomModel {
//   final String? chatRoomID;
//   final dynamic myID;
//   final dynamic recipientID;
//   ChatRoomModel({
//     this.chatRoomID,
//     this.myID,
//     this.recipientID,
//   });
// }