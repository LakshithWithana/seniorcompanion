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
    this.chatList,
    this.chatListRetrieved = false,
    this.singleChatPerson,
    this.singleChatPersonRetrieved = false,
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
  final Future<QuerySnapshot<Object?>>? chatList;
  final bool chatListRetrieved;
  final Future<QuerySnapshot<Object?>>? singleChatPerson;
  final bool singleChatPersonRetrieved;

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
        chatList,
        chatListRetrieved,
        singleChatPerson,
        singleChatPersonRetrieved,
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
    Future<QuerySnapshot<Object?>>? chatList,
    bool? chatListRetrieved,
    Future<QuerySnapshot<Object?>>? singleChatPerson,
    bool? singleChatPersonRetrieved,
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
      chatList: chatList ?? this.chatList,
      chatListRetrieved: chatListRetrieved ?? this.chatListRetrieved,
      singleChatPerson: singleChatPerson ?? this.singleChatPerson,
      singleChatPersonRetrieved:
          singleChatPersonRetrieved ?? this.singleChatPersonRetrieved,
    );
  }
}
