import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class CheckNetworkConnection {
  Future<bool> get isConnected;
}

class CheckNetworkConnectionImp extends CheckNetworkConnection {
  final InternetConnectionChecker internetConnectionChecker;
  CheckNetworkConnectionImp(this.internetConnectionChecker);
  @override
  Future<bool> get isConnected => internetConnectionChecker.hasConnection;
}
