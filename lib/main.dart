import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemensoft_task/core/utils/app_router.dart';
import 'package:yemensoft_task/features/localization/app_localizations.dart';
import 'package:yemensoft_task/features/localization/manager/language_cubit.dart';
import 'core/services/init_services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  await InitServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageCubit(),
      child: BlocBuilder<LanguageCubit, ChangeLanguageState>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: ThemeData(fontFamily: 'Montserrat'),
            debugShowCheckedModeBanner: false,
            title: 'Material App',
            routerConfig: AppRouter.router,
            locale: state.locale,
            supportedLocales: const [Locale('ar'), Locale('en')],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              for (var locale in supportedLocales) {
                if (deviceLocale != null &&
                    deviceLocale.languageCode == locale.languageCode) {
                  return deviceLocale;
                }
              }
              return supportedLocales.first;
            },
          );
        },
      ),
    );
  }
}
