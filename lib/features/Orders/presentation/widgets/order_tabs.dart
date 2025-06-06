import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemensoft_task/core/services/get_it/get_it_imports.dart';
import 'package:yemensoft_task/core/services/session_manager.dart';
import 'package:yemensoft_task/core/utils/app_colors.dart';
import 'package:yemensoft_task/core/utils/app_text_style.dart';
import 'package:yemensoft_task/features/localization/app_localizations.dart';

import '../cubit/orders_cubit/orders_cubit.dart';

class OrdersTabs extends StatefulWidget {
  const OrdersTabs({super.key});

  @override
  State<OrdersTabs> createState() => _OrdersTabsState();
}

class _OrdersTabsState extends State<OrdersTabs> {
  int selectedIndex = 0;
  final sessionManager = getIt<SessionManager>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 77, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: FadeInRight(
        animate: true,
        child: Row(
          children: [
            _buildTab(title: '11'.tr(context), index: 0),
            _buildTab(title: '12'.tr(context), index: 1),
          ],
        ),
      ),
    );
  }

  Widget _buildTab({required String title, required int index}) {
    final isSelected = selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          sessionManager.resetSessionTimer(context);
          setState(() {
            selectedIndex = index;
            if (selectedIndex == 0 && !isSelected) {
              context.read<OrdersCubit>().getNewBills();
            }
            if (selectedIndex == 1 && !isSelected) {
              context.read<OrdersCubit>().getOtherBills();
            }
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.darkCyanBlue : AppColors.transparent,
            borderRadius: BorderRadius.circular(30),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: AppTextStyle.semiBold14.copyWith(
              color: isSelected ? AppColors.white : AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
