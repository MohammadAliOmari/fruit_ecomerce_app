import 'dart:convert';

import 'package:fruite_app/constants.dart';
import 'package:fruite_app/core/services/shared_preferences.dart';
import 'package:fruite_app/features/auth/data/models/user_model.dart';
import 'package:fruite_app/features/auth/domain/entites/user_entity.dart';

UserEntity getUser() {
  String jsonString = Prefs.getString(kUserName);
  var user = UserModel.fromJson(jsonDecode(jsonString));
  return user;
}
