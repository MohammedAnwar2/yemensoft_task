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
        final billMap = bill.toMap();
        final keys = billMap.keys.join(', ');
        final values = billMap.values
            .map((value) {
              if (value is String) return "'$value'";
              if (value == null) return 'NULL';
              return '$value';
            })
            .join(', ');
        await db.rawInsert('INSERT INTO $_tableName ($keys) VALUES ($values)');
      }
    } catch (e) {
      throw QueriesException(errorMessage: 'Failed to insert bills: $e');
    }
  }

@override
Future<void> clear() async {
  final db = await database;
  try {
    await db.rawDelete('DELETE FROM $_tableName');
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