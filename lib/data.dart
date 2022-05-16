import 'package:flutter/material.dart';
import 'models/chat_message.dart';
import 'models/chat_model.dart';
import 'models/user.dart';

enum MessageType {
  sender,
  receiver,
}

bool isLoggedIn = false;

class Data extends ChangeNotifier {
  final List<Chat> _chatList = [];
  final List<ChatMessage> _chatMessages = [];
  late User _currentUser;
  bool _justSignedUp = false;

  bool get justSignedUp {
    return _justSignedUp;
  }

  User get currentUser {
    return _currentUser;
  }

  List<Chat> get getChatList {
    return _chatList;
  }

  List<ChatMessage> get getChatMessages {
    return _chatMessages;
  }

  void setJustSignedUp(bool value) {
    _justSignedUp = value;
    notifyListeners();
  }

  void setCurrentUser(User user) {
    _currentUser = user;
    notifyListeners();
  }

  void addChatMessage(ChatMessage chatMessage) {
    _chatMessages.add(chatMessage);
    notifyListeners();
  }

  void setChatList(List<Chat> chats) {
    _chatList.clear();
    _chatList.addAll(chats);
    notifyListeners();
  }

  void setChatMessages(List<ChatMessage> chatMessages) {
    _chatMessages.clear();
    _chatMessages.addAll(chatMessages);
    notifyListeners();
  }
}
