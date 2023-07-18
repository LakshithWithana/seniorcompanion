import 'package:flutter/material.dart';
import 'package:seniorcompanion/features/chat/single_person_chat/presentation/single_person_chat_view.dart';

class SinglePersonChatPage extends StatelessWidget {
  const SinglePersonChatPage({super.key});

  static Page page() => const MaterialPage<void>(child: SinglePersonChatPage());

  @override
  Widget build(BuildContext context) {
    return const SinglePersonChatView();
  }
}
