import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemensoft_task/core/utils/app_text_style.dart';
import 'package:yemensoft_task/core/utils/functions/filter_stauts.dart';
import 'package:yemensoft_task/features/localization/app_localizations.dart';
import 'package:yemensoft_task/features/localization/manager/language_cubit.dart';

class OrderDetailsButton extends StatelessWidget {
  const OrderDetailsButton({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, ChangeLanguageState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: filterStatus(status: status),
            borderRadius: _borderMethod(state.locale.languageCode),
          ),
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "13".tr(context),
                    textAlign: TextAlign.center,
                    style: AppTextStyle.regular8,
                  ),
                  SizedBox(height: 8),
                  Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  BorderRadius _borderMethod(String langCode) {
    return langCode == 'ar'
        ? const BorderRadius.only(
          topLeft: Radius.circular(16),
          bottomLeft: Radius.circular(16),
        )
        : const BorderRadius.only(
          topRight: Radius.circular(16),
          bottomRight: Radius.circular(16),
        );
  }
}
