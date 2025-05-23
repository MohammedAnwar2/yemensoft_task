import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:yemensoft_task/core/services/shared_pref.dart';
import 'package:yemensoft_task/core/utils/app_images.dart';
import 'package:yemensoft_task/core/utils/app_key.dart';
import 'package:yemensoft_task/features/Orders/presentation/pages/orders_view.dart';
import 'package:yemensoft_task/features/login/presentation/pages/login_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    navigateToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          FadeInLeftBig(animate: true,child: SvgPicture.asset(AppImages.imagesLogo2)),
          const Spacer(),
          FadeInRightBig(animate: true,child: SvgPicture.asset(AppImages.imagesDeliveryman2)),
        ],
      ),
    );
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      final bool isLoggedIn = SharedPref.getBool(AppKey.loginSession) ?? false;
      if (isLoggedIn) {
        GoRouter.of(context).go(OrdersView.routeName);
      } else {
        GoRouter.of(context).go(LoginView.routeName);
      }
    });
  }
}
