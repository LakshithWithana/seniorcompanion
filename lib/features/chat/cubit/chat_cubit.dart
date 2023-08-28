import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:seniorcompanion/features/chat/data/repositories/chat_repository.dart';

import '../../../core/models/chat_room_model/chat_room_model.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepository _chatRepository;
  // StreamSubscription<ChatRoomModel>? _chatRoomModelStreamSubscription;
  ChatCubit({required ChatRepository chatRepository})
      : _chatRepository = chatRepository,
        super(const ChatState());

  Future<void> createChat(
      {required String myUid, required String partnerUid}) async {
    try {
      var result = await _chatRepository.createChat(
          myUid: myUid, partnerUid: partnerUid);

      result.fold((l) {
        if (!isClosed) {
          emit(state.copyWith(errorMessage: l, isSucceded: false));
        }
      }, (r) {
        if (!isClosed) {
          emit(state.copyWith(isSucceded: true));
        }
      });
    } catch (e) {
      if (!isClosed) {
        emit(state.copyWith(isSucceded: false));
      }
    }
  }

  Future<void> getChatRoom({
    required String myUid,
    required String partnerUid,
  }) async {
    try {
      var result = await _chatRepository.getChatRoom(
          myUid: myUid, partnerUid: partnerUid);

      result.fold((l) {
        if (!isClosed) {
          emit(state.copyWith(chatStreamRetrieved: false));
        }
      }, (r) {
        if (!isClosed) {
          emit(state.copyWith(chatStream: r, chatStreamRetrieved: true));
        }
      });
    } catch (e) {
      if (!isClosed) {
        emit(state.copyWith(chatStreamRetrieved: false));
      }
    }
  }

  Future<void> getChat({
    required String myUid,
    required String partnerUid,
  }) async {
    try {
      var result =
          await _chatRepository.getChat(myUid: myUid, partnerUid: partnerUid);

      result.fold((l) {
        if (!isClosed) {
          emit(state.copyWith(chatRetrieved: false));
        }
      }, (r) {
        if (!isClosed) {
          emit(state.copyWith(chatRetrieved: true, chat: r));
        }
      });
    } catch (e) {
      if (!isClosed) {
        emit(state.copyWith(chatRetrieved: false));
      }
    }
  }

  Future<void> sendMessage(
      {required String myUid,
      required String partnerUid,
      required String message}) async {
    try {
      var result = await _chatRepository.sendMessage(
          myUid: myUid, partnerUid: partnerUid, message: message);

      result.fold((l) {
        if (!isClosed) {
          emit(state.copyWith(errorMessage: l, isSent: false));
        }
      }, (r) {
        if (!isClosed) {
          emit(state.copyWith(isSent: true));
        }
      });
    } catch (e) {
      if (!isClosed) {
        emit(state.copyWith(isSent: false));
      }
    }
  }

  Future<void> getChatList({
    required String myUid,
  }) async {
    try {
      var result = await _chatRepository.getChatList(myUid: myUid);

      result.fold((l) {
        if (!isClosed) {
          emit(state.copyWith(chatListRetrieved: false));
        }
      }, (r) {
        if (!isClosed) {
          emit(state.copyWith(chatListRetrieved: true, chatList: r));
        }
      });
    } catch (e) {
      if (!isClosed) {
        emit(state.copyWith(chatListRetrieved: false));
      }
    }
  }

  Future<void> getSingleChatPerson({
    required String userUid,
  }) async {
    try {
      var result = await _chatRepository.getSingleChatPerson(userUid: userUid);

      result.fold((l) {
        if (!isClosed) {
          emit(state.copyWith(singleChatPersonRetrieved: false));
        }
      }, (r) {
        if (!isClosed) {
          emit(state.copyWith(
              singleChatPersonRetrieved: true, singleChatPerson: r));
        }
      });
    } catch (e) {
      if (!isClosed) {
        emit(state.copyWith(singleChatPersonRetrieved: false));
      }
    }
  }
}
