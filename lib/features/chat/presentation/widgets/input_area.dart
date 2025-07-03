import 'package:flutter/material.dart';
import 'package:my_chatroom/features/chat/data/message.dart';
import 'package:my_chatroom/features/chat/domain/messages_controller.dart';

class Inputarea extends StatelessWidget {
  final MessagesController msgController;
  final TextEditingController textController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  Inputarea(this.msgController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: textController,
            focusNode: focusNode,
            decoration: InputDecoration(hintText: "Type your message..."),
            keyboardType: TextInputType.multiline,
            minLines: 1, // Normal textInputField will be displayed
            maxLines: 5, // When user presses enter it will adapt to it

            onSubmitted: (value) =>
                handleMessage(textController, msgController, focusNode),
          ),
        ),
        const SizedBox(width: 8.0),
        FloatingActionButton(
          onPressed: () => {
            handleMessage(textController, msgController, focusNode),
          },
          child: Text("sendaa se"),
        ),
      ],
    );
  }
}

void handleMessage(
  TextEditingController textController,
  MessagesController msgController,
  FocusNode focusNode,
) {
  final message = textController.text;
  if (message.isNotEmpty) {
    msgController.addMessage(Message(message, "Test user name"));
    print('Message added: $message');
    textController.clear();
    focusNode.requestFocus();
  }
}
