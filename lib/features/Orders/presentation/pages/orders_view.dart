import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemensoft_task/core/services/get_it/get_it_imports.dart';
import 'package:yemensoft_task/core/services/session_manager.dart';
import 'package:yemensoft_task/features/orders/presentation/cubit/orders_cubit/orders_cubit.dart';
import 'package:yemensoft_task/features/orders/presentation/widgets/orders_view_body.dart';

class OrdersView extends StatefulWidget {
  static const String routeName = '/orders';
  const OrdersView({super.key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> with WidgetsBindingObserver {
  final sessionManager = getIt<SessionManager>(); 
  @override
  void initState() {
     WidgetsBinding.instance.addObserver(this);
    sessionManager.startSessionTimer(context);
    super.initState();
  }

  @override
  void dispose() {
     WidgetsBinding.instance.removeObserver(this);
    sessionManager.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      sessionManager.startSessionTimer(context);
    } else if (state == AppLifecycleState.resumed) {
      sessionManager.resetSessionTimer(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: () => sessionManager.resetSessionTimer(context),
      child: Scaffold(
        body: BlocProvider(
          create: (context) => getIt<OrdersCubit>()..saveBills(),
          child: OrdersViewBody(),
        ),
      ),
    );
  }
}
