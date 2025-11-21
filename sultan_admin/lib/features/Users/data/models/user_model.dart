class User {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String imageUrl;
  final String role;
  final String status;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.imageUrl,
    required this.role,
    required this.status,
  });

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? phoneNumber,
    String? imageUrl,
    String? role,
    String? status,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      imageUrl: imageUrl ?? this.imageUrl,
      role: role ?? this.role,
      status: status ?? this.status,
    );
  }
}
