import 'package:chat_app/Screens/chat_details.dart';
import 'package:chat_app/models/chat_model.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const ChatTile({
    required this.name,
    required this.username,
    required this.secondaryText,
    required this.image,
    required this.time,
    required this.isRead,
  });

  final String name;
  final String username;
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
  Widget build(BuildContext context) {
    chat = Chat(
      name: widget.name,
      username: widget.username,
      secondaryText: widget.secondaryText,
      image: widget.image,
      time: widget.time,
      isRead: widget.isRead,
    );

    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatDetail(chat)),
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 2.0, right: 2.0, top: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
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
                        Text(
                          widget.name,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 8.0),
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
            const SizedBox(
              height: 12.0,
            ),
            Container(
              color: Colors.grey.shade800,
              height: 0.2,
            ),
          ],
        ),
      ),
    );
  }
}
