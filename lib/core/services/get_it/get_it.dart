part of 'get_it_imports.dart';

final getIt = GetIt.instance;
Future<void> initializationGetIt() async {
  _initCoreDependencies();
  _initFeaturesDependencies();
}

void _initCoreDependencies() {
  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: Dio()));
  // final internetConnection = InternetConnectionChecker.instance;
  // getIt.registerLazySingleton<CheckNetworkConnection>(
  //   () => CheckNetworkConnectionImp(internetConnection),
  // );
}

void _initFeaturesDependencies() {
  _auth();
  _orders();
}

void _auth() {
  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(loginUsecase: getIt<LoginUsecase>()),
  );
  getIt.registerLazySingleton<LoginUsecase>(
    () => LoginUsecase(loginRepo: getIt<AuthRepoImp>()),
  );
  getIt.registerLazySingleton(
    () => AuthRepoImp(
      authLocalDataSource: getIt<AuthLocalDataSource>(),
      authRemoteDatasources: getIt<AuthRemoteDatasources>(),
    ),
  );
  getIt.registerLazySingleton<AuthRemoteDatasources>(
    () => AuthRemoteDatasourcesImp(apiConsumer: getIt<ApiConsumer>()),
  );
  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => SharedPrefrencesAuthRemoteDataSourceImpl(),
  );
}

void _orders() {
  getIt.registerFactory<OrdersCubit>(
    () => OrdersCubit(
      getNewBillsUsecase: getIt<GetNewBillsUsecase>(),
      getOtherBillsUsecase: getIt<GetOtherBillsUsecase>(),
      saveBillsUsecase: getIt<SaveBillsUsecase>(),
    ),
  );
  getIt.registerLazySingleton<GetNewBillsUsecase>(
    () => GetNewBillsUsecase(getIt<OrderRepositoryImp>()),
  );
  getIt.registerLazySingleton<GetOtherBillsUsecase>(
    () => GetOtherBillsUsecase(getIt<OrderRepositoryImp>()),
  );
  getIt.registerLazySingleton<SaveBillsUsecase>(
    () => SaveBillsUsecase(getIt<OrderRepositoryImp>()),
  );
  getIt.registerLazySingleton(
    () => OrderRepositoryImp(
      localDataSource: getIt<OrdersSharedPrefLocalDatasourceImp>(),
      remoteDataSource: getIt<OrdersRemoteDatasourceImp>(),
      // networkConnection: getIt<CheckNetworkConnection>(),
    ),
  );

  getIt.registerLazySingleton<OrdersSharedPrefLocalDatasourceImp>(
    () => OrdersSharedPrefLocalDatasourceImp.instance,
  );
  getIt.registerLazySingleton<OrdersRemoteDatasourceImp>(
    () => OrdersRemoteDatasourceImp(getIt<ApiConsumer>()),
  );
}
