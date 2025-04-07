part of '../add_event_bloc.dart';

class PageState {
  final String name;
  final String description;
  final DateTime date;
  final String repeat;
  final bool remindMe;
  final DateTime repeatEnddate;
  final String categoryId;
  final bool showLoading;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final List<Category> listCategory;
  final Category ? category;
  final bool showDateFormFiledRepet ;
  final String messageGenAi;

  PageState(
      {this.name = '',
      this.showLoading = false,
      this.messageGenAi = '',
      this.category,
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
      : repeatEnddate = repeatEnddate ?? DateTime.now().add(Duration(days: 1)),
        date = date ?? DateTime.now(),
        startTime = startTime ?? TimeOfDay.fromDateTime(DateTime.now()),
        endTime = endTime ?? TimeOfDay.fromDateTime(DateTime.now()),
        listCategory = listCategory ?? []; 
      

  PageState coppyWith(
      {String? name,
      bool? showLoading,
      Category ? category,
      String? messageGenAi,
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
        category: category ?? this.category,
        showLoading: showLoading ?? this.showLoading,
        messageGenAi: messageGenAi ?? this.messageGenAi,
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
