part of '../add_category_bloc.dart';

sealed class PageEvent {}

class EventUserChangeCategoryName extends PageEvent{
  String ? cateGoryName ;
  EventUserChangeCategoryName({this.cateGoryName});
}

class EventUserChangeColorCategory extends PageEvent {
  String ? colorCode ;
  EventUserChangeColorCategory ({this.colorCode});
}

class EventUserSelectedColor extends PageEvent {
  Color ? color ;
  EventUserSelectedColor ({this.color});
}

class EventUserAddCategory extends PageEvent {}