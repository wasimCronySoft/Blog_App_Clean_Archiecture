import 'package:clean_arch_application/features/auth/domain/entities/user.dart';

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
}
