
part of '../add_task_bloc.dart';

class PageState {
  final String title;
  final String description;
  final String epicId;

  PageState({
     this.title = '',
     this.description = '',
     this.epicId = ' ',
  });

  PageState copyWith({
    String? title,
    String? description,
    String? epicId,
  }) {
    return PageState(
      title: title ?? this.title,
      description: description ?? this.description,
      epicId: epicId ?? this.epicId,
    );
  }
}