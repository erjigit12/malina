import 'package:malina/src/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.email,
    required super.password,
    required super.failedAttempts,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
      failedAttempts: json['failedAttempts'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'failedAttempts': failedAttempts,
    };
  }

  @override
  UserModel copyWith({String? email, String? password, int? failedAttempts}) {
    return UserModel(
      email: email ?? this.email,
      password: password ?? this.password,
      failedAttempts: failedAttempts ?? this.failedAttempts,
    );
  }
}
