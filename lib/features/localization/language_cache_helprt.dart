

import 'package:yemensoft_task/core/services/shared_pref.dart';
import 'package:yemensoft_task/core/utils/app_key.dart';

class AppLocalizationCachedHelper {
  static Future<void> saveLanguageCode(String lang) async {
    await SharedPref.setString(AppKey.localizationsDelegates, lang);
  }

  static String getLanguageCode() {
    String? langauge = SharedPref.getString(AppKey.localizationsDelegates);
    if (langauge != null) {
      return langauge;
    } else {
      return 'en';
    }
  }
}
