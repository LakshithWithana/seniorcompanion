import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seniorcompanion/app/bloc/app_bloc.dart';
import 'package:seniorcompanion/core/service_locator/service_locator.dart';
import 'package:seniorcompanion/features/chat/cubit/chat_cubit.dart';
import 'package:seniorcompanion/features/chat/data/repositories/chat_repository.dart';
import 'package:seniorcompanion/features/chat/single_person_chat/presentation/chatRoom.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/constants/colors.dart';
import '../../../core/shared/widgets/custom_text.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    _getChatRoomID(String a, String b) {
      if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
        return "${b}_$a";
      } else {
        return "${a}_$b";
      }
    }

    final ScrollController scrollController = ScrollController();

    return SingleChildScrollView(
      controller: scrollController,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0),
        child: BlocBuilder<AppBloc, AppState>(
          builder: (contextA, stateA) {
            return BlocBuilder<ChatCubit, ChatState>(
              builder: (contextC, stateC) {
                contextC.read<ChatCubit>().getChatList(myUid: stateA.user.uid);
                return FutureBuilder(
                  future: stateC.chatList,
                  builder: (BuildContext contextB, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                        height: 400.0,
                        child: ListView.builder(
                          itemCount: (snapshot.data.docs.first.data()
                                  as dynamic)['chatUserList']
                              .length,
                          itemBuilder: (BuildContext context, int index) {
                            // TODO: check this is why giving always first user details only!!!
                            // contextC.read<ChatCubit>().getSingleChatPerson(
                            //     userUid: (snapshot.data.docs.first.data()
                            //         as dynamic)['chatUserList'][index]);
                            return FutureBuilder(
                              future:
                                  // stateC.singleChatPerson,
                                  FirebaseFirestore.instance
                                      .collection("users")
                                      .where("uid",
                                          isEqualTo: (snapshot.data.docs.first
                                                      .data()
                                                  as dynamic)['chatUserList']
                                              [index])
                                      .get(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshotN) {
                                if (snapshotN.hasData) {
                                  return Card(
                                    color: Colors.white,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                        side: const BorderSide(color: black)),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => BlocProvider(
                                              create: (context) => ChatCubit(
                                                  chatRepository: locator<
                                                      ChatRepository>()),
                                              child: ChatRoom(
                                                chatRoomID: _getChatRoomID(
                                                    stateA.user.uid,
                                                    (snapshotN.data.docs.first
                                                            .data()
                                                        as dynamic)['uid']),
                                                myID: stateA.user.uid,
                                                recipeintID: (snapshot
                                                        .data.docs.first
                                                        .data() as dynamic)[
                                                    'chatUserList'][index],
                                                recipeintName: (snapshotN
                                                            .data.docs.first
                                                            .data() as dynamic)[
                                                        'firstName'] +
                                                    " " +
                                                    (snapshotN.data.docs.first
                                                            .data()
                                                        as dynamic)['lastName'],
                                                role: (snapshotN.data.docs.first
                                                    .data() as dynamic)['role'],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            radius: 35.0,
                                            backgroundImage: NetworkImage(
                                                (snapshotN
                                                        .data.docs.first
                                                        .data() as dynamic)[
                                                    'profilePicURL']),
                                          ),
                                          title: CustomText(
                                            text:
                                                "${(snapshotN.data.docs.first.data() as dynamic)['firstName']} ${(snapshotN.data.docs.first.data() as dynamic)['lastName']}",
                                            fontSize: 20.0.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  CustomText(
                                                    text:
                                                        "${(snapshotN.data.docs.first.data() as dynamic)['age']} Years - ",
                                                    fontSize: 18.0.sp,
                                                    color: secondaryFontColor,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                  CustomText(
                                                    text: (snapshotN
                                                                .data.docs.first
                                                                .data()
                                                            as dynamic)['gender']
                                                        .toUpperCase(),
                                                    fontSize: 18.0.sp,
                                                    color: secondaryFontColor,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ],
                                              ),
                                              // Row(
                                              //   children: [
                                              //     CustomText(
                                              //       text:
                                              //           "${(snapshotN.data.docs.first.data() as dynamic)['rating']}",
                                              //       fontSize: 16.0.sp,
                                              //     ),
                                              //     CustomText(
                                              //       text: "/5.0",
                                              //       fontSize: 14.0.sp,
                                              //       color: secondaryFontColor,
                                              //     ),
                                              //     const SizedBox(width: 10.0),
                                              //     RatingStars(
                                              //         ratingScroe: double.parse(
                                              //             (snapshotN.data.docs.first
                                              //                             .data()
                                              //                         as dynamic)[
                                              //                     'rating']
                                              //                 .toString())),
                                              //   ],
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Shimmer.fromColors(
                                    baseColor:
                                        secondaryFontColor.withOpacity(0.4),
                                    highlightColor: white,
                                    child: ListTile(
                                      leading: const CircleAvatar(
                                        radius: 35.0,
                                        backgroundColor: secondaryColor,
                                      ),
                                      title: Container(
                                        color: secondaryColor,
                                        width: 100.0,
                                        height: 20.0.sp,
                                      ),
                                      subtitle: Container(
                                        color: secondaryColor,
                                        width: 100.0,
                                        height: 18.0.sp,
                                      ),
                                    ),
                                  );
                                }
                              },
                            );
                          },
                        ),
                      );
                    } else {
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
                            height: 20.0.sp,
                          ),
                          subtitle: Container(
                            color: secondaryColor,
                            width: 100.0,
                            height: 18.0.sp,
                          ),
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
