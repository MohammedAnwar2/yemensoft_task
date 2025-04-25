import 'package:yemensoft_task/core/api/api_consumer.dart';
import 'package:yemensoft_task/core/api/end_ponits.dart';
import 'package:yemensoft_task/core/error/exceptions.dart';
import 'package:yemensoft_task/features/login/data/models/login_model.dart';

abstract class AuthRemoteDatasources {
  Future<LoginModel> login({required LoginModel loginModel});
}

class AuthRemoteDatasourcesImp implements AuthRemoteDatasources {
  final ApiConsumer apiConsumer;
  AuthRemoteDatasourcesImp({required this.apiConsumer});
  @override
  Future<LoginModel> login({required LoginModel loginModel}) async {
    final response = await apiConsumer.post(
      EndPoint.checkDeliveryLogin,
      data: loginModel.toJson(),
    );
    Map<String, dynamic> data = response;
    String? deliveryName = data['Data']['DeliveryName'];
    if (deliveryName == null) {
      Object error = data['Result']['ErrMsg'];
      throw ServerException(error);
    }
    return LoginModel.result(deliveryName, loginModel);
  }
}
