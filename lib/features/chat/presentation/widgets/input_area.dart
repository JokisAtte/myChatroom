import 'package:flutter/material.dart';
import 'package:my_chatroom/features/chat/data/message.dart';
import 'package:my_chatroom/features/chat/domain/messages_controller.dart';

class Inputarea extends StatelessWidget {
  final MessagesController msgController;
  final TextEditingController textController = TextEditingController();

  Inputarea(this.msgController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: textController,
            decoration: InputDecoration(hintText: "Type your message..."),
          ),
        ),
        const SizedBox(width: 8.0),
        FloatingActionButton(
          onPressed: () => {handleMessage(textController, msgController)},
          child: Text("sendaa se"),
        ),
      ],
    );
  }
}

void handleMessage(
  TextEditingController textController,
  MessagesController msgController,
) {
  final message = textController.text;
  if (message.isNotEmpty) {
    msgController.addMessage(Message(message, "Test user name"));
    print('Message added: $message');
    textController.clear();
  }
}
