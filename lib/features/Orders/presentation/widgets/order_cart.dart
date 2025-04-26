import 'package:flutter/material.dart';
import 'package:yemensoft_task/core/utils/app_colors.dart';
import 'package:yemensoft_task/core/utils/app_text_style.dart';
import 'package:yemensoft_task/core/utils/functions/filter_stauts.dart';
import 'package:yemensoft_task/features/orders/domain/entities/delivery_bill_entities.dart';
import 'package:yemensoft_task/features/orders/presentation/widgets/order_details_button.dart';

class OrderCard extends StatelessWidget {
  final DeliveryBillEntity deliveryBillEntity;
  const OrderCard({super.key, required this.deliveryBillEntity});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Container(
        padding: EdgeInsetsDirectional.only(start: 19),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "#${deliveryBillEntity.billSrl}",
                    style: AppTextStyle.medium12.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      _buildInfoColumn(
                        "Status",
                        deliveryBillEntity.status,
                        color: filterStatus(status: deliveryBillEntity.status),
                      ),
                      _verticalDivider(),
                      _buildInfoColumn(
                        "Total price",
                        deliveryBillEntity.totalPrice.toString(),
                        color: AppColors.black,
                      ),
                      _verticalDivider(),
                      _buildInfoColumn(
                        "Date",
                        deliveryBillEntity.billDate,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Order Details Button
            OrderDetailsButton(status: deliveryBillEntity.status),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoColumn(String title, String value, {required Color color}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: AppTextStyle.medium12),
          SizedBox(height: 4),
          FittedBox(
            child: Text(
              "$value ",
              style: AppTextStyle.semiBold16.copyWith(color: color),
            ),
          ),
        ],
      ),
    );
  }

  Widget _verticalDivider() {
    return Container(
      height: 40,
      width: 1,
      color: AppColors.lightGrey,
      margin: EdgeInsets.symmetric(horizontal: 8),
    );
  }
}
