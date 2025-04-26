import 'dart:convert';
import 'package:yemensoft_task/core/services/shared_pref.dart';
import 'package:yemensoft_task/core/utils/app_key.dart';
import 'package:yemensoft_task/features/login/data/models/login_model.dart';
import 'package:yemensoft_task/features/login/domain/entities/login_entities.dart';

abstract class AuthLocalDataSource {
  Future<void> saveUserData(LoginEntities user);
}

class SharedPrefrencesAuthRemoteDataSourceImpl implements AuthLocalDataSource {
  @override
  Future<void> saveUserData(LoginEntities user) async {
    Map<String, dynamic> userJson = LoginModel.fromEntity(user).toMap();
    String jsonData = json.encode(userJson);
    SharedPref.setString(AppKey.userData, jsonData);
  }
}
