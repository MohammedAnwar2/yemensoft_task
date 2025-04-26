import '../../../../core/class/either_class.dart';
import '../../../../core/error/failures.dart';
import '../entities/delivery_bill_entities.dart';
import '../repositories/order_repo.dart';

class SaveBills {
  final OrderRepository repository;

  SaveBills(this.repository);

  Future<Either<Failure, void>> call(List<DeliveryBillEntity> bills) async {
    return await repository.saveBills(bills);
  }
}
