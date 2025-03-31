part of '../add_category_bloc.dart';


class PageState {
  final String nameCategory;
  final Color selectedColor;
  final bool showLoading;

  PageState({this.nameCategory = '', Color? selectedColor , this.showLoading = false})
      : selectedColor = selectedColor ?? Colors.blue;

  PageState coppyWith({String? nameCategory, Color? selectedColor, String? colorCode , bool ? showLoading}) {
    return PageState(
        nameCategory: nameCategory ?? this.nameCategory,
        selectedColor: selectedColor ?? this.selectedColor,);
  }
}
