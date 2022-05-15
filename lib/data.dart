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

  User get currentUser {
    return _currentUser;
  }

  List<Chat> get getChatList {
    return _chatList;
  }

  List<ChatMessage> get getChatMessages {
    return _chatMessages;
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
