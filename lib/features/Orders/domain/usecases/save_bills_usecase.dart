import '../../../../core/class/either_class.dart';
import '../../../../core/error/failures.dart';
import '../repositories/order_repo.dart';

class SaveBillsUsecase {
  final OrderRepository repository;

  SaveBillsUsecase(this.repository);

  Future<Either<Failure, void>> call() async {
    return await repository.saveBills();
  }
}
