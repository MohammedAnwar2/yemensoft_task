import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yemensoft_task/features/orders/presentation/pages/orders_view.dart';
import 'package:yemensoft_task/features/login/presentation/pages/login_view.dart';
import 'package:yemensoft_task/features/splash/presentation/pages/splash_view.dart';

// GoRouter configuration
abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      // GoRoute(
      //   path: SplashView.routeName,
      //   builder: (context, state) => const SplashView(),
      // ),
      GoRoute(
        path: LoginView.routeName,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: OrdersView.routeName,
        builder: (context, state) => const OrdersView(),
      ),
    ],
  );
}
