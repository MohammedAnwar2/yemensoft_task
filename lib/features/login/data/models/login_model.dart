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
}
