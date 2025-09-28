import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<UserModel?> fetchUser(String email);
  Future<void> saveUser(UserModel user);
  Future<void> deleteUser(String email);
  Future<void> setCurrentUser(String email);
  Future<String?> getCurrentUserEmail();
  Future<void> clearCurrentUser();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl(this._preferences);

  static const _usersKey = 'auth_users';
  static const _currentUserKey = 'auth_current_user';

  final SharedPreferences _preferences;

  @override
  Future<UserModel?> fetchUser(String email) async {
    final users = await _readUsers();
    final data = users[email];
    if (data == null) {
      return null;
    }
    if (data is Map<String, dynamic>) {
      return UserModel.fromJson(data);
    }
    if (data is Map) {
      return UserModel.fromJson(Map<String, dynamic>.from(data));
    }
    return null;
  }

  @override
  Future<void> saveUser(UserModel user) async {
    final users = await _readUsers();
    users[user.email] = user.toJson();
    await _writeUsers(users);
  }

  @override
  Future<void> deleteUser(String email) async {
    final users = await _readUsers();
    users.remove(email);
    await _writeUsers(users);
    final current = await getCurrentUserEmail();
    if (current == email) {
      await clearCurrentUser();
    }
  }

  @override
  Future<void> setCurrentUser(String email) async {
    await _preferences.setString(_currentUserKey, email);
  }

  @override
  Future<String?> getCurrentUserEmail() async {
    final value = _preferences.getString(_currentUserKey);
    if (value == null || value.isEmpty) {
      return null;
    }
    return value;
  }

  @override
  Future<void> clearCurrentUser() async {
    await _preferences.remove(_currentUserKey);
  }

  Future<Map<String, dynamic>> _readUsers() async {
    final value = _preferences.getString(_usersKey);
    if (value == null || value.isEmpty) {
      return {};
    }
    try {
      final decoded = json.decode(value);
      if (decoded is Map<String, dynamic>) {
        return decoded;
      }
      return {};
    } catch (_) {
      return {};
    }
  }

  Future<void> _writeUsers(Map<String, dynamic> users) async {
    final encoded = json.encode(users);
    await _preferences.setString(_usersKey, encoded);
  }
}
