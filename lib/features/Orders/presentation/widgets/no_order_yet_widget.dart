import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yemensoft_task/core/utils/app_images.dart';
import 'package:yemensoft_task/core/utils/app_text_style.dart';
import 'package:yemensoft_task/features/localization/app_localizations.dart';

class NoOrdersYetWidget extends StatelessWidget {
  const NoOrdersYetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 53),
          SvgPicture.asset(AppImages.imagesEmptyorder),
          const SizedBox(height: 46),
           Text(
            '9'.tr(context),
            style: AppTextStyle.semiBold23,
          ),
          const SizedBox(height: 16),
          Text(
            '10'.tr(context),
            style: AppTextStyle.regular16,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
