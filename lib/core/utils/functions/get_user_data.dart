import 'dart:convert';

import 'package:yemensoft_task/core/services/database/shared_pref.dart';
import 'package:yemensoft_task/core/utils/app_key.dart';
import 'package:yemensoft_task/features/login/data/models/login_model.dart';
import 'package:yemensoft_task/features/login/domain/entities/login_entities.dart';

LoginEntities getUserData() {
  String? jsonData = SharedPref.getString(AppKey.userData);
  Map<String, dynamic> userJson = json.decode(jsonData!);
  LoginModel user = LoginModel.fromJson(userJson);
  return LoginModel.toLoginEntities(user);
}