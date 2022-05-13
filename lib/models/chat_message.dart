import 'package:chat_app/data.dart';
import 'package:chat_app/models/chat_model.dart';

class ChatMessage {
  ChatMessage({required this.message, required this.type});

  String message;
  MessageType type;

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      message: json['username'],
      type: json['username'],
    );
  }
}
