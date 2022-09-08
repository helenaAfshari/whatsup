import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:whatsup/component/text_style.dart';
import 'package:whatsup/constance/whatsup_color.dart';

class MainScreen extends StatelessWidget {
   MainScreen({Key? key}) : super(key: key);
  RxInt selectedTapIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    var tabSize = Get.width/4;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  log("searsh");
                },
                icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  log("menu");
                },
                icon: const Icon(Icons.menu)),
          ],
          title: Text("WhatsUp"),
        ),
        body: Column(
          children: [
            Container(
              height: 35,
              color: whatsupColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    
                    child: Icon(
                      Icons.camera,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                   
                      height: 34,
                  
                      child: Center(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: tabTitleList.length,
                        itemBuilder:(context, index) => 
                        GestureDetector(
                          onTap: () {
                             selectedTapIndex.value = index;
                          }, 
                          child: SizedBox(
                            width: tabSize,
                            child:
                           Center(child: Text(tabTitleList[index],style: unselectedTabBarTextStyle,))),
                        ),
                          ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<String> tabTitleList = ['CHATS','STATUSE','CALLS'];
