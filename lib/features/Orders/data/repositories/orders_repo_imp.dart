import 'package:yemensoft_task/core/class/either_class.dart';
import 'package:yemensoft_task/core/error/exceptions.dart';
import 'package:yemensoft_task/core/error/failures.dart';
import 'package:yemensoft_task/core/utils/functions/get_user_data.dart';
import 'package:yemensoft_task/features/login/domain/entities/login_entities.dart';
import 'package:yemensoft_task/features/orders/data/models/delivery_bill_model.dart';
import 'package:yemensoft_task/features/orders/domain/entities/delivery_bill_entities.dart';
import 'package:yemensoft_task/features/orders/domain/repositories/order_repo.dart';
import '../datasources/local_datasource/orders_local_datasource.dart';
import '../datasources/remote_datasource/orders_remote_datasource.dart';

class OrderRepositoryImp implements OrderRepository {
  final OrdersRemoteDatasource remoteDataSource;
  final OrdersLocalDatasource localDataSource;

  OrderRepositoryImp({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<OrderBillEntity>>> getNewBills() async {
    try {
      List<OrderBillModel> localBills = await localDataSource.getNewBills();
      List<OrderBillEntity> orderBillEntity = [];
      mappingData(localBills, orderBillEntity);
      return Either.right(orderBillEntity);
    } on QueriesException catch (e) {
      return Either.left(QueriesFailure(e.errorMessage));
    } on EmptyCacheException catch (e) {
      return Either.left(EmptyCacheFailure(e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<OrderBillEntity>>> getOtherBills() async {
    try {
      List<OrderBillModel> localBills = await localDataSource.getOtherBills();
      List<OrderBillEntity> orderBillEntity = [];
      mappingData(localBills, orderBillEntity);
      return Either.right(orderBillEntity);
    } on QueriesException catch (e) {
      return Either.left(QueriesFailure(e.errorMessage));
    } on EmptyCacheException catch (e) {
      return Either.left(EmptyCacheFailure(e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> saveBills() async {
    try {
      LoginEntities loginEntities = getPrivateUserDate();
      List<OrderBillModel> bills = await remoteDataSource.fetchDeliveryBills(
        loginEntities,
      );
      localDataSource.clear();
      await localDataSource.insert(bills);
      return Either.right(null);
    } on QueriesException catch (e) {
      return Either.left(QueriesFailure(e.errorMessage));
    } catch (e) {
      return Either.left(ServerFailure.handleException(e));
    }
  }

  LoginEntities getPrivateUserDate() {
    LoginEntities loginEntities = getUserData();
    return loginEntities;
  }

  void mappingData(
    List<OrderBillModel> localBills,
    List<OrderBillEntity> orderBillEntity,
  ) {
    for (var bill in localBills) {
      orderBillEntity.add(OrderBillModel.toOrderBillEntities(bill));
    }
  }
}
