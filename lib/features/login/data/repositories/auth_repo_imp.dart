import 'package:yemensoft_task/core/class/either_class.dart';
import 'package:yemensoft_task/core/error/failures.dart';
import 'package:yemensoft_task/features/login/data/datasources/auth_local_datasource.dart';
import 'package:yemensoft_task/features/login/data/datasources/auth_remote_datasources.dart';
import 'package:yemensoft_task/features/login/data/models/login_model.dart';
import 'package:yemensoft_task/features/login/domain/entities/login_entities.dart';
import 'package:yemensoft_task/features/login/domain/repositories/auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  final AuthRemoteDatasources authRemoteDatasources;
  final AuthLocalDataSource authLocalDataSource;
  AuthRepoImp({
    required this.authRemoteDatasources,
    required this.authLocalDataSource,
  });
  @override
  Future<Either<Failure, void>> login(LoginEntities loginEntities) async {
    try {
      LoginModel loginModel = await authRemoteDatasources.login(
        loginModel: LoginModel.fromEntity(loginEntities),
      );

      await authLocalDataSource.saveUserData(
        LoginModel.toLoginEntities(loginModel),
      );
      return Either.right(null);
    } catch (e) {
      return Either.left(ServerFailure.handleException(e));
    }
  }
}
