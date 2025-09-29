import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:malina/src/features/auth/domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    @Default('') String email,
    @Default('') String password,
    @Default(0) int failedAttempts,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      email: entity.email,
      password: entity.password,
      failedAttempts: entity.failedAttempts,
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      email: email,
      password: password,
      failedAttempts: failedAttempts,
    );
  }
}
