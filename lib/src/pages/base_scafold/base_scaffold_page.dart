import 'package:flutter/material.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';
import 'package:schedule_gen_and_time_management/src/pages/drawer/drawer_base.dart';


class BaseScaffoldPage extends BasePage {
  final AppBar? appbar;
  final Widget? body;
  final Widget? floatingActionButton;
  const BaseScaffoldPage({this.appbar, this.body, this.floatingActionButton, super.key});
  @override
  _BaseScaffoldState createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends BaseState<BaseScaffoldPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appbar,
      drawer: DrawerBase(),
      backgroundColor: R.color.white,
      body: widget.body,
      floatingActionButton: widget.floatingActionButton,
    );
  }
}
