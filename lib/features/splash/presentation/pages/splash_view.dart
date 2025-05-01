import 'package:flutter/material.dart';
import 'package:yemensoft_task/core/utils/app_colors.dart';
import 'package:yemensoft_task/features/splash/presentation/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  static const String routeName = '/';
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.lightGreen,
      body: SplashViewBody(),
    );
  }
}
