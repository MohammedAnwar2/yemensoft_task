import 'package:yemensoft_task/features/login/domain/entities/login_entities.dart';
import 'package:yemensoft_task/features/orders/domain/entities/delivery_bill_entities.dart';

class OrderBillModel {
  String? billType;
  String? billNo;
  String? billSrl;
  String? billDate;
  String? billTime;
  String? billAmt;
  String? taxAmt;
  String? dlvryAmt;
  String? mobileNo;
  String? cstmrNm;
  String? rgnNm;
  String? cstmrBuildNo;
  String? cstmrFloorNo;
  String? cstmrAprtmntNo;
  String? cstmrAddrss;
  String? latitude;
  String? longitude;
  String? dlvryStatusFlg;

  OrderBillModel({
    this.billType,
    this.billNo,
    this.billSrl,
    this.billDate,
    this.billTime,
    this.billAmt,
    this.taxAmt,
    this.dlvryAmt,
    this.mobileNo,
    this.cstmrNm,
    this.rgnNm,
    this.cstmrBuildNo,
    this.cstmrFloorNo,
    this.cstmrAprtmntNo,
    this.cstmrAddrss,
    this.latitude,
    this.longitude,
    this.dlvryStatusFlg,
  });

  static OrderBillEntity toOrderBillEntities(OrderBillModel model) {
    return OrderBillEntity(
      billSrl: model.billSrl ?? '',
      billDate: model.billDate ?? '',
      billAmt: double.tryParse(model.billAmt ?? '0') ?? 0.0,
      taxAmt: double.tryParse(model.taxAmt ?? '0') ?? 0.0,
      dlvryAmt: double.tryParse(model.dlvryAmt ?? '0') ?? 0.0,
      dlvryStatusFlg: int.tryParse(model.dlvryStatusFlg ?? '0') ?? 0,
    );
  }

  factory OrderBillModel.fromJson(Map<String, dynamic> json) {
    return OrderBillModel(
      billType: json['BILL_TYPE'] as String?,
      billNo: json['BILL_NO'] as String?,
      billSrl: json['BILL_SRL'] as String?,
      billDate: json['BILL_DATE'] as String?,
      billTime: json['BILL_TIME'] as String?,
      billAmt: json['BILL_AMT'] as String?,
      taxAmt: json['TAX_AMT'] as String?,
      dlvryAmt: json['DLVRY_AMT'] as String?,
      mobileNo: json['MOBILE_NO'] as String?,
      cstmrNm: json['CSTMR_NM'] as String?,
      rgnNm: json['RGN_NM'] as String?,
      cstmrBuildNo: json['CSTMR_BUILD_NO'] as String?,
      cstmrFloorNo: json['CSTMR_FLOOR_NO'] as String?,
      cstmrAprtmntNo: json['CSTMR_APRTMNT_NO'] as String?,
      cstmrAddrss: json['CSTMR_ADDRSS'] as String?,
      latitude: json['LATITUDE'] as String?,
      longitude: json['LONGITUDE'] as String?,
      dlvryStatusFlg: json['DLVRY_STATUS_FLG'] as String?,
    );
  }

factory OrderBillModel.fromMap(Map<String, dynamic> json) {
  return OrderBillModel(
    billType: json['bill_type'] as String?,
    billNo: json['bill_no'] as String?,
    billSrl: json['bill_srl'] as String?,
    billDate: json['bill_date'] as String?,
    billTime: json['bill_time'] as String?,
    billAmt: json['bill_amt'] as String?,
    taxAmt: json['tax_amt'] as String?,
    dlvryAmt: json['dlvry_amt'] as String?,
    mobileNo: json['mobile_no'] as String?,
    cstmrNm: json['cstmr_nm'] as String?,
    rgnNm: json['rgn_nm'] as String?,
    cstmrBuildNo: json['cstmr_build_no'] as String?,
    cstmrFloorNo: json['cstmr_floor_no'] as String?,
    cstmrAprtmntNo: json['cstmr_aprtmnt_no'] as String?,
    cstmrAddrss: json['cstmr_addrss'] as String?,
    latitude: json['latitude'] as String?,
    longitude: json['longitude'] as String?,
    dlvryStatusFlg: json['dlvry_status_flg'] as String?,
  );
}
  Map<String, dynamic> toMap() {
    return {
      "BILL_TYPE": billType,
      "BILL_NO": billNo,
      "BILL_SRL": billSrl,
      "BILL_DATE": billDate,
      "BILL_TIME": billTime,
      "BILL_AMT": billAmt,
      "TAX_AMT": taxAmt,
      "DLVRY_AMT": dlvryAmt,
      "MOBILE_NO": mobileNo,
      "CSTMR_NM": cstmrNm,
      "RGN_NM": rgnNm,
      "CSTMR_BUILD_NO": cstmrBuildNo,
      "CSTMR_FLOOR_NO": cstmrFloorNo,
      "CSTMR_APRTMNT_NO": cstmrAprtmntNo,
      "CSTMR_ADDRSS": cstmrAddrss,
      "LATITUDE": latitude,
      "LONGITUDE": longitude,
      "DLVRY_STATUS_FLG": dlvryStatusFlg
    };
  }


  static Map<String, dynamic> toJson(LoginEntities loginEntities) {
    return {
    "Value": {
        "P_DLVRY_NO": "1010",
        "P_LANG_NO": "1",
        "P_BILL_SRL": "",
        "P_PRCSSD_FLG": ""
    }
};
    // return {
    //   "Value": {
    //     "P_DLVRY_NO": loginEntities.delivryNO,
    //     "P_LANG_NO": loginEntities.lang,
    //     "P_BILL_SRL": "",
    //     "P_PRCSSD_FLG": "",
    //   },
    // };
  }
}
