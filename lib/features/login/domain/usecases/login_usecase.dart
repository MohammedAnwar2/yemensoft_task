import 'package:yemensoft_task/core/class/either_class.dart';
import 'package:yemensoft_task/core/error/failures.dart';
import 'package:yemensoft_task/features/login/domain/entities/login_entities.dart';
import 'package:yemensoft_task/features/login/domain/repositories/auth_repo.dart';

class LoginUsecase {
  final AuthRepo loginRepo;
  LoginUsecase({required this.loginRepo});
  Future<Either<Failure, void>> call(LoginEntities loginEntities) async {
    return await loginRepo.login(loginEntities);
  }
}
