import 'package:flutter/material.dart';

import 'get_it/get_it_imports.dart';

class InitServices {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initializationGetIt();
  }
}