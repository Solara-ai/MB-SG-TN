part of '../performance_evaluation_bloc.dart';
sealed class PageAction {
}

class ActionLoaddataFaild extends PageAction{

  String message ;

  ActionLoaddataFaild({required this.message});
}
