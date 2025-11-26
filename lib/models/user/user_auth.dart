import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_auth.freezed.dart';

@freezed
abstract class UserAuth with _$UserAuth {
  const factory UserAuth({
    required String id,
    required String name,
    required String email,
  }) = _UserAuth;

  factory UserAuth.fromJson(Map<String, dynamic> data) {
    return UserAuth(
      id: data['id'],
      name: data['name'],
      email: data['email'],
    );
  }
}
