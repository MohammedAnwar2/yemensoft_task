import 'package:yemensoft_task/core/class/either_class.dart';
import 'package:yemensoft_task/core/error/failures.dart';
import '../entities/delivery_bill_entities.dart';
import '../repositories/order_repo.dart';


class GetNewBillsUsecase {
  final OrderRepository repository;

  GetNewBillsUsecase(this.repository);

  Future<Either<Failure, List<DeliveryBillEntity>>> call() async {
    return await repository.getNewBills();
  }
}
