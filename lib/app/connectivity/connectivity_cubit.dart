import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

/// state = true -> online, false -> offline
class ConnectivityCubit extends Cubit<bool> {
  late final StreamSubscription _connSub;
  late final StreamSubscription _internetSub;

  ConnectivityCubit() : super(true) {
    _checkInternet(); // initial
    // React to transport changes (wifi/mobile)
    _connSub = Connectivity().onConnectivityChanged.listen((_) => _checkInternet());
    // React to real internet reachability
    _internetSub = InternetConnectionChecker().onStatusChange.listen((status) {
      emit(status == InternetConnectionStatus.connected);
    });
  }

  Future<void> _checkInternet() async {
    final ok = await InternetConnectionChecker().hasConnection;
    emit(ok);
  }

  @override
  Future<void> close() async {
    await _connSub.cancel();
    await _internetSub.cancel();
    return super.close();
  }
}
