// ignore_for_file: avoid_print
import 'package:accompani_bloc/features/inbox/presentation/widgets/chat_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        final chat = [35];

        final userId = chat.isNotEmpty
            ? chat.firstWhere(
                (userId) => userId != FirebaseAuth.instance.currentUser!.uid,
                orElse: () => 455565,
              )
            : 455565;

        return ChatTile(
          userId: 'tgfdnjhg',
          lastMessage: 'chat.lastMessage',
          lastMessageTs: DateTime.now(),
          chatroomId: 'hgghgfjnfgfr',
        );
      },
    );
  }
}
