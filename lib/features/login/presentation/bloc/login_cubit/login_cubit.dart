import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yemensoft_task/features/login/domain/entities/login_entities.dart';
import 'package:yemensoft_task/features/login/domain/usecases/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase loginUsecase;

  LoginCubit({required this.loginUsecase}) : super(LoginInitial());

  Future<void> login(LoginEntities loginEntities) async {
    emit(LoginLoading());
    final result = await loginUsecase.call(loginEntities);
    result.fold(
      (failure) => emit(LoginError(error: failure.errorMessage)),
      (success) => emit(LoginSuccess()),
    );
  }

}
