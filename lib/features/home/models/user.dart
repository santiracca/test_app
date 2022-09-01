class User {
  final String name;
  final int id;

  User({
    required this.name,
    required this.id,
  });

  factory User.fromJson(Map<String, dynamic> data) {
    return User(
      name: data['name'],
      id: data['id'],
    );
  }
}
