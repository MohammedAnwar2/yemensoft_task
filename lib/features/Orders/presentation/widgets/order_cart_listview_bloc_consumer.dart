import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:yemensoft_task/core/utils/app_colors.dart';
import 'package:yemensoft_task/features/orders/presentation/cubit/orders_cubit/orders_cubit.dart';
import 'package:yemensoft_task/features/orders/presentation/widgets/no_order_yet_widget.dart';
import '../../../../core/dummy_data/orders_dummy_data.dart';
import 'order_card_listview.dart';

class OrderCartListViewBlocConsumer extends StatelessWidget {
  const OrderCartListViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersCubit, OrdersState>(
      listener: (context, state) {
        if (state is OrdersError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: AppColors.red),
          );
          context.read<OrdersCubit>().getNewBills();
        }
        if (state is OrdersSavedLocaly) {
          context.read<OrdersCubit>().getNewBills();
        }
      },
      builder: (context, state) {
        if (state is OrdersEmpty) {
          return const NoOrdersYetWidget();
        } else if (state is OrdersLoaded) {
          return OrderCardListView( key: UniqueKey(),deliveryBillEntities: state.bills);
        } else {
          return Skeletonizer(
            enabled: true,
            child: OrderCardListView(deliveryBillEntities: dummyOrderBills),
          );
        }
      },
    );
  }
}
