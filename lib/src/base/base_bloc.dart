import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/subjects.dart';

abstract class BaseBloc<A, E, S> extends Bloc<E, S> {
  // cần phải chú ý đoạn này để có thể sử dụng được Bloc 
  BaseBloc(super.initialState);

  final StreamController<A> _actionStreamController = PublishSubject();

  void addAction(A action) {
    _actionStreamController.add(action);
  }
  // hàm này được sử dụng để lắng nghe những action để UI có thể dựa vào action đó và buid Ui tương ứng 
  StreamSubscription<A> listenAction(Function(StreamSubscription sub)? cancelSubOnDispose, Function(A action)? onData) {
    final sub = _actionStreamController.stream.listen(onData);
    // sub được sử dụng để đăng ký 1 subcription trên 1 StreamController (dùng để lắng nghe luồng dữ liệu được thêm vào)
    cancelSubOnDispose?.call(sub);
    // cancelSubDispose được sử dụng để thêm 1 subCripTion vào list<StreamSupCription>
    return sub;
  }
}
