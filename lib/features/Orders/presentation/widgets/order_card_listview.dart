import 'package:flutter/material.dart';
import 'package:yemensoft_task/features/orders/domain/entities/delivery_bill_entities.dart';
import 'package:yemensoft_task/features/orders/presentation/widgets/order_cart.dart';

class OrderCardListView extends StatelessWidget {
  const OrderCardListView({super.key, required this.deliveryBillEntities});
  final List<OrderBillEntity> deliveryBillEntities;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: deliveryBillEntities.length,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      itemBuilder: (BuildContext context, int index) {
        return OrderCard(
          deliveryBillEntity: deliveryBillEntities[index],
        );
      },
    );
  }
}
