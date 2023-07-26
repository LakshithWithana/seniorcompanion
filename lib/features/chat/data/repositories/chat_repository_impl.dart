import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:seniorcompanion/features/chat/data/data_provider/chat_data_provider.dart';
import 'package:seniorcompanion/features/chat/data/failures/chat_failures.dart';
import 'package:seniorcompanion/features/chat/data/repositories/chat_repository.dart';

import '../../../../core/models/chat_room_model/chat_room_model.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatDataProvider _chatDataProvider;

  ChatRepositoryImpl({required ChatDataProvider chatDataProvider})
      : _chatDataProvider = chatDataProvider;

  @override
  Future<Either<String, Unit>> createChat(
      {required String myUid, required String partnerUid}) async {
    try {
      await _chatDataProvider.createChat(myUid: myUid, partnerUid: partnerUid);
      return right(unit);
    } on ChatFailure catch (e) {
      return left(e.message);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, Stream<ChatRoomModel>>> getChatRoom({
    required String myUid,
    required String partnerUid,
  }) async {
    try {
      final result =
          _chatDataProvider.getChatRoom(myUid: myUid, partnerUid: partnerUid);

      return right(result);
    } on ChatFailure catch (e) {
      return left(e.message);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, Future<QuerySnapshot<Object?>>>> getChat({
    required String myUid,
    required String partnerUid,
  }) async {
    try {
      final result =
          _chatDataProvider.getChat(myUid: myUid, partnerUid: partnerUid);
      return right(result);
    } on ChatFailure catch (e) {
      return left(e.message);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> sendMessage(
      {required String myUid,
      required String partnerUid,
      required String message}) async {
    try {
      final result = await _chatDataProvider.sendMessage(
          myUid: myUid, partnerUid: partnerUid, message: message);
      return right(result);
    } on ChatFailure catch (e) {
      return left(e.message);
    } catch (e) {
      return left(e.toString());
    }
  }
}
