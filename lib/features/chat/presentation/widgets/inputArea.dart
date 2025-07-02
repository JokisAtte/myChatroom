import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_chatroom/features/chat/data/Message.dart';
import 'package:my_chatroom/features/chat/domain/messagesController.dart';

class Inputarea extends StatelessWidget {
  final MessagesController msgController;
  final TextEditingController textController =
      TextEditingController(); // Add a TextEditingController

  Inputarea(this.msgController);

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
    msgController.addMessage(Message(message));
    textController.clear();
  }
}
