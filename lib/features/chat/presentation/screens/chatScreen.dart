import 'package:flutter/widgets.dart';
import 'package:my_chatroom/features/chat/domain/messagesController.dart';
import 'package:my_chatroom/features/chat/presentation/widgets/inputArea.dart';
import 'package:my_chatroom/features/chat/presentation/widgets/messagesArea.dart';

class Chatscreen extends StatelessWidget {
  final msgController = MessagesController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [Messagesarea(), Inputarea(msgController)]),
    );
  }
}
