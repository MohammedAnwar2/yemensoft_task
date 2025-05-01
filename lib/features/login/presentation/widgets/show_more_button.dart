import 'package:flutter/material.dart';
import 'package:yemensoft_task/core/utils/app_text_style.dart';
import 'package:yemensoft_task/features/localization/app_localizations.dart';

class ShowMoreButton extends StatelessWidget {
  const ShowMoreButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: TextButton(
        child: Text('5'.tr(context), style: AppTextStyle.semiBold14),
        onPressed: () {},
      ),
    );
  }
}