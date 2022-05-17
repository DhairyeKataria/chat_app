import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'models/chat_message.dart';
import 'models/chat_model.dart';
import 'models/user.dart';

enum MessageType {
  sender,
  receiver,
}

const storage = FlutterSecureStorage();

Future<bool> getLoggedInStatus() async {
  String? result;
  try {
    result = await storage.read(key: 'loggedIn');
  } catch (e) {
    result = null;
  }
  if (result == null) {
    return false;
  } else {
    return result.toLowerCase() == 'true';
  }
}

class Data extends ChangeNotifier {
  final List<Chat> _chatList = [];
  final List<ChatMessage> _chatMessages = [];
  late User _currentUser;
  bool? _isLoggedIn = null;
  String? _username;
  String? _password;

  Future<bool?> isLoggedIn() async {
    _isLoggedIn = await getLoggedInStatus();
    return _isLoggedIn;
  }

  Future setLoggedInStatus(bool value) async {
    _isLoggedIn = value;

    await storage.write(key: 'loggedIn', value: 'true');
    notifyListeners();
  }

  void storeUserCredentials(String username, String password) async {
    await storage.write(key: 'username', value: username);
    await storage.write(key: 'password', value: password);
    _username = username;
    _password = password;
    notifyListeners();
  }

  Future<String?> getUsername() async {
    return await storage.read(key: 'username');
  }

  Future<String?> getPassword() async {
    return await storage.read(key: 'password');
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
