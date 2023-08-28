import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seniorcompanion/features/chat/cubit/chat_cubit.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/shared/widgets/custom_text.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom(
      {Key? key,
      required this.chatRoomID,
      required this.myID,
      required this.recipeintID,
      required this.recipeintName,
      required this.role})
      : super(key: key);
  final String chatRoomID;
  final String myID;
  final String recipeintID;
  final String recipeintName;
  final String role;

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  final CollectionReference chat =
      FirebaseFirestore.instance.collection('chat');
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  String message = '';
  final _controller = TextEditingController();
  // final ScrollController _scrollController = ScrollController();

  late final ScrollController _scrollController = ScrollController();

  bool sendButtonLoading = false;

  @override
  void initState() {
    userCollection.doc(widget.myID).update({
      'unreadMessages': false,
    });
    userCollection.doc(widget.recipeintID).update({
      'newMessageSent': false,
    });

    // _scrollController = ScrollController() //keepScrollOffset: false removed
    //   ..addListener(() {
    //     setState(() {
    //       _position = _scrollController.position;
    //     });
    //   });
    // BlocProvider.of<ChatCubit>(context)
    //     .createChat(myUid: widget.myID, partnerUid: widget.recipeintID);
    // BlocProvider.of<ChatCubit>(context)
    //     .getChatRoom(myUid: widget.myID, partnerUid: widget.recipeintID);
    // BlocProvider.of<ChatCubit>(context)
    //     .getChat(myUid: widget.myID, partnerUid: widget.recipeintID);

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ChatCubit>(context)
        .createChat(myUid: widget.myID, partnerUid: widget.recipeintID);
    BlocProvider.of<ChatCubit>(context)
        .getChatRoom(myUid: widget.myID, partnerUid: widget.recipeintID);
    BlocProvider.of<ChatCubit>(context)
        .getChat(myUid: widget.myID, partnerUid: widget.recipeintID);

    const snackBar = SnackBar(
      content: Text('User reported!'),
    );
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: widget.recipeintName.toUpperCase(),
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
        toolbarHeight: 80.0,
        actions: [
          IconButton(
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Report this user'),
                  content: const Text(
                      'If this user behave inappropriate you can report.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () async {
                        await FirebaseFirestore.instance
                            .collection("report")
                            .doc(widget.recipeintID)
                            .set({
                          "user_id": widget.recipeintID,
                          "reported_by": widget.myID,
                        });
                        Navigator.pop(context, 'Successfully Reported');
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: const Text('Report'),
                    ),
                  ],
                ),
              );
            },
            icon: Icon(Icons.report),
          ),
        ],
      ),
      body: BlocBuilder<ChatCubit, ChatState>(
        builder: (contextC, stateC) {
          // contextC
          //     .read<ChatCubit>()
          //     .createChat(myUid: widget.myID, partnerUid: widget.recipeintID);
          // contextC
          //     .read<ChatCubit>()
          //     .getChatRoom(myUid: widget.myID, partnerUid: widget.recipeintID);
          // contextC
          //     .read<ChatCubit>()
          //     .getChat(myUid: widget.myID, partnerUid: widget.recipeintID);
          // BlocProvider.of<ChatCubit>(context)
          //     .createChat(myUid: widget.myID, partnerUid: widget.recipeintID);
          // BlocProvider.of<ChatCubit>(context)
          //     .getChatRoom(myUid: widget.myID, partnerUid: widget.recipeintID);
          // BlocProvider.of<ChatCubit>(context)
          //     .getChat(myUid: widget.myID, partnerUid: widget.recipeintID);

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
                          height: MediaQuery.of(context).size.height * 0.75,
                          child: FutureBuilder(
                            future: stateC.chat,
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                // Timer(
                                //   const Duration(milliseconds: 1),
                                //   () => _scrollController.animateTo(
                                //       _scrollController
                                //           .position.maxScrollExtent,
                                //       duration:
                                //           const Duration(milliseconds: 500),
                                //       curve: Curves.ease),
                                // );
                                // final myMessages =
                                //     snapshot.data.docs.toList() ?? [];
                                List myMessages = snapshot.data.docs.toList()[0]
                                        [widget.myID] ??
                                    [];
                                List recipientMessages = snapshot.data.docs
                                        .toList()[0][widget.recipeintID] ??
                                    [];
                                myMessages.removeWhere(
                                    (element) => element['message'] == '');
                                recipientMessages.removeWhere(
                                    (element) => element['message'] == '');

                                List allMessages = List.from(myMessages)
                                  ..addAll(recipientMessages);
                                allMessages.sort((a, b) {
                                  int aTimestamp = a['timestamp'];
                                  int bTimestamp = b['timestamp'];

                                  return aTimestamp.compareTo(bTimestamp);
                                });
                                Timer(
                                  const Duration(milliseconds: 1),
                                  () => _scrollController.animateTo(
                                      _scrollController
                                          .position.maxScrollExtent,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.ease),
                                );

                                return ListView.builder(
                                  itemCount: allMessages.length,
                                  controller: _scrollController,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        allMessages[index]['sentBy'] ==
                                                widget.recipeintID
                                            ? Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  9.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  9.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  9.0),
                                                        ),
                                                        color:
                                                            widget.role == "CG"
                                                                ? mainOrange
                                                                : mainBlue),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        allMessages[index]
                                                                ['message']
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontSize: 20.0,
                                                            color: white),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  9.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  9.0),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  9.0),
                                                        ),
                                                        color:
                                                            widget.role == "CG"
                                                                ? mainBlue
                                                                : mainOrange),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        allMessages[index]
                                                                ['message']
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 20.0,
                                                            color: Colors
                                                                .grey[200]),
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
                            },
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.09,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.grey[200],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.75,
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  child: TextFormField(
                                    style:
                                        const TextStyle(color: mainFontColor),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(10),
                                      filled: true,
                                      fillColor: Colors.grey[200],
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: widget.role == "CG"
                                                ? mainBlue
                                                : mainOrange,
                                            width: 2.0,
                                            style: BorderStyle.solid),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: widget.role == "CG"
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  child: IconButton(
                                    icon: sendButtonLoading == true
                                        ? const CircularProgressIndicator(
                                            backgroundColor: mainOrange,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    mainBlue),
                                          )
                                        : Icon(
                                            Icons.send,
                                            color: widget.role == "CG"
                                                ? mainBlue
                                                : mainOrange,
                                            size: 30.0,
                                          ),
                                    onPressed: message != ''
                                        ? () {
                                            setState(() {
                                              sendButtonLoading = true;
                                            });

                                            context
                                                .read<ChatCubit>()
                                                .sendMessage(
                                                    myUid: widget.myID,
                                                    partnerUid:
                                                        widget.recipeintID,
                                                    message: message);

                                            Timer(
                                                const Duration(
                                                    milliseconds: 1000), () {
                                              _scrollController.animateTo(
                                                  _scrollController
                                                      .position.maxScrollExtent,
                                                  duration: const Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.ease);
                                              BlocProvider.of<ChatCubit>(
                                                      context)
                                                  .getChat(
                                                      myUid: widget.myID,
                                                      partnerUid:
                                                          widget.recipeintID);
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
      ),
    );
  }
}
