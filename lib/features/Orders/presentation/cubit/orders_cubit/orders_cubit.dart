import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yemensoft_task/core/error/failures.dart';
import 'package:yemensoft_task/features/orders/domain/entities/delivery_bill_entities.dart';
import 'package:yemensoft_task/features/orders/domain/usecases/get_new_bills_usecase.dart';
import 'package:yemensoft_task/features/orders/domain/usecases/get_other_bills_usecase.dart';
import 'package:yemensoft_task/features/orders/domain/usecases/save_bills_usecase.dart';
part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final GetNewBillsUsecase getNewBillsUsecase;
  final GetOtherBillsUsecase getOtherBillsUsecase;
  final SaveBillsUsecase saveBillsUsecase;
  OrdersCubit({
    required this.getNewBillsUsecase,
    required this.getOtherBillsUsecase,
    required this.saveBillsUsecase,
  }) : super(OrdersInitial());
  Future<void> getNewBills() async {
    emit(OrdersLoading());
    final result = await getNewBillsUsecase.call();
    result.fold((failure) {
      if (failure is EmptyCacheFailure) {
        emit(OrdersEmpty(failure.errorMessage));
      } else {
        emit(OrdersError(failure.errorMessage));
      }
    }, (bills) => emit(OrdersLoaded(bills: bills)));
  }

  Future<void> getOtherBills() async {
    emit(OrdersLoading());
    final result = await getOtherBillsUsecase.call();
    result.fold((failure) {
      if (failure is EmptyCacheFailure) {
        emit(OrdersEmpty(failure.errorMessage));
      } else {
        emit(OrdersError(failure.errorMessage));
      }
    }, (bills) => emit(OrdersLoaded(bills: bills)));
  }

  Future<void> saveBills() async {
    emit(OrdersLoading());
    final result = await saveBillsUsecase.call();
    result.fold(
      (failure) => emit(OrdersError(failure.errorMessage)),
      (_) => emit(OrdersSavedLocaly()),
    );
  }
}
