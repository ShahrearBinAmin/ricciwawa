class User {
  String userId;
  String name;
  String email;
  String userPhoto;
  User({
    required this.userId,
    required this.name,
    required this.email,
    required this.userPhoto,
  });

  User copyWith({
    String? userId,
    String? name,
    String? email,
    String? userPhoto,
  }) {
    return User(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      userPhoto: userPhoto ?? this.userPhoto,
    );
  }

  @override
  String toString() {
    return 'User(userId: $userId, name: $name, email: $email, userPhoto: $userPhoto)';
  }
}
