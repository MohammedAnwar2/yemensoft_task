import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yemensoft_task/core/utils/app_router.dart';
import 'core/services/init_services.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  await InitServices.init();
  runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  )
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
       useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      //==============
      theme: ThemeData(fontFamily: 'Montserrat'),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routerConfig: AppRouter.router,
      // home: SplashView(),
    );
  }
}
