import 'package:flutter/material.dart';
import 'package:my_chatroom/features/chat/data/message.dart';
import 'package:my_chatroom/features/chat/domain/messages_controller.dart';
import 'package:my_chatroom/features/user/domain/user_controller.dart';
import 'package:my_chatroom/main.dart';
import 'package:provider/provider.dart';

class Inputarea extends StatelessWidget {
  final MessagesController msgController;
  final TextEditingController textController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  Inputarea(this.msgController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          spacing: 20,
          children: [
            Text("Sending as ${Provider.of<UserController>(context).userName}"),
            ElevatedButton(
              child: Text("Change username", softWrap: false),
              onPressed: () => {modalBuilder(context)},
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: textController,
                focusNode: focusNode,
                decoration: InputDecoration(hintText: "Type your message..."),
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 5,

                onSubmitted: (value) => handleMessage(
                  textController,
                  msgController,
                  context,
                  focusNode,
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            ElevatedButton(
              onPressed: () => {
                handleMessage(
                  textController,
                  msgController,
                  context,
                  focusNode,
                ),
              },
              child: Text("sendaa se"),
            ),
          ],
        ),
      ],
    );
  }
}

void handleMessage(
  TextEditingController textController,
  MessagesController msgController,
  BuildContext context,
  FocusNode focusNode,
) {
  final message = textController.text;
  if (message.isNotEmpty) {
    msgController.addMessage(
      Message(
        message,
        Provider.of<UserController>(context, listen: false).userName,
      ),
    );
    textController.clear();
    focusNode.requestFocus();
  }
}
