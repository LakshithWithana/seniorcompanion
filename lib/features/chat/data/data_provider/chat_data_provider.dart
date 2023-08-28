import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/models/chat_room_model/chat_room_model.dart';

abstract class ChatDataProvider {
  Future<Unit> createChat({
    required String myUid,
    required String partnerUid,
  });

  // Stream<FullChatModel> getChatStream({
  //   required String myUid,
  //   required String partnerUid,
  // });

  Stream<ChatRoomModel> getChatRoom({
    required String myUid,
    required String partnerUid,
  });

  Future<QuerySnapshot<Object?>> getChat({
    required String myUid,
    required String partnerUid,
  });

  Future<Unit> sendMessage({
    required String myUid,
    required String partnerUid,
    required String message,
  });

  Future<QuerySnapshot<Object?>> getChatList({
    required String myUid,
  });

  Future<QuerySnapshot<Object?>> getSingleChatPerson({
    required String userUid,
  });
}
