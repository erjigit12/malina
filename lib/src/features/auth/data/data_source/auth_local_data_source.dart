import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<UserModel?> fetchUser(String email);
  Future<void> saveUser(UserModel user);
  Future<void> deleteUser(String email);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl(this._preferences);

  static const _usersKey = 'auth_users';

  final SharedPreferences _preferences;

  @override
  Future<UserModel?> fetchUser(String email) async {
    final users = await _readUsers();
    final data = users[email];
    if (data == null) {
      return null;
    }
    return UserModel.fromJson(Map<String, dynamic>.from(data as Map));
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
