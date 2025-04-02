part of '../home_bloc.dart';
sealed class PageAction {

}


class ActionLoaddedDataFaild extends PageAction {
    String messsage ;
    ActionLoaddedDataFaild({required this.messsage});
}


// class ActionGoto