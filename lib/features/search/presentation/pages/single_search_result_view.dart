import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newseniiorcompaniion/app/bloc/app_bloc.dart';
import 'package:newseniiorcompaniion/features/chat/cubit/chat_cubit.dart';
import 'package:newseniiorcompaniion/features/search/cubit/search_cubit.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/shared/widgets/custom_elevated_buttons.dart';
import '../../../../core/shared/widgets/custom_text.dart';
import '../../../chat/data/repositories/chat_repository.dart';
import '../../../chat/single_person_chat/presentation/single_person_chat_page.dart';
import '../widgets/search_result_page/rating_stars.dart';

class SingleSearchResultView extends StatelessWidget {
  const SingleSearchResultView({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('User reported!'),
    );
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            shadowColor: Theme.of(context).shadowColor,
            centerTitle: false,
            title: CustomText(
              text:
                  "${state.searchResult![index].firstName} ${state.searchResult![index].lastName}",
              fontSize: 24.0,
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
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () async {
                            await FirebaseFirestore.instance
                                .collection("report")
                                .doc(state.searchResult![index].uid)
                                .set({
                              "user_id": state.searchResult![index].uid,
                              "reported_by": "",
                            });
                            Navigator.pop(context, 'Successfully Reported');
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
                      ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        leading: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: NetworkImage(
                              state.searchResult![index].profilePicURL),
                        ),
                        title: CustomText(
                          text:
                              "${state.searchResult![index].firstName} ${state.searchResult![index].lastName}",
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CustomText(
                                  text:
                                      "${state.searchResult![index].age} Years - ",
                                  fontSize: 18.0,
                                  color: secondaryFontColor,
                                  fontWeight: FontWeight.normal,
                                ),
                                CustomText(
                                  text: state.searchResult![index].gender
                                      .toUpperCase(),
                                  fontSize: 18.0,
                                  color: secondaryFontColor,
                                  fontWeight: FontWeight.normal,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                CustomText(
                                  text: "${state.searchResult![index].rating}",
                                  fontSize: 16.0,
                                ),
                                const CustomText(
                                  text: "/5.0",
                                  fontSize: 14.0,
                                  color: secondaryFontColor,
                                ),
                                const SizedBox(width: 10.0),
                                RatingStars(
                                    ratingScroe:
                                        state.searchResult![index].rating),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      CustomText(
                        text: "about".tr().toUpperCase(),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomText(
                        text: state.searchResult![index].about,
                        fontSize: 16.0,
                        textAlignment: TextAlign.justify,
                      ),
                      const SizedBox(height: 15.0),
                      CustomText(
                        text: "preferences".tr().toUpperCase(),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      Wrap(
                        spacing: 10.0,
                        runSpacing: 10.0,
                        children: state.searchResult![index].preferences
                            .map((String item) {
                          return BlocBuilder<AppBloc, AppState>(
                            builder: (contextP, stateP) {
                              return Container(
                                decoration: BoxDecoration(
                                    color: stateP.user.role == "CG"
                                        ? mainBlue
                                        : mainOrange,
                                    border: Border.all(
                                      color: (stateP.user.role == "CG"
                                          ? mainBlue
                                          : mainOrange),
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomText(
                                    text: item,
                                    fontSize: 18.0,
                                    color: white,
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 200),
                  BlocBuilder<AppBloc, AppState>(
                    builder: (contextP, stateP) {
                      return BlocProvider(
                        create: (context) => ChatCubit(
                            chatRepository: locator<ChatRepository>()),
                        child: Center(
                          child: CustomElevatedButton(
                            key: const Key(
                                "single_search_result_page_chat_button"),
                            backgroundColor: (stateP.user.role == "CG"
                                ? mainBlue
                                : mainOrange),
                            label: "chat".tr().toUpperCase(),
                            onPressed: () async {
                              // contextC.read<ChatCubit>().createChat(
                              //     myUid: stateP.user.uid,
                              //     partnerUid: state.searchResult![index].uid);
                              // contextC.read<ChatCubit>().getChatRoom(
                              //     myUid: stateP.user.uid,
                              //     partnerUid: state.searchResult![index].uid);
                              // contextC.read<ChatCubit>().getChat(
                              //     myUid: stateP.user.uid,
                              //     partnerUid: state.searchResult![index].uid);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => MultiBlocProvider(
                                    providers: [
                                      BlocProvider.value(
                                        value: BlocProvider.of<SearchCubit>(
                                            context),
                                      ),
                                      // BlocProvider.value(
                                      //   value:
                                      //       BlocProvider.of<ChatCubit>(contextC),
                                      // ),
                                    ],
                                    child: SinglePersonChatPage(
                                      index: index,
                                      myUid: stateP.user.uid,
                                      partnerUid:
                                          state.searchResult![index].uid,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
