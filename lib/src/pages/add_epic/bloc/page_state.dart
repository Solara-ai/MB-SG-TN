part of '../add_epic_bloc.dart';

class PageState {
  final String name;
  final String description;
  final String type;
  final bool showLoading;

  PageState({this.name = '', this.description = '', this.type = '', this.showLoading = false});

  PageState copyWith({String? name, String? description, String? type, bool? showloading}) {
    return PageState(
        name: name ?? this.name,
        description: description ?? this.description,
        showLoading: showloading ?? this.showLoading);
  }
}
