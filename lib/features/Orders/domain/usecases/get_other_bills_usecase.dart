import 'package:yemensoft_task/core/class/either_class.dart';
import 'package:yemensoft_task/core/error/failures.dart';
import 'package:yemensoft_task/features/orders/domain/entities/delivery_bill_entities.dart';
import 'package:yemensoft_task/features/orders/domain/repositories/order_repo.dart';



class GetOtherBillsUsecase {
  final OrderRepository repository;

  GetOtherBillsUsecase(this.repository);

  Future<Either<Failure, List<OrderBillEntity>>> call() async {
    return await repository.getOtherBills();
  }
}
