class User {
  const User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.isProfileImageSet,
    required this.profileImage,
    required this.contacts,
  });

  final String id;
  final String name;
  final String username;
  final String email;
  final bool isProfileImageSet;
  final String profileImage;
  final List contacts;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["_id"],
      name: json['name'],
      username: json["username"],
      email: json["email"],
      isProfileImageSet: json["isProfileImageSet"],
      profileImage: json["profileImage"],
      contacts: json["contacts"],
      // username: json['username'],
      // email: json['username'],
      // password: json['username'],
    );
  }
}
    // {
    //   "_id": "unique id",
    //   "name": "Dhairye Kataria",
    //   "username": "dhairyekataria",
    //   "email": "dhairyekataria24@gmail.com",
    //   "isProfileImageSet": true,
    //   "profileImage": "image data",
    //   "contacts": [],
    //   //Contacts contains the list of all "_id"'s to which the loggedIn user has sent messages to
    // }

