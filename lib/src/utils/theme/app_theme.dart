import 'package:flutter/material.dart';

class AppThemeData {
  
   static ThemeData themeData (Brightness brightness) {
    bool darkmode = brightness == Brightness.dark;
     return  darkmode ? ThemeData(
        brightness: Brightness.dark,

      )
      :
      ThemeData(
        brightness: Brightness.light,
      );
   }
}