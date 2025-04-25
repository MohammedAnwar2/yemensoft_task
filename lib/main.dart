import 'package:flutter/material.dart';
import 'package:yemensoft_task/core/utils/app_router.dart';

import 'features/splash/presentation/pages/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routerConfig: AppRouter.router,
      // home: SplashView(),
    );
  }
}

