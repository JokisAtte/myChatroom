import 'package:flutter/material.dart';
import 'package:my_chatroom/features/chat/presentation/widgets/message_card.dart';
import 'package:provider/provider.dart';
import 'package:my_chatroom/features/chat/domain/messages_controller.dart';

class Messagesarea extends StatefulWidget {
  const Messagesarea({super.key});

  @override
  _MessagesareaState createState() => _MessagesareaState();
}

class _MessagesareaState extends State<Messagesarea> {
  final ScrollController _scrollController = ScrollController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final msgController = Provider.of<MessagesController>(context);
    msgController.addListener(() {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MessagesController>(
      builder: (context, msgController, child) {
        return Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: msgController.messages.length,
            itemBuilder: (context, index) {
              final message = msgController.messages[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: MessageCard(message),
              );
            },
          ),
        );
      },
    );
  }
}
