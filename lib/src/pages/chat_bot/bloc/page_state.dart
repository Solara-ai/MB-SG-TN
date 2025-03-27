part of '../chat_bot_bloc.dart';

class PageState {
  final HistoryMesssage? historyMessage;
  final bool isShowloading;
  final bool loadingAiReply;
  PageState({this.historyMessage , this.isShowloading = false , this.loadingAiReply = false});
  PageState copyWith(
      {HistoryMesssage? historyMessage, bool ? ishowLoading , bool ? loadingAiReply
     }) {
    return PageState(
        historyMessage: historyMessage ?? this.historyMessage,
        isShowloading: ishowLoading ?? this.isShowloading,
        loadingAiReply: loadingAiReply ?? this.loadingAiReply
      );
  }
}
