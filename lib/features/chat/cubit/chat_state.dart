part of 'chat_cubit.dart';

class ChatState extends Equatable {
  const ChatState({
    this.myUid = "",
    this.partnerUid = "",
    this.isSucceded = false,
    this.errorMessage,
    this.chatStream,
    this.chatStreamRetrieved = false,
    this.chat,
    this.chatRetrieved = false,
    this.isSent = false,
  });

  final String myUid;
  final String partnerUid;
  final bool isSucceded;
  final String? errorMessage;
  final Stream<ChatRoomModel>? chatStream;
  final bool chatStreamRetrieved;
  final Future<QuerySnapshot<Object?>>? chat;
  final bool chatRetrieved;
  final bool isSent;

  @override
  List<Object?> get props => [
        myUid,
        partnerUid,
        isSucceded,
        chatStream,
        chatStreamRetrieved,
        chat,
        chatRetrieved,
        isSent,
      ];

  ChatState copyWith({
    String? myUid,
    String? partnerUid,
    bool? isSucceded,
    String? errorMessage,
    Stream<ChatRoomModel>? chatStream,
    bool? chatStreamRetrieved,
    Future<QuerySnapshot<Object?>>? chat,
    bool? chatRetrieved,
    bool? isSent,
  }) {
    return ChatState(
      myUid: myUid ?? this.myUid,
      partnerUid: partnerUid ?? this.partnerUid,
      isSucceded: isSucceded ?? this.isSucceded,
      errorMessage: errorMessage ?? this.errorMessage,
      chatStream: chatStream ?? this.chatStream,
      chatStreamRetrieved: chatStreamRetrieved ?? this.chatStreamRetrieved,
      chat: chat ?? this.chat,
      chatRetrieved: chatRetrieved ?? this.chatRetrieved,
      isSent: isSent ?? this.isSent,
    );
  }
}
