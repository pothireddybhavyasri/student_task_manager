class ApiUser {
  final int id;
  final String name;
  final String email;

  ApiUser({required this.id, required this.name, required this.email});

  factory ApiUser.fromJson(Map<String, dynamic> json) {
    return ApiUser(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}
