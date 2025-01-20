import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newseniiorcompaniion/app/bloc/app_bloc.dart';
import 'package:newseniiorcompaniion/core/service_locator/service_locator.dart';
import 'package:newseniiorcompaniion/features/chat/cubit/chat_cubit.dart';
import 'package:newseniiorcompaniion/features/chat/data/repositories/chat_repository.dart';
import 'package:newseniiorcompaniion/features/chat/single_person_chat/presentation/chatRoom.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/constants/colors.dart';
import '../../../core/shared/widgets/custom_text.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final ScrollController scrollController = ScrollController();

  String _getChatRoomID(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "${b}_$a";
    } else {
      return "${a}_$b";
    }
  }

  @override
  void initState() {
    super.initState();
    // Get initial chat list
    final appState = context.read<AppBloc>().state;
    context.read<ChatCubit>().getChatList(myUid: appState.user.uid);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Widget _buildChatUserTile(BuildContext context, DocumentSnapshot userDoc,
      String myUid, String chatUserId) {
    final userData = userDoc.data() as Map<String, dynamic>;
    final String fullName = "${userData['firstName']} ${userData['lastName']}";

    return Card(
      color: Colors.white,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: const BorderSide(color: mainColor, width: 2.0)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) =>
                    ChatCubit(chatRepository: locator<ChatRepository>()),
                child: ChatRoom(
                  chatRoomID: _getChatRoomID(myUid, userData['uid']),
                  myID: myUid,
                  recipeintID: chatUserId,
                  recipeintName: fullName,
                  role: userData['role'],
                ),
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 35.0,
              backgroundImage: NetworkImage(userData['profilePicURL']),
            ),
            title: CustomText(
              text: fullName,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            subtitle: Row(
              children: [
                CustomText(
                  text: "${userData['age']} Years - ",
                  fontSize: 18.0,
                  color: secondaryFontColor,
                  fontWeight: FontWeight.normal,
                ),
                CustomText(
                  text: userData['gender'].toUpperCase(),
                  fontSize: 18.0,
                  color: secondaryFontColor,
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingTile() {
    return Shimmer.fromColors(
      baseColor: secondaryFontColor.withOpacity(0.4),
      highlightColor: white,
      child: ListTile(
        leading: const CircleAvatar(
          radius: 35.0,
          backgroundColor: secondaryColor,
        ),
        title: Container(
          color: secondaryColor,
          width: 100.0,
          height: 20.0,
        ),
        subtitle: Container(
          color: secondaryColor,
          width: 100.0,
          height: 18.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, appState) {
            return BlocBuilder<ChatCubit, ChatState>(
              builder: (context, chatState) {
                return FutureBuilder<QuerySnapshot>(
                  future: chatState.chatList,
                  builder: (context, chatListSnapshot) {
                    if (!chatListSnapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      final chatUserList =
                          (chatListSnapshot.data!.docs.first.data()
                              as Map<String, dynamic>)['chatUserList'] as List;
                      if (chatUserList.isEmpty) {
                        return const Center(
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              CustomText(
                                text: "No chats available",
                                fontSize: 14.0,
                                color: secondaryFontColor,
                              ),
                            ],
                          ),
                        );
                      }
                      return SizedBox(
                        height: 400.0,
                        child: ListView.builder(
                          itemCount: chatUserList.length,
                          itemBuilder: (context, index) {
                            return FutureBuilder<QuerySnapshot>(
                              future: FirebaseFirestore.instance
                                  .collection("users")
                                  .where("uid", isEqualTo: chatUserList[index])
                                  .get(),
                              builder: (context, userSnapshot) {
                                if (!userSnapshot.hasData) {
                                  return _buildLoadingTile();
                                } else if (userSnapshot.data!.docs.isEmpty) {
                                  return const Text("User not found");
                                } else {
                                  return _buildChatUserTile(
                                      context,
                                      userSnapshot.data!.docs.first,
                                      appState.user.uid,
                                      chatUserList[index]);
                                }
                              },
                            );
                          },
                        ),
                      );
                    }
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
