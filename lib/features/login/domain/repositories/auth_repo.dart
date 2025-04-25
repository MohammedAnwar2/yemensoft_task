import 'package:yemensoft_task/core/class/either_class.dart';
import 'package:yemensoft_task/core/error/failures.dart';
import 'package:yemensoft_task/features/login/domain/entities/login_entities.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> login(LoginEntities loginEntities);
}
