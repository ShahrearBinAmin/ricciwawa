import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'userPhoto': userPhoto,
      'profileBanner': profileBanner,
      'userName': userName,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['userId'],
      name: map['name'],
      email: map['email'],
      userPhoto: map['userPhoto'],
      profileBanner: map['profileBanner'],
      userName: map['userName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.userId == userId &&
        other.name == name &&
        other.email == email &&
        other.userPhoto == userPhoto &&
        other.profileBanner == profileBanner &&
        other.userName == userName;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        name.hashCode ^
        email.hashCode ^
        userPhoto.hashCode ^
        profileBanner.hashCode ^
        userName.hashCode;
  }
}
