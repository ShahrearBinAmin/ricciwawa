class User {
  String userId;
  String name;
  String email;
  String? userPhoto;
  String? profileBanner;
  String userName;
  User(
      {required this.userId,
      required this.name,
      required this.email,
      this.userPhoto,
      this.profileBanner,
      required this.userName});

  User copyWith(
      {String? userId,
      String? name,
      String? email,
      String? userPhoto,
      String? profileBanner,
      String? userName}) {
    return User(
        userId: userId ?? this.userId,
        name: name ?? this.name,
        email: email ?? this.email,
        userPhoto: userPhoto ?? this.userPhoto,
        profileBanner: profileBanner ?? this.profileBanner,
        userName: userName ?? this.userName);
  }

  @override
  String toString() {
    return 'User(userId: $userId, name: $name, email: $email, userPhoto: $userPhoto)';
  }
}
