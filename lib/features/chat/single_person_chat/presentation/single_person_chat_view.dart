import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newseniiorcompaniion/app/bloc/app_bloc.dart';
import 'package:newseniiorcompaniion/core/constants/colors.dart';
import 'package:newseniiorcompaniion/features/chat/cubit/chat_cubit.dart';
import 'package:newseniiorcompaniion/features/search/cubit/search_cubit.dart';

import '../../../../core/shared/widgets/custom_text.dart';

class SinglePersonChatView extends StatefulWidget {
  const SinglePersonChatView({
    super.key,
    required this.index,
    required this.myUid,
    required this.partnerUid,
  });
  final int index;
  final String myUid;
  final String partnerUid;

  @override
  State<SinglePersonChatView> createState() => _SinglePersonChatViewState();
}

class _SinglePersonChatViewState extends State<SinglePersonChatView> {
  final CollectionReference chat =
      FirebaseFirestore.instance.collection('chat');
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  String message = '';
  final _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  bool sendButtonLoading = false;

  @override
  Widget build(BuildContext contextB) {
    BlocProvider.of<ChatCubit>(context)
        .createChat(myUid: widget.myUid, partnerUid: widget.partnerUid);
    BlocProvider.of<ChatCubit>(context)
        .getChatRoom(myUid: widget.myUid, partnerUid: widget.partnerUid);
    BlocProvider.of<ChatCubit>(context)
        .getChat(myUid: widget.myUid, partnerUid: widget.partnerUid);

    ///create chatroom ID by both chat participents
    _getChatRoomID(String a, String b) {
      if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
        return "${b}_$a";
      } else {
        return "${a}_$b";
      }
    }

