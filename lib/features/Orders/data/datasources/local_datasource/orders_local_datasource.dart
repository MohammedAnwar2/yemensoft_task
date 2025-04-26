import 'package:yemensoft_task/features/orders/data/models/delivery_bill_model.dart';

abstract class OrdersLocalDatasource {
  Future<void> create();
  Future<void> insert(List<OrderBillModel> bills);
  Future<void> clear();
  Future<List<OrderBillModel>> getOtherBills();
  Future<List<OrderBillModel>> getNewBills();
}