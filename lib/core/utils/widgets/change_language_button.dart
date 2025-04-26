import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yemensoft_task/core/services/get_it/get_it_imports.dart';
import 'package:yemensoft_task/core/services/shared_pref.dart';
import 'package:yemensoft_task/core/utils/app_colors.dart';
import 'package:yemensoft_task/core/utils/app_images.dart';
import 'package:yemensoft_task/core/utils/app_key.dart';
import 'package:yemensoft_task/core/utils/app_text_style.dart';
import 'package:yemensoft_task/core/utils/extentions.dart';
import 'package:yemensoft_task/features/localization/app_localizations.dart';
import 'package:yemensoft_task/features/localization/manager/language_cubit.dart';

import '../../services/session_manager.dart';


class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  bool isArabic = false;
  final sessionManager = getIt<SessionManager>();
  @override
  void initState() {
    isArabic = context.read<LanguageCubit>().state.locale.languageCode == 'ar';
    super.initState();
  }

  void changeLanguage(int index) {
    setState(() {
      sessionManager.resetSessionTimer(context);
      isArabic = index == 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 300),
      decoration: BoxDecoration(
        color: AppColors.moreLightGrey,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withCustomOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LanguageHeader(),
          const SizedBox(height: 20),
          LanguageSelectionRow(
            isArabic: isArabic,
            onLanguageChange: changeLanguage,
          ),
          const SizedBox(height: 20),
          ConfirmButton(isArabic: isArabic),
        ],
      ),
    );
  }
}




class LanguageHeader extends StatelessWidget {
  const LanguageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '23'.tr(context),
          style: AppTextStyle.bold12,
        ),
      ],
    );
  }
}


class LanguageSelectionRow extends StatelessWidget {
  final bool isArabic;
  final Function(int) onLanguageChange;

  const LanguageSelectionRow({
    super.key,
    required this.isArabic,
    required this.onLanguageChange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: ArabicLanguageButton(
            isSelected: isArabic,
            onPressed: () => onLanguageChange(0),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: EnglishLanguageButton(
            isSelected: !isArabic,
            onPressed: () => onLanguageChange(1),
          ),
        ),
      ],
    );
  }
}



class ArabicLanguageButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onPressed;

  const ArabicLanguageButton({
    super.key,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      onPressed: onPressed,
      backgroundColor: isSelected ? Colors.green[200] : null,
      child: Row(
        children: [
          SvgPicture.asset(AppImages.imagesArabicFlag),
          const SizedBox(width: 19),
          Column(
            children: [
              Text(
                'العربية',
                style: AppTextStyle.semiBold12.copyWith(
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
              Text(
                'Arabic',
                style: AppTextStyle.semiBold12.copyWith(
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class EnglishLanguageButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onPressed;

  const EnglishLanguageButton({
    super.key,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      onPressed: onPressed,
      backgroundColor: isSelected ? Colors.green[200] : null,
      child: Row(
        children: [
          SvgPicture.asset(AppImages.imagesEnglishFlag),
          const SizedBox(width: 19),
          Column(
            children: [
              Text(
                'English',
                style: AppTextStyle.semiBold12.copyWith(
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
              Text(
                'English',
                style: AppTextStyle.semiBold12.copyWith(
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class ConfirmButton extends StatelessWidget {
  final bool isArabic;

  const ConfirmButton({super.key, required this.isArabic});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomElevatedButton(
            text: '21'.tr(context),
            onPressed: () {
              SharedPref.setString(
                AppKey.localizationsDelegates,
                isArabic ? 'ar' : 'en',
              );
              context.read<LanguageCubit>().changeLanguage(
                    isArabic ? 'ar' : 'en',
                  );
              Navigator.pop(context);
            },
            backgroundColor: AppColors.dartBlue,
            textColor: AppColors.white,
          ),
        ),
      ],
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.text,
    this.onPressed,
    this.textColor,
    this.backgroundColor,
    this.child,
  });

  final Widget? child;
  final String? text;
  final VoidCallback? onPressed;
  final Color? textColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: backgroundColor,
      ),
      child: child ??
          Text(
            text ?? '',
            style: AppTextStyle.semiBold16.copyWith(color: textColor),
          ),
    );
  }
}













// class LanguageSelector extends StatefulWidget {
//   const LanguageSelector({super.key});

//   @override
//   State<LanguageSelector> createState() => _LanguageSelectorState();
// }

// class _LanguageSelectorState extends State<LanguageSelector> {
//   bool isArabic = false;
//   @override
//   void initState() {
//     isArabic = context.read<LanguageCubit>().state.locale.languageCode == 'ar';
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 16),
//       margin: EdgeInsets.symmetric(horizontal: 20, vertical: 300),
//       decoration: BoxDecoration(
//         color: AppColors.moreLightGrey,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withCustomOpacity(0.1),
//             blurRadius: 10,
//             offset: Offset(0, 5),
//           ),
//         ],
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [Text('23'.tr(context), style: AppTextStyle.bold12)],
//           ),
//           SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,

//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Expanded(
//                 child: CustomElevatedButton(
//                   onPressed: () {
//                     changeLanguage(0);
//                   },
//                   backgroundColor: isArabic ? Colors.green[200] : null,
//                   child: Row(
//                     children: [
//                       SvgPicture.asset(AppImages.imagesArabicFlag),
//                       SizedBox(width: 19),
//                       Column(
//                         children: [
//                           Text(
//                             'العربية',
//                             style: AppTextStyle.semiBold12.copyWith(
//                               color: isArabic ? Colors.white : Colors.black,
//                             ),
//                           ),
//                           Text(
//                             'Arabic',
//                             style: AppTextStyle.semiBold12.copyWith(
//                               color: isArabic ? Colors.white : Colors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(width: 20),
//               Expanded(
//                 child: CustomElevatedButton(
//                   onPressed: () {
//                     changeLanguage(1);
//                   },
//                   backgroundColor: !isArabic ? Colors.green[200] : null,
//                   child: Row(
//                     children: [
//                       SvgPicture.asset(AppImages.imagesEnglishFlag),
//                       SizedBox(width: 19),
//                       Column(
//                         children: [
//                           Text(
//                             'English',
//                             style: AppTextStyle.semiBold12.copyWith(
//                               color: !isArabic ? Colors.white : Colors.black,
//                             ),
//                           ),
//                           Text(
//                             'English',
//                             style: AppTextStyle.semiBold12.copyWith(
//                               color: !isArabic ? Colors.white : Colors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 20),
//           Row(
//             children: [
//               Expanded(
//                 child: CustomElevatedButton(
//                   text: '21'.tr(context),
//                   onPressed: () {
//                     SharedPref.setString(
//                       AppKey.localizationsDelegates,
//                       isArabic ? 'ar' : 'en',
//                     );
//                     context.read<LanguageCubit>().changeLanguage(
//                       isArabic ? 'ar' : 'en',
//                     );
//                     Navigator.pop(context);
//                   },
//                   backgroundColor: AppColors.dartBlue,
//                   textColor: AppColors.white,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   void changeLanguage(int index) {
//     setState(() {
//       isArabic = index == 0 ? true : false;
//     });
//   }
// }

// class CustomElevatedButton extends StatelessWidget {
//   const CustomElevatedButton({
//     super.key,
//     this.text,
//     this.onPressed,
//     this.textColor,
//     this.backgroundColor,
//     this.child,
//   });
//   final Widget? child;
//   final String? text;
//   final void Function()? onPressed;
//   final Color? textColor;
//   final Color? backgroundColor;
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         backgroundColor: backgroundColor,
//         // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//       ),
//       child:
//           child ??
//           Text(
//             text ?? '',
//             style: AppTextStyle.semiBold16.copyWith(color: textColor),
//           ),
//     );
//   }
// }
