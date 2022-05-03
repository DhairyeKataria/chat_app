import 'package:chat_app/Screens/chat_details.dart';
import 'package:chat_app/models/chat_model.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const ChatTile({
    required this.text,
    required this.secondaryText,
    required this.image,
    required this.time,
    required this.isRead,
  });

  final String text;
  final String secondaryText;
  final String image;
  final String time;
  final bool isRead;

  @override
  State<ChatTile> createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  late Chat chat;

  @override
  void initState() {
    super.initState();
    chat = Chat(
      text: widget.text,
      secondaryText: widget.secondaryText,
      image: widget.image,
      time: widget.time,
      isRead: widget.isRead,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatDetail(chat)),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.image),
              maxRadius: 30.0,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.text),
                  const SizedBox(height: 6.0),
                  Text(
                    widget.secondaryText,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              widget.time,
              style: TextStyle(
                fontSize: 12.0,
                color: widget.isRead ? Colors.grey.shade500 : Colors.pink,
              ),
            )
          ],
        ),
      ),
    );
  }
}
