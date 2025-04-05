import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/user/send_feed_back_usecase.dart';
import 'package:schedule_gen_and_time_management/src/base/base_bloc.dart';

part 'bloc/page_action.dart';
part 'bloc/page_event.dart';
part 'bloc/page_state.dart';

class FeedBackBloc extends BaseBloc<PageAction, PageEvent, PageState> {
  final SendFeedBackUsecase _sendFeedBackUsecase = GetIt.I<SendFeedBackUsecase>();

  FeedBackBloc() : super(PageState()) {
    on<EventDetailMesage>(_onEventDetailMesage);
    on<SendFeddBack>(_handleEventSend);
  }

  Future<void> _onEventDetailMesage(EventDetailMesage event, Emitter emit) async {
    emit(state.copyWith(message: event.message));
  }

  Future<void> _handleEventSend(SendFeddBack event, Emitter emit) async {
    emit(state.copyWith(showLoading: true));
    final result = await _sendFeedBackUsecase.call((message: state.message));

    result.when(
        success: (data) {
          addAction(ActionSendSuccess());
          emit(state.copyWith(showLoading: false));
        },
        failure: (error) {});
  }
}
