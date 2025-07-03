class Message {
  String content;
  String senderName;
  //String senderId;
  DateTime timestamp;

  Message(this.content, this.senderName) : timestamp = DateTime.now();
}
