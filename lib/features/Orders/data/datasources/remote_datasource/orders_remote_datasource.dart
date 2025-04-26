import 'package:dio/dio.dart';
import 'package:yemensoft_task/core/api/api_consumer.dart';
import 'package:yemensoft_task/core/api/end_ponits.dart';
import 'package:yemensoft_task/features/login/domain/entities/login_entities.dart';
import 'package:yemensoft_task/features/orders/data/models/delivery_bill_model.dart';

abstract class OrdersRemoteDatasource {
  Future<List<OrderBillModel>> fetchDeliveryBills(LoginEntities loginEntities);
}

class OrdersRemoteDatasourceImp extends OrdersRemoteDatasource {
  final ApiConsumer apiConsumer;

  OrdersRemoteDatasourceImp(this.apiConsumer);

  @override
  Future<List<OrderBillModel>> fetchDeliveryBills(
    LoginEntities loginEntities,
  ) async {
    final response = await apiConsumer.post(
      EndPoint.getDeliveryBills,
      data: OrderBillModel.toJson(loginEntities),
    );
    final List<dynamic> billsJson = response['Data']['DeliveryBills'];
    return billsJson.map((json) => OrderBillModel.fromJson(json)).toList();
  }
}
