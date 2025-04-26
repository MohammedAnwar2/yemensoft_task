import 'package:yemensoft_task/core/class/either_class.dart';
import 'package:yemensoft_task/core/error/failures.dart';
import 'package:yemensoft_task/features/orders/domain/entities/delivery_bill_entities.dart';

abstract class OrderRepository {
  Future<Either<Failure, List<DeliveryBillEntity>>> getNewBills();
  Future<Either<Failure, List<DeliveryBillEntity>>> getOtherBills();
  Future<Either<Failure, void>> saveBills(List<DeliveryBillEntity> bills);
}
