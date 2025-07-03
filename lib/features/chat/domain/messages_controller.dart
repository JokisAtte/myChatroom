import 'package:flutter/material.dart';
import 'package:my_chatroom/features/chat/data/message.dart';

class MessagesController extends ChangeNotifier {
  final List<Message> _messages = [];

  List<Message> get messages => _messages;

  void addMessage(Message message) {
    _messages.add(message);
    notifyListeners();
  }
}
