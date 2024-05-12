import 'package:accompani_bloc/core/constants/colors.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    super.key,
    required this.userId,
    required this.lastMessage,
    required this.lastMessageTs,
    required this.chatroomId,
  });

  final String userId;
  final String lastMessage;
  final DateTime lastMessageTs;
  final String chatroomId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 8.0,
      ),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: InkWell(
          onTap: () {
            //Get.to(() => ChatDetail(userId: userId,), arguments: user.firstName);
          },
          child: Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: tSecondaryColor,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'user.firstName,',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            lastMessage,
                            style: const TextStyle(color: tSecondaryColor),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Icon(Icons.arrow_right_outlined),
                        Text(
                          '${lastMessageTs.minute} min ago...',
                          style: const TextStyle(color: tSecondaryColor),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