    return Scaffold(
      appBar: AppBar(
        shadowColor: Theme.of(contextB).shadowColor,
        centerTitle: false,
        title: CustomText(
          text: "chat".tr().toUpperCase(),
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: BlocBuilder<AppBloc, AppState>(
        builder: (contextA, stateA) {
          return BlocBuilder<SearchCubit, SearchState>(
            builder: (contextS, stateS) {
              return BlocBuilder<ChatCubit, ChatState>(
                builder: (contextC, stateC) {
                  // contextC.read<ChatCubit>().createChat(
                  //     myUid: widget.myUid, partnerUid: widget.partnerUid);
                  // contextC.read<ChatCubit>().getChatRoom(
                  //     myUid: widget.myUid, partnerUid: widget.partnerUid);
                  // contextC.read<ChatCubit>().getChat(
                  //     myUid: widget.myUid, partnerUid: widget.partnerUid);
                  // context.read<ChatCubit>().retrieveChat(
                  //     myUid: stateA.user.uid,
                  //     partnerUid: stateS.searchResult![index].uid);
                  // return StreamBuilder(
                  //   stream: state.chatStream,
                  //   builder: (BuildContext context, AsyncSnapshot snapshot) {
                  //     if (snapshot.hasData) {
                  //       return Text(snapshot.data.toString());
                  //     } else {
                  //       return const SizedBox();
                  //     }
                  //   },
                  // );
                  return StreamBuilder<Object>(
                    stream: stateC.chatStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        // ChatRoomModel chatRoom = snapshot.data;
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.75,
                                  child: FutureBuilder(
                                    future: stateC.chat,
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      if (snapshot.hasData) {
                                        if (snapshot.data.docs
                                                .toList()
                                                .length !=
                                            0) {
                                          // final myMessages =
                                          //     snapshot.data.docs.toList() ?? [];
                                          List myMessages =
                                              snapshot.data.docs.toList()[0]
                                                      [stateA.user.uid] ??
                                                  [];
                                          List recipientMessages =
                                              snapshot.data.docs.toList()[0][
                                                      stateS
                                                          .searchResult![
                                                              widget.index]
                                                          .uid] ??
                                                  [];
                                          myMessages.removeWhere((element) =>
                                              element['message'] == '');
                                          recipientMessages.removeWhere(
                                              (element) =>
                                                  element['message'] == '');

                                          List allMessages =
                                              List.from(myMessages)
                                                ..addAll(recipientMessages);
                                          allMessages.sort((a, b) {
                                            int aTimestamp = a['timestamp'];
                                            int bTimestamp = b['timestamp'];

                                            return aTimestamp
                                                .compareTo(bTimestamp);
                                          });
                                          Timer(
                                              const Duration(milliseconds: 1),
                                              () => _scrollController.animateTo(
                                                  _scrollController
                                                      .position.maxScrollExtent,
                                                  duration: const Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.ease));
                                          print(allMessages.length);
                                          return ListView.builder(
                                            controller: _scrollController,
                                            itemCount: allMessages.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  allMessages[index]
                                                              ['sentBy'] ==
                                                          stateS
                                                              .searchResult![
                                                                  widget.index]
                                                              .uid
                                                      ? Row(
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(9.0),
                                                                        topRight:
                                                                            Radius.circular(9.0),
                                                                        bottomRight:
                                                                            Radius.circular(9.0),
                                                                      ),
                                                                      color: stateA.user.role ==
                                                                              "CG"
                                                                          ? mainOrange
                                                                          : mainBlue),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Text(
                                                                  allMessages[index]
                                                                          [
                                                                          'message']
                                                                      .toString(),
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          20.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      : Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(9.0),
                                                                        topRight:
                                                                            Radius.circular(9.0),
                                                                        bottomLeft:
                                                                            Radius.circular(9.0),
                                                                      ),
                                                                      color: stateA.user.role ==
                                                                              "CG"
                                                                          ? mainBlue
                                                                          : mainOrange),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Text(
                                                                  allMessages[index]
                                                                          [
                                                                          'message']
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20.0,
                                                                      color: Colors
                                                                              .grey[
                                                                          200]),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                  const SizedBox(height: 10.0),
                                                ],
                                              );
                                            },
                                          );
                                        } else {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        }
                                      } else {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                    },
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.09,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: Colors.grey[200],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.75,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.06,
                                          child: TextFormField(
                                            style: const TextStyle(
                                                color: mainFontColor),
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.all(10),
                                              filled: true,
                                              fillColor: Colors.grey[200],
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        stateA.user.role == "CG"
                                                            ? mainBlue
                                                            : mainOrange,
                                                    width: 2.0,
                                                    style: BorderStyle.solid),
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        stateA.user.role == "CG"
                                                            ? mainBlue
                                                            : mainOrange,
                                                    width: 2.0,
                                                    style: BorderStyle.solid),
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                            ),
                                            controller: _controller,
                                            onChanged: (value) {
                                              setState(() {
                                                message = value;
                                              });
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          child: IconButton(
                                            icon: sendButtonLoading == true
                                                ? const CircularProgressIndicator(
                                                    backgroundColor: mainOrange,
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(mainBlue),
                                                  )
                                                : Icon(
                                                    Icons.send,
                                                    color:
                                                        stateA.user.role == "CG"
                                                            ? mainBlue
                                                            : mainOrange,
                                                    size: 30.0,
                                                  ),
                                            onPressed: message != ''
                                                ? () async {
                                                    setState(() {
                                                      sendButtonLoading = true;
                                                    });
                                                    // await chat
                                                    //     .doc(_getChatRoomID(
                                                    //         stateA.user.uid,
                                                    //         stateS
                                                    //             .searchResult![
                                                    //                 widget.index]
                                                    //             .uid))
                                                    //     .update({
                                                    //   stateA.user.uid:
                                                    //       FieldValue.arrayRemove([
                                                    //     {
                                                    //       'message': '',
                                                    //       'timestamp': 0,
                                                    //       'sentBy':
                                                    //           stateA.user.uid,
                                                    //     }
                                                    //   ])
                                                    // });
                                                    // await chat
                                                    //     .doc(_getChatRoomID(
                                                    //         stateA.user.uid,
                                                    //         stateS
                                                    //             .searchResult![
                                                    //                 widget.index]
                                                    //             .uid))
                                                    //     .update({
                                                    //   stateA.user.uid:
                                                    //       FieldValue.arrayUnion([
                                                    //     {
                                                    //       'message': message,
                                                    //       'timestamp': DateTime
                                                    //               .now()
                                                    //           .microsecondsSinceEpoch,
                                                    //       'sentBy':
                                                    //           stateA.user.uid,
                                                    //     }
                                                    //   ])
                                                    // });
                                                    // await userCollection
                                                    //     .doc(stateS
                                                    //         .searchResult![
                                                    //             widget.index]
                                                    //         .uid)
                                                    //     .update({
                                                    //   'unreadMessages': true,
                                                    //   'chatUserList':
                                                    //       FieldValue.arrayRemove(
                                                    //           [stateA.user.uid]),
                                                    // });
                                                    // await userCollection
                                                    //     .doc(stateA.user.uid)
                                                    //     .update({
                                                    //   'newMessageSent': true,
                                                    //   'chatUserList':
                                                    //       FieldValue.arrayRemove([
                                                    //     stateS
                                                    //         .searchResult![
                                                    //             widget.index]
                                                    //         .uid
                                                    //   ]),
                                                    // });
                                                    // await userCollection
                                                    //     .doc(stateS
                                                    //         .searchResult![
                                                    //             widget.index]
                                                    //         .uid)
                                                    //     .update({
                                                    //   'chatUserList':
                                                    //       FieldValue.arrayUnion(
                                                    //           [stateA.user.uid]),
                                                    // });
                                                    // await userCollection
                                                    //     .doc(stateA.user.uid)
                                                    //     .update({
                                                    //   'chatUserList':
                                                    //       FieldValue.arrayUnion([
                                                    //     stateS
                                                    //         .searchResult![
                                                    //             widget.index]
                                                    //         .uid
                                                    //   ]),
                                                    // });
                                                    context
                                                        .read<ChatCubit>()
                                                        .sendMessage(
                                                            myUid:
                                                                stateA.user.uid,
                                                            partnerUid: stateS
                                                                .searchResult![
                                                                    widget
                                                                        .index]
                                                                .uid,
                                                            message: message);
                                                    Timer(
                                                        const Duration(
                                                            milliseconds: 1000),
                                                        () {
                                                      _scrollController.animateTo(
                                                          _scrollController
                                                              .position
                                                              .maxScrollExtent,
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      500),
                                                          curve: Curves.ease);
                                                      BlocProvider.of<
                                                                  ChatCubit>(
                                                              context)
                                                          .getChat(
                                                              myUid:
                                                                  widget.myUid,
                                                              partnerUid: widget
                                                                  .partnerUid);
                                                    });
                                                    _controller.clear();
                                                    message = '';
                                                    setState(() {
                                                      sendButtonLoading = false;
                                                    });
                                                  }
                                                : null,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

// class ChatService {
//   String? chatRoomID;
//   String? myID;
//   String? recipientID;
//   ChatService({this.chatRoomID, this.myID, this.recipientID});

//   //chat collection reference
//   final CollectionReference chat =
//       FirebaseFirestore.instance.collection('chat');

//   //chatRoom from snapshot
//   ChatRoomModel _chatRoomFromSnapshot(DocumentSnapshot snapshot) {
//     return ChatRoomModel(
//       chatRoomID: chatRoomID,
//       myID: (snapshot.data() as dynamic)[myID],
//       recipientID: (snapshot.data() as dynamic)[recipientID],
//     );
//   }

//   Stream<ChatRoomModel> get chatRoomDetails {
//     return chat.doc(chatRoomID).snapshots().map(_chatRoomFromSnapshot);
//   }
// }

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
