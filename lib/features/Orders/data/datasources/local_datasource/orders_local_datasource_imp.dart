import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yemensoft_task/core/error/exceptions.dart';
import 'package:yemensoft_task/features/orders/data/models/delivery_bill_model.dart';
import 'orders_local_datasource.dart';

class OrdersSharedPrefLocalDatasourceImp extends OrdersLocalDatasource {
  static final OrdersSharedPrefLocalDatasourceImp instance =
      OrdersSharedPrefLocalDatasourceImp._internal();
  static Database? _database;
  static const String _tableName = 'delivery_bills';

  OrdersSharedPrefLocalDatasourceImp._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('delivery2.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE IF NOT EXISTS $_tableName (
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
      },
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
    );
  }

  @override
  Future<void> create() async {
    final db = await database;
    await db.execute('''
      CREATE TABLE IF NOT EXISTS $_tableName (
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
  }

  @override
  Future<void> insert(List<OrderBillModel> bills) async {
    final db = await database;
    try {
      for (var bill in bills) {
        await db.insert(_tableName, bill.toMap());
      }
    } catch (e) {
      throw QueriesException(errorMessage: 'Failed to insert bills: $e');
    }
  }

  @override
  Future<void> clear() async {
    final db = await database;
    try {
      await db.delete(_tableName);
    } catch (e) {
      throw QueriesException(errorMessage: 'Failed to clear table: $e');
    }
  }

  Future<List<OrderBillModel>> get(String condition) async {
    final db = await database;
    try {
      final result = await db.rawQuery(
        "SELECT * FROM $_tableName WHERE $condition",
      );
      return result
          .map<OrderBillModel>((map) => OrderBillModel.fromMap(map))
          .toList();
    } catch (e) {
      throw QueriesException(errorMessage: 'Failed to fetch data: $e');
    }
  }

  @override
  Future<List<OrderBillModel>> getNewBills() async {
    try {
      final bills = await get("dlvry_status_flg = '0'");
      if (bills.isEmpty) {
        throw EmptyCacheException(
          errorMessage: 'You don\'t have any new orders in your history',
        );
      }
      return bills;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<OrderBillModel>> getOtherBills() async {
    try {
      final bills = await get("dlvry_status_flg != '0'");
      if (bills.isEmpty) {
        throw EmptyCacheException(
          errorMessage: 'You don\'t have any other orders in your history',
        );
      }
      return bills;
    } catch (e) {
      rethrow;
    }
  }
}

// class OrdersSharedPrefLocalDatasourceImp extends OrdersLocalDatasource {
//   static final OrdersSharedPrefLocalDatasourceImp instance =
//       OrdersSharedPrefLocalDatasourceImp._internal();
//   static Database? _database;
//   static const String _tableName = 'delivery_bills';

//   OrdersSharedPrefLocalDatasourceImp._internal();

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDB('delivery2.db');
//     return _database!;
//   }

//   Future<Database> _initDB(String filePath) async {
//     final directory = await getApplicationDocumentsDirectory();
//     final path = join(directory.path, filePath);

//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) async {
//         await db.execute('''
//           CREATE TABLE IF NOT EXISTS $_tableName (
//             bill_srl TEXT PRIMARY KEY,
//             bill_type TEXT,
//             bill_no TEXT,
//             bill_date TEXT,
//             bill_time TEXT,
//             bill_amt TEXT,
//             tax_amt TEXT,
//             dlvry_amt TEXT,
//             mobile_no TEXT,
//             cstmr_nm TEXT,
//             rgn_nm TEXT,
//             cstmr_build_no TEXT,
//             cstmr_floor_no TEXT,
//             cstmr_aprtmnt_no TEXT,
//             cstmr_addrss TEXT,
//             latitude TEXT,
//             longitude TEXT,
//             dlvry_status_flg TEXT
//           )
//         ''');
//       },
//       onConfigure: (db) async {
//         await db.execute('PRAGMA foreign_keys = ON');
//       },
//     );
//   }

//   @override
//   Future<void> create() async {
//     final db = await database;
//     print('----------------------- Ensuring table $_tableName exists');
//     await db.execute('''
//       CREATE TABLE IF NOT EXISTS $_tableName (
//         bill_srl TEXT PRIMARY KEY,
//         bill_type TEXT,
//         bill_no TEXT,
//         bill_date TEXT,
//         bill_time TEXT,
//         bill_amt TEXT,
//         tax_amt TEXT,
//         dlvry_amt TEXT,
//         mobile_no TEXT,
//         cstmr_nm TEXT,
//         rgn_nm TEXT,
//         cstmr_build_no TEXT,
//         cstmr_floor_no TEXT,
//         cstmr_aprtmnt_no TEXT,
//         cstmr_addrss TEXT,
//         latitude TEXT,
//         longitude TEXT,
//         dlvry_status_flg TEXT
//       )
//     ''');
//   }

//   @override
//   Future<void> insert(List<OrderBillModel> bills) async {
//     final db = await database;
//     try {
//       for (var bill in bills) {
//         await db.insert(_tableName, bill.toMap());
//         // await db.insert(_tableName, {
//         //   'bill_srl': bill.billSrl ?? '',
//         //   'bill_type': bill.billType ?? '',
//         //   'bill_no': bill.billNo ?? '',
//         //   'bill_date': bill.billDate ?? '',
//         //   'bill_time': bill.billTime ?? '',
//         //   'bill_amt': bill.billAmt ?? '0.0',
//         //   'tax_amt': bill.taxAmt ?? '0.0',
//         //   'dlvry_amt': bill.dlvryAmt ?? '0.0',
//         //   'mobile_no': bill.mobileNo ?? '',
//         //   'cstmr_nm': bill.cstmrNm ?? '',
//         //   'rgn_nm': bill.rgnNm ?? '',
//         //   'cstmr_build_no': bill.cstmrBuildNo ?? '',
//         //   'cstmr_floor_no': bill.cstmrFloorNo ?? '',
//         //   'cstmr_aprtmnt_no': bill.cstmrAprtmntNo ?? '',
//         //   'cstmr_addrss': bill.cstmrAddrss ?? '',
//         //   'latitude': bill.latitude ?? '',
//         //   'longitude': bill.longitude ?? '',
//         //   'dlvry_status_flg': bill.dlvryStatusFlg ?? '0',
//         // });
//       }
//     } catch (e) {
//       throw QueriesException(errorMessage: 'Failed to insert bills: $e');
//     }
//   }

//   @override
//   Future<void> clear() async {
//     final db = await database;
//     try {
//       await db.delete(_tableName);
//     } catch (e) {
//       throw QueriesException(errorMessage: 'Failed to clear table: $e');
//     }
//   }

//   Future<List<OrderBillModel>> get(String condition) async {
//     final db = await database;
//     try {
//       final result = await db.rawQuery(
//         "SELECT * FROM $_tableName WHERE $condition",
//       );
//       print('----------------------- Query result: $result');
//       return result
//           .map<OrderBillModel>(
//             (map) => OrderBillModel.fromMap(map),
//             // (map) => OrderBillModel(
//             //   billSrl: map['bill_srl'] as String?,
//             //   billType: map['bill_type'] as String?,
//             //   billNo: map['bill_no'] as String?,
//             //   billDate: map['bill_date'] as String?,
//             //   billTime: map['bill_time'] as String?,
//             //   billAmt: map['bill_amt'] as String?,
//             //   taxAmt: map['tax_amt'] as String?,
//             //   dlvryAmt: map['dlvry_amt'] as String?,
//             //   mobileNo: map['mobile_no'] as String?,
//             //   cstmrNm: map['cstmr_nm'] as String?,
//             //   rgnNm: map['rgn_nm'] as String?,
//             //   cstmrBuildNo: map['cstmr_build_no'] as String?,
//             //   cstmrFloorNo: map['cstmr_floor_no'] as String?,
//             //   cstmrAprtmntNo: map['cstmr_aprtmnt_no'] as String?,
//             //   cstmrAddrss: map['cstmr_addrss'] as String?,
//             //   latitude: map['latitude'] as String?,
//             //   longitude: map['longitude'] as String?,
//             //   dlvryStatusFlg: map['dlvry_status_flg'] as String?,
//             // ),
//           )
//           .toList();

//     } catch (e) {
//       throw QueriesException(errorMessage: 'Failed to fetch data: $e');
//     }
//   }

//   Future<List<OrderBillModel>> getAllBills() async {
//     final db = await database;
//     try {
//       print('----------------------- Fetching all bills');
//       final result = await db.query(_tableName);
//       print('----------------------- All bills result: $result');

//       if (result.isEmpty) {
//         print('----------------------- No bills found in table');
//       } else {
//         result.forEach((row) {
//           print('----------------------- Row: $row');
//         });
//       }

//       return result
//           .map<OrderBillModel>(
//             // (map) => OrderBillModel.fromJson(map),
//             (map) => OrderBillModel(
//               billSrl: map['bill_srl'] as String?,
//               billType: map['bill_type'] as String?,
//               billNo: map['bill_no'] as String?,
//               billDate: map['bill_date'] as String?,
//               billTime: map['bill_time'] as String?,
//               billAmt: map['bill_amt'] as String?,
//               taxAmt: map['tax_amt'] as String?,
//               dlvryAmt: map['dlvry_amt'] as String?,
//               mobileNo: map['mobile_no'] as String?,
//               cstmrNm: map['cstmr_nm'] as String?,
//               rgnNm: map['rgn_nm'] as String?,
//               cstmrBuildNo: map['cstmr_build_no'] as String?,
//               cstmrFloorNo: map['cstmr_floor_no'] as String?,
//               cstmrAprtmntNo: map['cstmr_aprtmnt_no'] as String?,
//               cstmrAddrss: map['cstmr_addrss'] as String?,
//               latitude: map['latitude'] as String?,
//               longitude: map['longitude'] as String?,
//               dlvryStatusFlg: map['dlvry_status_flg'] as String?,
//             ),
//           )
//           .toList();
//     } catch (e) {
//       print('----------------------- Error fetching all bills: $e');
//       throw QueriesException(errorMessage: 'Failed to fetch all bills: $e');
//     }
//   }

//   @override
//   Future<List<OrderBillModel>> getNewBills() async {
//     try {
//       final bills = await get("dlvry_status_flg = '0'");
//       if (bills.isEmpty) {
//         throw EmptyCacheException(
//           errorMessage: 'You don\'t have any new orders in your history',
//         );
//       }
//       print('----------------------- New bills fetched: ${bills.length}');
//       return bills;
//     } catch (e) {
//       print('----------------------- Error getting new bills: $e');
//       rethrow;
//     }
//   }

//   @override
//   Future<List<OrderBillModel>> getOtherBills() async {
//     try {
//       final bills = await get("dlvry_status_flg != '0'");
//       if (bills.isEmpty) {
//         throw EmptyCacheException(
//           errorMessage: 'You don\'t have any other orders in your history',
//         );
//       }
//       print('----------------------- Other bills fetched: ${bills.length}');
//       return bills;
//     } catch (e) {
//       print('----------------------- Error getting other bills: $e');
//       rethrow;
//     }
//   }
// }
