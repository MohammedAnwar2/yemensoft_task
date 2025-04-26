import 'package:yemensoft_task/core/error/failures.dart';
import '../../../../core/class/either_class.dart';
import '../entities/delivery_bill_entities.dart';
import '../repositories/order_repo.dart';


class GetOtherBillsUsecase {
  final OrderRepository repository;

  GetOtherBillsUsecase(this.repository);

  Future<Either<Failure, List<DeliveryBillEntity>>> call() async {
    return await repository.getOtherBills();
  }
}
