import 'models/chat_message.dart';
import 'models/chat_model.dart';

enum MessageType {
  sender,
  receiver,
}

String? currentUser;

bool isLoggedIn = false;

class Data {
  static List<ChatMessage> chatMessage = [
    ChatMessage(
      message: "Hi John",
      type: MessageType.receiver,
    ),
    ChatMessage(
      message: "Hope you are doin good",
      type: MessageType.receiver,
    ),
    ChatMessage(
      message: "Hello Jane, I'm good what about you",
      type: MessageType.sender,
    ),
    ChatMessage(
      message: "I'm fine, Working from home",
      type: MessageType.receiver,
    ),
    ChatMessage(
      message: "Oh! Nice. Same here man",
      type: MessageType.sender,
    ),
  ];

  static List<Chat> chatList = [
    Chat(
      text: 'Jane Russel',
      secondaryText: 'Awesome Setup',
      image: 'images/userImage1.jpeg',
      time: 'Now',
      isRead: false,
    ),
    Chat(
      text: 'Glad\'s Murphy',
      secondaryText: 'That\'s Great!!',
      image: 'images/userImage2.jpeg',
      time: 'yesterday',
      isRead: true,
    ),
    Chat(
      text: 'Jorge Henry',
      secondaryText: 'Hey, Where are you ??',
      image: 'images/userImage3.jpeg',
      time: '5 Apr',
      isRead: true,
    ),
    Chat(
      text: 'Philip Fox',
      secondaryText: 'Busy!! Call me in 10',
      image: 'images/userImage4.jpeg',
      time: '1 Apr',
      isRead: true,
    ),
    Chat(
      text: 'Debra Hawkings',
      secondaryText: 'Thank you, It\'s awesome',
      image: 'images/userImage5.jpeg',
      time: ' 1 Apr',
      isRead: true,
    ),
    Chat(
      text: 'Jacob Pena',
      secondaryText: 'will update you in the evening',
      image: 'images/userImage6.jpeg',
      time: '31 March',
      isRead: false,
    ),
    Chat(
      text: 'Andrey Jones',
      secondaryText: 'Can you please share the file',
      image: 'images/userImage7.jpeg',
      time: '20 March',
      isRead: true,
    ),
    Chat(
      text: 'John Wicks',
      secondaryText: 'How are you ??',
      image: 'images/userImage8.jpeg',
      time: '28 Feb',
      isRead: true,
    ),
  ];
}
