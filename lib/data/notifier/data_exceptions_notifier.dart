import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/network_exceptions.dart';

class DataExceptionNotifier {
  final StreamController<NetworkExceptions> _actionStreamController = PublishSubject();

  void addEvent(NetworkExceptions action) {
    _actionStreamController.add(action);
  }

  StreamSubscription<NetworkExceptions> listenEvent(Function(NetworkExceptions action)? onData) {
    return _actionStreamController.stream.listen(onData);
  }
}
