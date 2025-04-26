import 'package:yemensoft_task/core/class/either_class.dart';
import 'package:yemensoft_task/core/connection/check_network_connection.dart';
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
  // final CheckNetworkConnection networkConnection;

  OrderRepositoryImp({
    required this.remoteDataSource,
    required this.localDataSource,
    // required this.networkConnection,
  });

  @override
  Future<Either<Failure, List<OrderBillEntity>>> getNewBills() async {
    try {
      List<OrderBillModel> localBills = await localDataSource.getNewBills();
      print("localBills.length ============= ${localBills.length}");
      List<OrderBillEntity> orderBillEntity = [];
      mappingData(localBills, orderBillEntity);
      return Either.right(orderBillEntity);
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
    } on EmptyCacheException catch (e) {
      return Either.left(EmptyCacheFailure(e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> saveBills() async {
    try {
      // if (await networkConnection.isConnected) {
      LoginEntities loginEntities = getPrivateUserDate();
      List<OrderBillModel> bills = await remoteDataSource.fetchDeliveryBills(
        loginEntities,
      );
      print("bills.length ============= ${bills.length}");
      localDataSource.clear();
      await localDataSource.insert(bills);
      return Either.right(null);
      // } else {
      //   return Either.left(OfflineFailure('No internet connection'));
      // }
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
