class User {
  final String userId;
  final String name;
  final int age;
  final List<String> hobbies;

  User({
    required this.userId,
    required this.name,
    required this.age,
    required this.hobbies,
  });

  factory User.fromJson(Map<String, dynamic> data) {
    return User(
      userId: data['id'],
      name: data['name'],
      age: int.parse(data['age']),
      hobbies: List<String>.from(data['hobbies']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': userId,
      'name': name,
      'age': age.toString(),
      'hobbies': hobbies,
    };
  }
}
