import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newseniiorcompaniion/features/chat/view_chat_person_profile/presentation/view_chat_person_profile_view.dart';

import '../../../../core/service_locator/service_locator.dart';
import '../../cubit/chat_cubit.dart';
import '../../data/repositories/chat_repository.dart';

class ViewChatPersonProfilePage extends StatelessWidget {
  const ViewChatPersonProfilePage(
      {super.key, required this.chatUserId, required this.role});
  final String chatUserId;
  final String role;

  static Page page({required String chatUserId, required String role}) =>
      MaterialPage<void>(
          child: ViewChatPersonProfilePage(
        chatUserId: chatUserId,
        role: role,
      ));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(chatRepository: locator<ChatRepository>()),
      child: ViewChatPersonProfileView(
        chatUserId: chatUserId,
        role: role,
      ),
    );
  }
}
