import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemensoft_task/core/services/get_it/get_it_imports.dart';
import 'package:yemensoft_task/features/orders/presentation/cubit/orders_cubit/orders_cubit.dart';
import 'package:yemensoft_task/features/orders/presentation/widgets/orders_view_body.dart';

class OrdersView extends StatelessWidget {
  static const String routeName = '/';
  // static const String routeName = '/orders';
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<OrdersCubit>()..saveBills(),
        child: OrdersViewBody(),
      ),
    );
  }
}
