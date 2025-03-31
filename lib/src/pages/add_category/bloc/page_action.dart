part of '../add_category_bloc.dart';
sealed class PageAction {
}

class ActionAddCategorySuccess extends PageAction {}

class ActionAddCategoryFaild extends PageAction {
  String error ;
  ActionAddCategoryFaild ({required this.error});
}