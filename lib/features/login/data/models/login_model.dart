import 'package:yemensoft_task/features/login/domain/entities/login_entities.dart';

class LoginModel {
  String? deliveryName;
  final String? delivryNO;
  final String? password;
  final String? lang;

  LoginModel({this.deliveryName, this.delivryNO, this.password, this.lang});

  Map<String, dynamic> toJson() {
    return {
      "Value": {
        "P_LANG_NO": lang,
        "P_DLVRY_NO": delivryNO,
        "P_PSSWRD": password,
      },
    };
  }

  factory LoginModel.fromEntity(LoginEntities loginEntities) {
    return LoginModel(
      deliveryName: loginEntities.deliveryName,
      delivryNO: loginEntities.delivryNO,
      password: loginEntities.password,
      lang: loginEntities.lang,
    );
  }
  factory LoginModel.result(String? deliveryName, LoginModel loginModel) {
    return LoginModel(
      deliveryName: deliveryName,
      delivryNO: loginModel.delivryNO,
      password: loginModel.password,
      lang: loginModel.lang,
    );
  }
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      deliveryName: json['deliveryName'],
      delivryNO: json['delivryNO'],
      password: json['password'],
      lang: json['lang'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'deliveryName': deliveryName,
      'delivryNO': delivryNO,
      'password': password,
      'lang': lang,
    };
  }

  static LoginEntities toLoginEntities(LoginModel loginModel) {
    return LoginEntities(
      deliveryName: loginModel.deliveryName,
      delivryNO: loginModel.delivryNO,
      password: loginModel.password,
      lang: loginModel.lang,
    );
  }
}
