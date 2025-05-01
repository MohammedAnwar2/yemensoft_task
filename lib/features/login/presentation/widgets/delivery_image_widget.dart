import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yemensoft_task/core/utils/app_images.dart';

class DeliveryImageWidget extends StatelessWidget {
  const DeliveryImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUp(child: SvgPicture.asset(AppImages.imagesDelivery));
  }
}
