
part of 'orders_cubit.dart';
abstract class OrdersState extends Equatable {
  const OrdersState();

  @override
  List<Object> get props => [];
}

class OrdersInitial extends OrdersState {}

class OrdersLoading extends OrdersState {}

class OrdersLoaded extends OrdersState {
  final List<OrderBillEntity> bills;
  const OrdersLoaded({required this.bills});

  @override
  List<Object> get props => [bills];
}

class OrdersError extends OrdersState {
  final String message;
  const OrdersError(this.message);

  @override
  List<Object> get props => [message];
}

class OrdersEmpty extends OrdersState {
  final String message;
  const OrdersEmpty(this.message);

  @override
  List<Object> get props => [message];
}

class OrdersSavedLocaly extends OrdersState {}
