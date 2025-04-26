import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:yemensoft_task/features/orders/domain/entities/delivery_bill_entities.dart';
import 'package:yemensoft_task/features/orders/presentation/widgets/order_cart.dart';

class OrderCardListView extends StatelessWidget {
  const OrderCardListView({super.key, required this.deliveryBillEntities});
  final List<OrderBillEntity> deliveryBillEntities;
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        itemCount: deliveryBillEntities.length,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 60.0,
              child: ScaleAnimation(
                scale: 0.8,
                child: FadeInAnimation(
                  child: OrderCard(
                    deliveryBillEntity: deliveryBillEntities[index],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
