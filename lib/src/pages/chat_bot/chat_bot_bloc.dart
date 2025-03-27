import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/domain/model/history_messsage.dart';
import 'package:schedule_gen_and_time_management/domain/model/message_user_and_ai.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/auth/session_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/chat/history_chat_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/chat/user_chat_usecase.dart';
import 'package:schedule_gen_and_time_management/src/base/base_bloc.dart';

part 'bloc/page_action.dart';
part 'bloc/page_event.dart';
part 'bloc/page_state.dart';

class ChatBotBloc extends BaseBloc<PageAction, PageEvent, PageState> {
  final _historyChatUseCase = GetIt.I<HistoryChatUsecase>();
  final _userChatUsercase = GetIt.I<UserChatUsecase>();
  final _sessionUseCase = GetIt.I<SessionUsecase>();
  ChatBotBloc() : super(PageState()) {
    on<EventInitialize>(_hanDleEventInitialize);
    on<EventUserSendMessage>(_handleUserSendMessage);
    _initialize();
  }

  void _initialize() {
    add(EventInitialize());
  }

  Future<void> _hanDleEventInitialize(EventInitialize event, Emitter emit) async {
    emit (state.copyWith(ishowLoading: true));
    final String user_Id = _sessionUseCase.userId ?? '';
    final result = await _historyChatUseCase.call((id: user_Id));
    result.when(success: (data) {
      emit(state.copyWith(historyMessage: data , ishowLoading: false));
    }, failure: (error) {
      emit (state.copyWith(ishowLoading: false));
    });
  }

  Future<void> _handleUserSendMessage(EventUserSendMessage event, Emitter emit) async{
    final updateListMessage = state.historyMessage?.message ?? [] ..add(MessageUserAndAi(text: event.message, reply: ''),);
    emit(state.copyWith(historyMessage: HistoryMesssage(message: updateListMessage),  loadingAiReply: true));
    final result = await _userChatUsercase.call((id_user: _sessionUseCase.userId ?? '' , message: event.message));
    result.when(success: (data) {
        final MessageUserAndAi messageAireply = data.message.last;
        final updateListMessage = state.historyMessage?.message ?? [] ..add(MessageUserAndAi(text: '' , reply: messageAireply.reply)); 
        addAction(ActionSendMessageSuccess());
        emit(state.copyWith(historyMessage: HistoryMesssage(message:  updateListMessage), loadingAiReply: false));
    }, failure: (error){
       addAction(ActionSendMessageFaild(message: error.errorMessage));
    });
  }
}
