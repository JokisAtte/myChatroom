import 'package:flutter/widgets.dart';
import 'package:my_chatroom/features/chat/domain/messages_controller.dart';
import 'package:my_chatroom/features/chat/presentation/widgets/input_area.dart';
import 'package:my_chatroom/features/chat/presentation/widgets/messages_area.dart';
import 'package:provider/provider.dart';

class Chatscreen extends StatelessWidget {
  const Chatscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final msgController = Provider.of<MessagesController>(context);

    return Center(
      child: Padding(
        padding: EdgeInsets.only(bottom: 40),
        child: Column(children: [Messagesarea(), Inputarea(msgController)]),
      ),
    );
  }
}
