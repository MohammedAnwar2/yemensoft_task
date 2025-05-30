import 'package:flutter/material.dart';
import 'package:yemensoft_task/core/utils/app_colors.dart';
import 'package:yemensoft_task/core/utils/app_text_style.dart';
import 'package:yemensoft_task/core/utils/functions/filter_stauts.dart';
import 'package:yemensoft_task/features/localization/app_localizations.dart';
import 'package:yemensoft_task/features/orders/domain/entities/delivery_bill_entities.dart';
import 'package:yemensoft_task/features/orders/presentation/widgets/order_details_button.dart';

class OrderCard extends StatelessWidget {
  final OrderBillEntity deliveryBillEntity;
  const OrderCard({super.key, required this.deliveryBillEntity});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Container(
        padding: const EdgeInsetsDirectional.only(start: 19),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '#${deliveryBillEntity.billSrl}',
                    style: AppTextStyle.medium12.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _buildInfoColumn(
                        '14'.tr(context),
                        deliveryBillEntity.status(context),
                        color: filterStatus(
                          status: deliveryBillEntity.status(context),
                          context: context,
                        ),
                      ),
                      _verticalDivider(),
                      _buildInfoColumn(
                        '15'.tr(context),
                        formatPrice(deliveryBillEntity.totalPrice),
                        color: AppColors.black,
                      ),
                      _verticalDivider(),
                      _buildInfoColumn(
                        '16'.tr(context),
                        deliveryBillEntity.billDate,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Order Details Button
            OrderDetailsButton(status: deliveryBillEntity.status(context)),
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
          const SizedBox(height: 4),
          FittedBox(
            child: Text(
              '$value ',
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
      margin: const EdgeInsets.symmetric(horizontal: 8),
    );
  }

  String formatPrice(double value) {
    double rounded = double.parse(value.toStringAsFixed(2));
    if (rounded == rounded.toInt()) {
      return rounded.toInt().toString(); 
    } else {
      return rounded.toString();
    }
  }
}
