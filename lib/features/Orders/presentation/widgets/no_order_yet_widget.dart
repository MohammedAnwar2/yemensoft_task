import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yemensoft_task/core/utils/app_images.dart';
import 'package:yemensoft_task/core/utils/app_text_style.dart';

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
          SizedBox(height: 53),
          SvgPicture.asset(AppImages.imagesEmptyorder),
          const SizedBox(height: 46),
          const Text(
            'No orders yet',
            style: AppTextStyle.semiBold23,
          ),
          const SizedBox(height: 16),
          const Text(
            'You don\'t have any orders in your history.',
            style: AppTextStyle.regular16,
            textAlign: TextAlign.center,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
