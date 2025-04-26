import 'package:flutter/material.dart';
import 'package:yemensoft_task/features/orders/data/datasources/local_datasource/orders_local_datasource_imp.dart';

import 'shared_pref.dart';
import 'get_it/get_it_imports.dart';

class InitServices {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initializationGetIt();
    await SharedPref.initSharedPreferences();
    
  }
}
