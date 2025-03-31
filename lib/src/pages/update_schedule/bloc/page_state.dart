part of '../update_schedule_bloc.dart';

class PageState {
  final String name;
  final String updateType;
  final String description;
  final DateTime date;
  final String repeat;
  final bool remindMe;
  final String scheduleId;
  final DateTime repeatEnddate;
  final String categoryId;
  final String eventId;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final List<Category> listCategory;
  final Category ? category ;
  final bool showLoading;
   PageState(
      {this.name = '',
      this.description = '',
      DateTime? date,
      this.repeat = '',
      this.eventId = '',
      DateTime? repeatEnddate,
      this.remindMe = false,
      this.updateType = 'THIS',
      this.scheduleId = '',
      this.categoryId = '',
      this.showLoading = false ,
      TimeOfDay? startTime,
      TimeOfDay? endTime,
      this.category,
      List<Category>? listCategory})
      : repeatEnddate = repeatEnddate ?? DateTime(2090),
        date = date ?? DateTime(2025),
        startTime = startTime ?? TimeOfDay(hour: 10, minute: 10),
        endTime = endTime ?? TimeOfDay(hour: 10, minute: 10),
        listCategory = listCategory ?? []; 

   PageState coppyWith(
      {String? name,
      String? description,
      String? updateType,
      DateTime? date,
      String ? scheduleId,
      String? repeat,
      String ? eventId,
      DateTime? repeatEnddate,
      bool? remindMe,
      String? categoryId,
      TimeOfDay? startTime,
      TimeOfDay? endTime,
      Category ? categor,
      bool ? showLoading,
      List<Category>? listCategory}) {
    return PageState(
        scheduleId: scheduleId ?? this.scheduleId,
        updateType: updateType ?? this.updateType,
        name: name ?? this.name,
        description: description ?? this.description,
        date: date ?? this.date,
        repeat: repeat ?? this.repeat,
        remindMe: remindMe ?? this.remindMe,
        categoryId: categoryId ?? this.categoryId,
        category: categor ?? this.category,
        startTime: startTime ?? this.startTime,
        repeatEnddate: repeatEnddate ?? this.repeatEnddate,
        endTime: endTime ?? this.endTime,
        eventId: eventId ?? this.eventId,
        showLoading: showLoading ?? this.showLoading,
        listCategory: listCategory ?? this.listCategory);
  }
}