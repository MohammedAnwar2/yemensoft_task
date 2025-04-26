import 'package:flutter/material.dart';
import 'package:yemensoft_task/features/localization/app_localizations.dart';

class OrderBillEntity {
  final String billSrl;
  final String billDate;
  final double billAmt;
  final double taxAmt;
  final double dlvryAmt;
  final int dlvryStatusFlg;

  OrderBillEntity({
    required this.billSrl,
    required this.billDate,
    required this.billAmt,
    required this.taxAmt,
    required this.dlvryAmt,
    required this.dlvryStatusFlg,
  });

  String  status(BuildContext context) {
    switch (dlvryStatusFlg) {
      case 0:
        return '11'.tr(context);
      case 1:
        return '18'.tr(context);
      case 2:
        return '20'.tr(context);
      case 3:
        return '19'.tr(context);
      default:
        return 'Unknown';
    }
  }

  double get totalPrice => billAmt + taxAmt + dlvryAmt;
}
