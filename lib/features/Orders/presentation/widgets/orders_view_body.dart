import 'package:flutter/material.dart';
import 'package:yemensoft_task/features/orders/presentation/widgets/delivery_info_header.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [DeliveryInfoHeader()]);
  }
}
