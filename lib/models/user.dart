class User {
  final int id;
  final String name;
  final String email;
  final String userType;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.userType,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0, // Default to 0 if id is missing
      name: json['name'] ?? 'Unknown',
      email: json['email'] ?? '',
      userType: json['user_type'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'user_type': userType,
    };
  }
}
