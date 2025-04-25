import 'package:flutter/material.dart';
import 'package:yemensoft_task/core/utils/app_colors.dart';

abstract class AppTextStyle {
  //!======================================= bold ========================================
  // static const TextStyle bold13 = TextStyle(
  //   fontWeight: FontWeight.bold,
  //   fontSize: 13,
  // );
  //!======================================= semiBold ========================================
  static const TextStyle semiBold29 = TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.dartBlue,
    fontSize: 29,
  );
  static const TextStyle semiBold14 = TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.dartBlue,
    fontSize: 14,
  );
  //!======================================= medium ========================================
  static const TextStyle medium12 = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.dartBlue,
    fontSize: 12,
  );
  static const TextStyle medium16 = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.dartBlue,
    fontSize: 16,
  );
  //!======================================= regular ========================================
  static const TextStyle regular14 = TextStyle(
    fontWeight: FontWeight.normal,
    color: AppColors.black,
    fontSize: 14,
  );
}
