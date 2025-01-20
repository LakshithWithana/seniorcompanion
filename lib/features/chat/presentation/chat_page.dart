import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newseniiorcompaniion/features/chat/cubit/chat_cubit.dart';
import 'package:newseniiorcompaniion/features/chat/presentation/chat_view.dart';

import '../../../core/service_locator/service_locator.dart';
import '../data/repositories/chat_repository.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  static Page page() => const MaterialPage<void>(child: ChatPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(chatRepository: locator<ChatRepository>()),
      child: const ChatView(),
    );
  }
}
