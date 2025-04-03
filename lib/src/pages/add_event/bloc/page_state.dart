part of '../add_event_bloc.dart';

class PageState {
  final String name;
  final String description;
  final DateTime date;
  final String repeat;
  final bool remindMe;
  final DateTime repeatEnddate;
  final String categoryId;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final List<Category> listCategory;
  final bool showDateFormFiledRepet ;

  PageState(
      {this.name = '',
      this.description = '',
      DateTime? date,
      this.showDateFormFiledRepet = false,
      this.repeat = '',
      DateTime? repeatEnddate,
      this.remindMe = false,
      this.categoryId = '',
      TimeOfDay? startTime,
      TimeOfDay? endTime,
      List<Category>? listCategory})
      : repeatEnddate = repeatEnddate ?? DateTime(2090),
        date = date ?? DateTime(2025),
        startTime = startTime ?? TimeOfDay(hour: 10, minute: 10),
        endTime = endTime ?? TimeOfDay(hour: 10, minute: 10),
        listCategory = listCategory ?? []; 
      

  PageState coppyWith(
      {String? name,
      bool ? showDateFormFiledRepet,
      String? description,
      DateTime? date,
      String? repeat,
      DateTime? repeatEnddate,
      bool? remindMe,
      String? categoryId,
      TimeOfDay? startTime,
      TimeOfDay? endTime,
      List<Category>? listCategory}) {
    return PageState(
        showDateFormFiledRepet: showDateFormFiledRepet ?? this.showDateFormFiledRepet,
        name: name ?? this.name,
        description: description ?? this.description,
        date: date ?? this.date,
        repeat: repeat ?? this.repeat,
        remindMe: remindMe ?? this.remindMe,
        categoryId: categoryId ?? this.categoryId,
        startTime: startTime ?? this.startTime,
        repeatEnddate: repeatEnddate ?? this.repeatEnddate,
        endTime: endTime ?? this.endTime,
        listCategory: listCategory ?? this.listCategory);
  }
}
