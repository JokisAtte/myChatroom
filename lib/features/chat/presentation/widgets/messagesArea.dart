import 'package:flutter/widgets.dart';

class MessagesController {
  List<Text> messages = [Text("Moi"), Text("maailma")];

  void addMessage(String msg) {
    messages.add(Text(msg));
  }
}

class Messagesarea extends StatelessWidget {
  final msgController = MessagesController();

  @override
  Widget build(BuildContext context) {
    return Column(children: msgController.messages);
  }
}
