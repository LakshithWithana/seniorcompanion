import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:newseniiorcompaniion/core/constants/firebase_constants.dart';
import 'package:newseniiorcompaniion/core/models/chat_room_model/chat_room_model.dart';
import 'package:newseniiorcompaniion/features/chat/data/data_provider/chat_data_provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:newseniiorcompaniion/features/chat/data/failures/chat_failures.dart';

class ChatDataProviderImpl implements ChatDataProvider {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  ChatDataProviderImpl(
      {required firebase_auth.FirebaseAuth firebaseAuth,
      required FirebaseFirestore firebaseFirestore})
      : _firebaseAuth = firebaseAuth,
        _firebaseFirestore = firebaseFirestore;

  ///create chatroom ID by both chat participents
  _getChatRoomID(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "${b}_$a";
    } else {
      return "${a}_$b";
    }
  }

  //chat collection reference
  final CollectionReference chatCollection = FirebaseFirestore.instance
      .collection(FirebaseConstants.chatCollectionName);

  //user collection reference
  final CollectionReference userCollection = FirebaseFirestore.instance
      .collection(FirebaseConstants.usersCollectionName);

  @override
  Future<Unit> createChat(
      {required String myUid, required String partnerUid}) async {
    final Unit rResult;
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      final createChat = await _firebaseFirestore
          .collection(FirebaseConstants.chatCollectionName)
          .doc(_getChatRoomID(myUid, partnerUid))
          .get()
          .then((snapshot) async {
        if (!snapshot.exists) {
          await _firebaseFirestore
              .collection(FirebaseConstants.chatCollectionName)
              .doc(_getChatRoomID(myUid, partnerUid))
              .set({
                'chatID': _getChatRoomID(myUid, partnerUid),
                myUid: FieldValue.arrayUnion([
                  {
                    'message': '',
                    'timestamp': 0,
                    'sentBy': myUid,
                  }
                ]),
                partnerUid: FieldValue.arrayUnion([
                  {
                    'message': '',
                    'timestamp': 0,
                    'sentBy': partnerUid,
                  }
                ]),
              })
              .then((value) => unit)
              .onError((error, stackTrace) => throw const ChatFailure());
        }
        {
          getChatRoom(myUid: myUid, partnerUid: partnerUid);
        }
      });

      rResult = createChat;
    } else {
      throw const ChatFailure();
    }
    return rResult;
  }

  @override
  Stream<ChatRoomModel> getChatRoom({
    required String myUid,
    required String partnerUid,
  }) {
    //chatRoom from snapshot
    ChatRoomModel chatRoomFromSnapshot(DocumentSnapshot snapshot) {
      return ChatRoomModel(
        chatRoomID: _getChatRoomID(myUid, partnerUid),
        myID: myUid,
        recipientID: partnerUid,
      );
    }

    return chatCollection
        .doc(_getChatRoomID(myUid, partnerUid))
        .snapshots()
        .map(chatRoomFromSnapshot);
  }

  @override
  Future<QuerySnapshot<Object?>> getChat(
      {required String myUid, required String partnerUid}) {
    final result = chatCollection
        .where('chatID', isEqualTo: _getChatRoomID(myUid, partnerUid))
        .get();

    return result;
  }

  @override
  Future<Unit> sendMessage(
      {required String myUid,
      required String partnerUid,
      required String message}) async {
    await chatCollection.doc(_getChatRoomID(myUid, partnerUid)).update({
      myUid: FieldValue.arrayRemove([
        {
          'message': '',
          'timestamp': 0,
          'sentBy': myUid,
        }
      ])
    });
    await chatCollection.doc(_getChatRoomID(myUid, partnerUid)).update({
      myUid: FieldValue.arrayUnion([
        {
          'message': message,
          'timestamp': DateTime.now().microsecondsSinceEpoch,
          'sentBy': myUid,
        }
      ])
    });
    await userCollection.doc(partnerUid).update({
      'unreadMessages': true,
      // 'chatUserList': FieldValue.arrayRemove([myUid]),
    });
    await userCollection.doc(myUid).update({
      'newMessageSent': true,
      // 'chatUserList': FieldValue.arrayRemove([partnerUid]),
    });
    await userCollection.doc(partnerUid).update({
      'chatUserList': FieldValue.arrayUnion([myUid]),
    });
    await userCollection.doc(myUid).update({
      'chatUserList': FieldValue.arrayUnion([partnerUid]),
    });

    return unit;
  }

  @override
  Future<QuerySnapshot<Object?>> getChatList({required String myUid}) {
    return userCollection.where("uid", isEqualTo: myUid).get();
  }

  @override
  Future<QuerySnapshot<Object?>> getSingleChatPerson(
      {required String userUid}) {
    return userCollection.where("uid", isEqualTo: userUid).get();
  }
}
