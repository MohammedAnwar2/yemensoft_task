import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yemensoft_task/core/utils/app_images.dart';

class LoginTopHeaderSection extends StatelessWidget {
  const LoginTopHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SvgPicture.asset(AppImages.imagesLogo),
        Stack(
          children: [
            SvgPicture.asset(AppImages.imagesCircle),
            Positioned(
              top: 50,
              right: 16,
              child: SvgPicture.asset(AppImages.imagesLanguage),
            ),
          ],
        ),
      ],
    );
  }
}
