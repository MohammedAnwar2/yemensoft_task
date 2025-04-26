import 'package:yemensoft_task/features/localization/app_localizations.dart';

String? validateInput(
  String? value, 
  String errorMessage ,
) {
  if (value == null || value.trim().isEmpty) {
    return errorMessage;
  }
  return null;
}
