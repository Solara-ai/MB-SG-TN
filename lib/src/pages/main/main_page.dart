import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/base/base_page.dart';

class MainPage extends BasePage {
    @override
    _MainPageState createState () => _MainPageState();
}

class _MainPageState extends BaseState<MainPage> {
    @override
  Widget build(BuildContext context) {
    return  Scaffold(
       backgroundColor: R.color.white,
      body : Drawer(
        child: ListView(
          children: [
            // DrawerHeader(child: )
          ],
        ),
      )
    );
  }

  
  
  // Widget buildItemTitle (Widget icon , String title , ) {
  //   return ListTile(
      
  //   )
  // }

  // Widget buildHeader () {
  //   return 
  // }

  // Widget _buildDrawerHe
}

enum PageItem {
    Home, 
    Taskmanage,
    Schedule, 
    PlanTodo,
    Settings, 
    Logout,
    
}