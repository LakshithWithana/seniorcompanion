import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seniorcompanion/features/chat/single_person_chat/presentation/single_person_chat_view.dart';

import '../../../../core/service_locator/service_locator.dart';
import '../../cubit/chat_cubit.dart';
import '../../data/repositories/chat_repository.dart';

class SinglePersonChatPage extends StatelessWidget {
  const SinglePersonChatPage({
    super.key,
    required this.index,
    required this.myUid,
    required this.partnerUid,
  });
  final int index;
  final String myUid;
  final String partnerUid;

  static Page page(int index, String myUid, String partnerUid) =>
      MaterialPage<void>(
          child: SinglePersonChatPage(
        index: index,
        myUid: myUid,
        partnerUid: partnerUid,
      ));

  @override
  Widget build(BuildContext context) {
    return
        // SinglePersonChatView(
        //   index: index,
        //   myUid: myUid,
        //   partnerUid: partnerUid,
        // );
        MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) =>
              ChatCubit(chatRepository: locator<ChatRepository>()),
        ),
        // BlocProvider(
        //   create: (context) => SubjectBloc(),
        // ),
      ],
      child: SinglePersonChatView(
        index: index,
        myUid: myUid,
        partnerUid: partnerUid,
      ),
    );
  }
}
