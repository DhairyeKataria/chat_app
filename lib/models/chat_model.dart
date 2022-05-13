class Chat {
  Chat({
    required this.name,
    required this.secondaryText,
    required this.image,
    required this.time,
    required this.isRead,
  });

  final String name;
  final String secondaryText;
  final String image;
  final String time;
  final bool isRead;

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      name: json["name"],
      secondaryText: json["latest_msg"]["content"],
      time: json["latest_msg"]["time"],
      isRead: false,
      image: json["isProfileImageSet"] == false
          ? 'images/default.png'
          : json["profileImage"],
    );
  }
}
