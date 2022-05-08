class User {
  const User({
    required this.name,
    required this.username,
    required this.email,
    required this.password,
  });

  final String name;
  final String username;
  final String email;
  final String password;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      username: json['username'],
      email: json['username'],
      password: json['username'],
    );
  }
}
