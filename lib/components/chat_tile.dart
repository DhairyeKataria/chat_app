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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'Chat Details');
        },
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.image),
              maxRadius: 30.0,
            ),
            const SizedBox(width: 16.0),
            Expanded(
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
