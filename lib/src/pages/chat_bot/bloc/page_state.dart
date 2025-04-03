part of '../chat_bot_bloc.dart';

class PageState {
  final HistoryMesssage? historyMessage;
  final bool isShowloading;
  final bool loadingAiReply;
  final String messageAI;
  PageState(
      {this.historyMessage,
      this.isShowloading = false,
      this.loadingAiReply = false,
      this.messageAI = ''});
  PageState copyWith(
      {HistoryMesssage? historyMessage,
      bool? ishowLoading,
      bool? loadingAiReply,
      String? messageAI}) {
    return PageState(
        messageAI: messageAI ?? this.messageAI,
        historyMessage: historyMessage ?? this.historyMessage,
        isShowloading: ishowLoading ?? this.isShowloading,
        loadingAiReply: loadingAiReply ?? this.loadingAiReply);
  }
}
