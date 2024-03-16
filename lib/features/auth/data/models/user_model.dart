import 'package:clean_arch_application/core/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.uid,
    required super.name,
    required super.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json["uid"] ?? "",
      name: json["name"] ?? "",
      email: json["email"] ?? "",
    );
  }

  UserModel copyWith({
    String? uid,
    String? name,
    String? email,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }
}
