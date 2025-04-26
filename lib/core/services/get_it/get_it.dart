part of 'get_it_imports.dart';

final getIt = GetIt.instance;
Future<void> initializationGetIt() async {
  _initCoreDependencies();
  _initFeaturesDependencies();
}

void _initCoreDependencies() {
  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: Dio()));
}

void _initFeaturesDependencies() {
  _auth();
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
