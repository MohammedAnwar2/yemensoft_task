import 'package:flutter/material.dart';
import 'package:yemensoft_task/features/Orders/presentation/widgets/orders_view_body.dart';

class OrdersView extends StatelessWidget {
  static const String routeName = '/orders';
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const OrdersViewBody(),
    );
  }
}