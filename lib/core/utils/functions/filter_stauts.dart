import 'package:flutter/material.dart';
import 'package:yemensoft_task/core/utils/app_colors.dart';
import 'package:yemensoft_task/features/localization/app_localizations.dart';

// filterStatus({required String status}) {
//   switch (status) {
//     case 'New':
//       return AppColors.green;
//     case 'Delivering':
//       return AppColors.darkCyanBlue;
//     case 'Returned':
//       return AppColors.red;
//     case 'Delivered':
//       return AppColors.grey;
//     default:
//       return AppColors.grey;
//   }
// }

filterStatus({required String status, required BuildContext context}) {
  if (status == '17'.tr(context)) {
    return AppColors.green;
  } else if (status == '18'.tr(context)) {
    return AppColors.darkCyanBlue;
  } else if (status == '20'.tr(context)) {
    return AppColors.red;
  } else if (status == '19'.tr(context)) {
    return AppColors.grey;
  } else {
    return AppColors.grey;
  }
}
