import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yemensoft_task/features/orders/data/models/delivery_bill_model.dart';

class DeliveryLocalDataSource {
  static final DeliveryLocalDataSource instance = DeliveryLocalDataSource._init();
  static Database? _database;

  DeliveryLocalDataSource._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('delivery.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, filePath);

    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE delivery_bills (
          bill_srl TEXT PRIMARY KEY,
          bill_type TEXT,
          bill_no TEXT,
          bill_date TEXT,
          bill_time TEXT,
          bill_amt TEXT,
          tax_amt TEXT,
          dlvry_amt TEXT,
          mobile_no TEXT,
          cstmr_nm TEXT,
          rgn_nm TEXT,
          cstmr_build_no TEXT,
          cstmr_floor_no TEXT,
          cstmr_aprtmnt_no TEXT,
          cstmr_addrss TEXT,
          latitude TEXT,
          longitude TEXT,
          dlvry_status_flg TEXT
        )
      ''');
    });
  }

  Future<void> saveBills(List<OrderBillModel> bills) async {
    final db = await database;
    for (var bill in bills) {
      await db.insert('delivery_bills', {
        'bill_srl': bill.billSrl,
        'bill_type': bill.billType,
        'bill_no': bill.billNo,
        'bill_date': bill.billDate,
        'bill_time': bill.billTime,
        'bill_amt': bill.billAmt,
        'tax_amt': bill.taxAmt,
        'dlvry_amt': bill.dlvryAmt,
        'mobile_no': bill.mobileNo,
        'cstmr_nm': bill.cstmrNm,
        'rgn_nm': bill.rgnNm,
        'cstmr_build_no': bill.cstmrBuildNo,
        'cstmr_floor_no': bill.cstmrFloorNo,
        'cstmr_aprtmnt_no': bill.cstmrAprtmntNo,
        'cstmr_addrss': bill.cstmrAddrss,
        'latitude': bill.latitude,
        'longitude': bill.longitude,
        'dlvry_status_flg': bill.dlvryStatusFlg,
      }, conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  Future<List<OrderBillModel>> getNewBills() async {
    final db = await database;
    // Use raw SQL query instead of parameterized query
    final result = await db.rawQuery("SELECT * FROM delivery_bills WHERE dlvry_status_flg = '0'");
    return result.map((map) => OrderBillModel(
      billSrl: map['bill_srl'] as String?,
      billType: map['bill_type'] as String?,
      billNo: map['bill_no'] as String?,
      billDate: map['bill_date'] as String?,
      billTime: map['bill_time'] as String?,
      billAmt: map['bill_amt'] as String?,
      taxAmt: map['tax_amt'] as String?,
      dlvryAmt: map['dlvry_amt'] as String?,
      mobileNo: map['mobile_no'] as String?,
      cstmrNm: map['cstmr_nm'] as String?,
      rgnNm: map['rgn_nm'] as String?,
      cstmrBuildNo: map['cstmr_build_no'] as String?,
      cstmrFloorNo: map['cstmr_floor_no'] as String?,
      cstmrAprtmntNo: map['cstmr_aprtmnt_no'] as String?,
      cstmrAddrss: map['cstmr_addrss'] as String?,
      latitude: map['latitude'] as String?,
      longitude: map['longitude'] as String?,
      dlvryStatusFlg: map['dlvry_status_flg'] as String?,
    )).toList();
  }

  Future<List<OrderBillModel>> getOtherBills() async {
    final db = await database;
    // Use raw SQL query instead of parameterized query
    final result = await db.rawQuery("SELECT * FROM delivery_bills WHERE dlvry_status_flg != '0'");
    return result.map((map) => OrderBillModel(
      billSrl: map['bill_srl'] as String?,
      billType: map['bill_type'] as String?,
      billNo: map['bill_no'] as String?,
      billDate: map['bill_date'] as String?,
      billTime: map['bill_time'] as String?,
      billAmt: map['bill_amt'] as String?,
      taxAmt: map['tax_amt'] as String?,
      dlvryAmt: map['dlvry_amt'] as String?,
      mobileNo: map['mobile_no'] as String?,
      cstmrNm: map['cstmr_nm'] as String?,
      rgnNm: map['rgn_nm'] as String?,
      cstmrBuildNo: map['cstmr_build_no'] as String?,
      cstmrFloorNo: map['cstmr_floor_no'] as String?,
      cstmrAprtmntNo: map['cstmr_aprtmnt_no'] as String?,
      cstmrAddrss: map['cstmr_addrss'] as String?,
      latitude: map['latitude'] as String?,
      longitude: map['longitude'] as String?,
      dlvryStatusFlg: map['dlvry_status_flg'] as String?,
    )).toList();
  }
}