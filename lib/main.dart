import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:whatsup/component/theme.dart';
import 'package:whatsup/constance/whatsup_color.dart';
import 'package:whatsup/model/usermodel.dart';
import 'package:whatsup/view/contact_list.dart';
import 'package:whatsup/view/main_screen.dart';

void main() async {

  await Hive.initFlutter();
  
  Hive.registerAdapter(UserModelAdapter());
  
  runApp( MyApp()); 

}

class MyApp extends StatelessWidget {
  
  var isDarkMode = false;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: isDarkMode?darkMode():lightMode(),
      home:MainScreen(),
    );
  }
}

