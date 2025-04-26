import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yemensoft_task/features/orders/domain/entities/delivery_bill_entities.dart';
import 'package:yemensoft_task/features/orders/presentation/widgets/order_cart.dart';

class OrderCardListView extends StatelessWidget {
  const OrderCardListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 30,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        itemBuilder: (BuildContext context, int index) {
          return OrderCard(
            deliveryBillEntity: DeliveryBillEntity(
              billSrl: "1569987",
              billAmt: 150.0,
              dlvryAmt: 10,
              dlvryStatusFlg: Random().nextInt(3-0+1),
              taxAmt: 200,
              billDate: '2023-10-01',
            ),
          );
        },
      ),
    );
  }
}
