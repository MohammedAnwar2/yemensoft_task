import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yemensoft_task/core/utils/app_images.dart';
import 'package:yemensoft_task/core/utils/widgets/change_language_button.dart';
import 'dart:math' as math;

import 'package:yemensoft_task/features/localization/manager/language_cubit.dart';

class LoginTopHeaderSection extends StatelessWidget {
  const LoginTopHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SvgPicture.asset(AppImages.imagesLogo),
        BlocBuilder<LanguageCubit, ChangeLanguageState>(
          builder: (context, state) {
            return Stack(
              children: [
                state.locale.languageCode == 'en'
                    ? SvgPicture.asset(AppImages.imagesCircle)
                    : Transform.rotate(
                      angle: math.pi * -0.5,
                      child: SvgPicture.asset(AppImages.imagesCircle),
                    ),
                Positioned(
                  top: 50,
                  right: state.locale.languageCode == 'en' ? 16 : null,
                  left: state.locale.languageCode == 'en' ? null : 16,
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) => const LanguageSelector(),
                      );
                    },
                    child: SvgPicture.asset(AppImages.imagesLanguage),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
