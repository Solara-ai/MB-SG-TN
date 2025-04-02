part of '../detail_task_bloc.dart';
class PageState {
  final bool showLoading;
  final String title;
  final String description;
  final String epicName;
  final String status ;
  
  PageState({
    this.showLoading = false,
     this.title = '',
     this.description= '',
     this.epicName= '',
     this.status= '',
  });

  PageState copyWith({
    bool ? showLoading ,
    String? title,
    String? description,
    String? epicName,
    String? status,
  }) {
    return PageState(
      showLoading: showLoading ?? this.showLoading,
      title: title ?? this.title,
      description: description ?? this.description,
      epicName: epicName ?? this.epicName,
      status: status ?? this.status,
    );
  }

}