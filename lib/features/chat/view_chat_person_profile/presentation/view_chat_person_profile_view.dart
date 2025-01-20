import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newseniiorcompaniion/core/models/user_details_model/user_details_model.dart';
import 'package:newseniiorcompaniion/features/chat/cubit/chat_cubit.dart';

import '../../../../app/bloc/app_bloc.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/shared/widgets/custom_text.dart';
import '../../../search/presentation/widgets/search_result_page/rating_stars.dart';

class ViewChatPersonProfileView extends StatelessWidget {
  const ViewChatPersonProfileView(
      {super.key, required this.chatUserId, required this.role});
  final String chatUserId;
  final String role;

  @override
  Widget build(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('User reported!'),
    );
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        context.read<ChatCubit>().getSingleChatPerson(userUid: chatUserId);
        return FutureBuilder(
          future: state.singleChatPerson,
          initialData: null,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              final chatUser = snapshot.data.docs.first.data() as dynamic;
              return Scaffold(
                appBar: AppBar(
                  shadowColor: Theme.of(context).shadowColor,
                  centerTitle: false,
                  title: CustomText(
                    text: "${chatUser["firstName"]} ${chatUser["lastName"]}",
                    fontSize: 22.0.sp,
                    fontWeight: FontWeight.w700,
                  ),
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
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  await FirebaseFirestore.instance
                                      .collection("report")
                                      .doc(chatUserId)
                                      .set({
                                    "user_id": chatUserId,
                                    "reported_by": "",
                                  });
                                  Navigator.pop(
                                      context, 'Successfully Reported');
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                child: const Text('Report'),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: const Icon(Icons.report),
                    ),
                  ],
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(),
                            ListTile(
                              contentPadding: const EdgeInsets.all(0),
                              leading: CircleAvatar(
                                radius: 30.0,
                                backgroundImage:
                                    NetworkImage(chatUser["profilePicURL"]),
                              ),
                              title: CustomText(
                                text:
                                    "${chatUser["firstName"]} ${chatUser["lastName"]}",
                                fontSize: 20.0.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CustomText(
                                        text: "${chatUser["age"]} Years - ",
                                        fontSize: 18.0.sp,
                                        color: secondaryFontColor,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      CustomText(
                                        text: chatUser["gender"].toUpperCase(),
                                        fontSize: 18.0.sp,
                                        color: secondaryFontColor,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CustomText(
                                        text: "${chatUser["rating"]}",
                                        fontSize: 16.0.sp,
                                      ),
                                      CustomText(
                                        text: "/5.0",
                                        fontSize: 14.0.sp,
                                        color: secondaryFontColor,
                                      ),
                                      const SizedBox(width: 10.0),
                                      RatingStars(
                                          ratingScroe: chatUser["rating"]),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(),
                            const SizedBox(height: 15.0),
                            CustomText(
                              text: "about".tr().toUpperCase(),
                              fontSize: 18.0.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            CustomText(
                              text: chatUser["about"],
                              fontSize: 16.0.sp,
                              textAlignment: TextAlign.justify,
                            ),
                            const SizedBox(height: 15.0),
                            CustomText(
                              text: "preferences".tr().toUpperCase(),
                              fontSize: 18.0.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(height: 10.0),
                            Wrap(
                              spacing: 10.0,
                              runSpacing: 10.0,
                              children:
                                  // [
                                  //   Text(chatUser["preferences"].toString())
                                  // ],

                                  chatUser["preferences"].map<Widget>((item) {
                                return Container(
                                  decoration: BoxDecoration(
                                      color:
                                          role == "CG" ? mainBlue : mainOrange,
                                      border: Border.all(
                                        color: (role == "CG"
                                            ? mainBlue
                                            : mainOrange),
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CustomText(
                                      text: item.toString(),
                                      fontSize: 18.0.sp,
                                      color: white,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Scaffold();
            }
          },
        );
      },
    );
  }
}
