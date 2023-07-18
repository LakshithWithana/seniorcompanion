import 'package:flutter/material.dart';
import 'package:seniorcompanion/features/chat/presentation/chat_view.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  static Page page() => const MaterialPage<void>(child: ChatPage());

  @override
  Widget build(BuildContext context) {
    return const ChatView();
  }
}
