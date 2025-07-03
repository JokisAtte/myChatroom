import 'package:flutter/material.dart';
import 'package:my_chatroom/features/chat/data/message.dart';

class MessageCard extends StatelessWidget {
  final Message message;

  const MessageCard(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Card(
        color: Theme.of(context).cardColor,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            top: 5,
            bottom: 5,
            right: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              SelectableText(
                message.senderName,
                style: textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              SelectableText(
                message.content,
                style: textTheme.labelLarge?.copyWith(fontSize: 16.0),
              ),
              SelectableText(
                formatTimestamp(message.timestamp),
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.black.withValues(alpha: 0.4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String formatTimestamp(DateTime timestamp) {
  if (timestamp.minute < 10) {
    return "${timestamp.hour}:0${timestamp.minute}";
  } else {
    return "${timestamp.hour}:${timestamp.minute}";
  }
}
