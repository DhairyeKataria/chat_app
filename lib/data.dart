import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'constants.dart';
import 'models/chat_message.dart';
import 'models/chat_model.dart';

enum MessageType {
  sender,
  receiver,
}

String? currentUser;

bool isLoggedIn = false;

class Data extends ChangeNotifier {
  final List<Chat> _chatList = [];
  final List<ChatMessage> _chatMessage = [];

  List<Chat> get getChatList {
    return _chatList;
  }

  List<ChatMessage> get getChatMessages {
    return _chatMessage;
  }

  // void fetchContacts() async { final response = await http.get(Uri.parse('$url/contacts/$currentUser'));
  //   for (int i = 0; i < response.body.length; i++) {
  //     _chatList.add(Chat.fromJson(jsonDecode(response.body)[i]));
  //   }
  //   print(_chatList);
  // }

  void addChat(Chat chat) {
    _chatList.add(chat);
  }

  void setChatList(List<Chat> chat) {
    _chatList.clear();
    _chatList.addAll(chat);
    notifyListeners();
  }
}

  // final List<ChatMessage> _chatMessage = [
  //   ChatMessage(
  //     message: "Hi John",
  //     type: MessageType.receiver,
  //   ),
  //   ChatMessage(
  //     message: "Hope you are doin good",
  //     type: MessageType.receiver,
  //   ),
  //   ChatMessage(
  //     message: "Hello Jane, I'm good what about you",
  //     type: MessageType.sender,
  //   ),
  //   ChatMessage(
  //     message: "I'm fine, Working from home",
  //     type: MessageType.receiver,
  //   ),
  //   ChatMessage(
  //     message: "Oh! Nice. Same here man",
  //     type: MessageType.sender,
  //   ),
  // ];

  // final List<Chat> _chatList = [
  //   Chat(
  //     name: 'Jane Russel',
  //     secondaryText: 'Awesome Setup',
  //     image: 'images/userImage1.jpeg',
  //     time: 'Now',
  //     isRead: false,
  //   ),
  //   Chat(
  //     name: 'Glad\'s Murphy',
  //     secondaryText: 'That\'s Great!!',
  //     image: 'images/userImage2.jpeg',
  //     time: 'yesterday',
  //     isRead: true,
  //   ),
  //   Chat(
  //     name: 'Jorge Henry',
  //     secondaryText: 'Hey, Where are you ??',
  //     image: 'images/userImage3.jpeg',
  //     time: '5 Apr',
  //     isRead: true,
  //   ),
  //   Chat(
  //     name: 'Philip Fox',
  //     secondaryText: 'Busy!! Call me in 10',
  //     image: 'images/userImage4.jpeg',
  //     time: '1 Apr',
  //     isRead: true,
  //   ),
  //   Chat(
  //     name: 'Debra Hawkings',
  //     secondaryText: 'Thank you, It\'s awesome',
  //     image: 'images/userImage5.jpeg',
  //     time: ' 1 Apr',
  //     isRead: true,
  //   ),
  //   Chat(
  //     name: 'Jacob Pena',
  //     secondaryText: 'will update you in the evening',
  //     image: 'images/userImage6.jpeg',
  //     time: '31 March',
  //     isRead: false,
  //   ),
  //   Chat(
  //     name: 'Andrey Jones',
  //     secondaryText: 'Can you please share the file',
  //     image: 'images/userImage7.jpeg',
  //     time: '20 March',
  //     isRead: true,
  //   ),
  //   Chat(
  //     name: 'John Wicks',
  //     secondaryText: 'How are you ??',
  //     image: 'images/userImage8.jpeg',
  //     time: '28 Feb',
  //     isRead: true,
  //   ),
  // ];