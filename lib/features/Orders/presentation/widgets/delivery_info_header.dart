import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yemensoft_task/core/utils/app_colors.dart';
import 'package:yemensoft_task/core/utils/app_images.dart';
import 'package:yemensoft_task/core/utils/app_text_style.dart';
import 'package:yemensoft_task/core/utils/functions/get_user_data.dart';

class DeliveryInfoHeader extends StatelessWidget {
  const DeliveryInfoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(start: 16),
      color: AppColors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 0.5,
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              getUserData().deliveryName!,
              style: AppTextStyle.bold25.copyWith(height: 1),
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: SvgPicture.asset(AppImages.imagesBlueCircle),
              ),
              Positioned.fill(
                top: 15,
                left: -140,
                // padding: EdgeInsetsDirectional.only(start: 10),
                // left: screenWidth * 0.30,
                child: Image.asset(AppImages.imagesDeliveryman),
              ),
              Positioned(
                top: 40,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: SvgPicture.asset(
                    AppImages.imagesBlueLanguage,
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
