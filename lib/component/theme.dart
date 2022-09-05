

import 'package:flutter/material.dart';
import 'package:whatsup/constance/whatsup_color.dart';


ThemeData lightMode(){
  return 
   ThemeData(
    appBarTheme: AppBarTheme(color: whatsupColor),
    scaffoldBackgroundColor: lightScaffoldBackgroundColor,
); 
}

ThemeData darkMode(){
  return 
   ThemeData(
    appBarTheme: AppBarTheme(color: whatsupColor),
    scaffoldBackgroundColor: DarkScaffoldBackgroundColor,
); 
}

