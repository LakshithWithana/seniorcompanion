import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/models/chat_room_model/chat_room_model.dart';

abstract class ChatRepository {
  Future<Either<String, Unit>> createChat({
    required String myUid,
    required String partnerUid,
  });

  Future<Either<String, Stream<ChatRoomModel>>> getChatRoom({
    required String myUid,
    required String partnerUid,
  });

  Future<Either<String, Future<QuerySnapshot<Object?>>>> getChat({
    required String myUid,
    required String partnerUid,
  });

  Future<Either<String, Unit>> sendMessage({
    required String myUid,
    required String partnerUid,
    required String message,
  });
}
