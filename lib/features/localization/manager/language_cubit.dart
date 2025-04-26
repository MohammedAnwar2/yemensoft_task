import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:yemensoft_task/features/localization/language_cache_helprt.dart';
part 'language_state.dart';

class LanguageCubit extends Cubit<ChangeLanguageState> {
  LanguageCubit() : super(ChangeLanguageState(locale: const Locale('en'))) {
    getSavedLanguage();
  }

  changeLanguage(String lang) async {
    await AppLocalizationCachedHelper.saveLanguageCode(lang);
    emit(ChangeLanguageState(locale: Locale(lang)));
  }

  getSavedLanguage() async {
    final langCode = AppLocalizationCachedHelper.getLanguageCode();
    emit(ChangeLanguageState(locale: Locale(langCode)));
  }
}
