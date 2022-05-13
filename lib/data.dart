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
  final List<ChatMessage> _chatMessage = [];
  late User _currentUser;

  User get currentUser {
    return _currentUser;
  }

  List<Chat> get getChatList {
    return _chatList;
  }

  List<ChatMessage> get getChatMessages {
    return _chatMessage;
  }

  void setCurrentUser(User user) {
    _currentUser = user;
    notifyListeners();
  }

  void addChat(Chat chat) {
    _chatList.add(chat);
  }

  void setChatList(List<Chat> chat) {
    _chatList.clear();
    _chatList.addAll(chat);
    notifyListeners();
  }
}
