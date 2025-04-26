class DeliveryBillEntity {
  final String billSrl;
  final String billDate;
  final double billAmt;
  final double taxAmt;
  final double dlvryAmt;
  final int dlvryStatusFlg;

  DeliveryBillEntity({
    required this.billSrl,
    required this.billDate,
    required this.billAmt,
    required this.taxAmt,
    required this.dlvryAmt,
    required this.dlvryStatusFlg,
  });

  String get status {
    switch (dlvryStatusFlg) {
      case 0:
        return 'New';
      case 1:
        return 'Delivering';
      case 2:
        return 'Returned';
      case 3:
        return 'Delivered';
      default:
        return 'Unknown';
    }
  }

  double get totalPrice => billAmt + taxAmt + dlvryAmt;
}
