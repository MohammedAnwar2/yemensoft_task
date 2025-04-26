import 'package:dio/dio.dart';
import 'package:yemensoft_task/core/api/api_consumer.dart';
import 'package:yemensoft_task/core/api/end_ponits.dart';
import 'package:yemensoft_task/features/orders/data/models/delivery_bill_model.dart';

abstract class OrdersRemoteDatasource {
  Future<List<OrderBillModel>> fetchDeliveryBills(
    String deliveryNo,
    String langNo,
  );
}

class OrdersRemoteDatasourceImp extends OrdersRemoteDatasource {
  final ApiConsumer apiConsumer;

  OrdersRemoteDatasourceImp(this.apiConsumer);

  @override
  Future<List<OrderBillModel>> fetchDeliveryBills(
    String deliveryNo,
    String langNo,
  ) async {
    final response = await apiConsumer.post(
      EndPoint.getDeliveryBills,
      data: {
        "Value": {
          "P_DLVRY_NO": deliveryNo,
          "P_LANG_NO": langNo,
          "P_BILL_SRL": "",
          "P_PRCSSD_FLG": "",
        },
      },
    );

    final data = response['Data'];
    final List<dynamic> billsJson = data['DeliveryBills'];
    return billsJson.map((json) => OrderBillModel.fromJson(json)).toList();
  }
}
