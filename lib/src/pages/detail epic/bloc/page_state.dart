part of '../detail_epic_bloc.dart';

class PageState {
  final bool showLoading;
  final ListTask  listTask;
  final Epic epic;
  final String idTask;

  PageState({
    this.idTask = '',
    this.showLoading = false,
    ListTask? listTask,
    Epic? epic,
  }) : epic = epic ?? Epic(id: '', nameEpic: '', descriptionEpic: '', type: ''),
        listTask = listTask ?? ListTask(epicId: '' , epicName: '' , description: '' , tasks: []); 

  PageState copyWith({
    String ? idTask,
    bool? showLoading,
    ListTask? listTask,
    Epic? epic,
  }) {
    return PageState(
      idTask: idTask ?? this.idTask,
      showLoading: showLoading ?? this.showLoading,
      listTask: listTask ?? this.listTask,
      epic: epic ?? this.epic,
    );
  }
}
