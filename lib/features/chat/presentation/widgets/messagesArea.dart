import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_chatroom/features/chat/domain/messagesController.dart';

class Messagesarea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MessagesController>(
      builder: (context, msgController, child) {
        return Expanded(
          // Constrain the height of ListView
          child: ListView.builder(
            itemCount: msgController.messages.length,
            itemBuilder: (context, index) {
              final message = msgController.messages[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(message.content),
              );
            },
          ),
        );
      },
    );
  }
}
