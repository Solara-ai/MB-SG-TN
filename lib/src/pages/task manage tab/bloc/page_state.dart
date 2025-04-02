part of '../task_manage_tab_bloc.dart';

class PageState {
  final bool showLoading ;
  final List<Epic> epicList;
  final String ? type ;
  final String  epicId;

  PageState({
    this.showLoading = false,
    this.epicList = const [],
    this.type,
    this.epicId = ''
  });

  PageState copyWith({
    bool ? showLoading,
    List<Epic> ? epicList,
    String ? type,
    String ? epicId
  }) {
    return PageState(
      epicId: epicId ?? this.epicId,
      showLoading: showLoading ?? this.showLoading,
      epicList: epicList ?? this.epicList,
      type: type ?? this.type,
    );
  }
}