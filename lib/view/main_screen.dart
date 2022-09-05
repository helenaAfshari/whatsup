
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return SafeArea(child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
           IconButton(
            onPressed: () {
              log("searsh");
            },
            icon: const Icon(Icons.search)),
             IconButton(
              onPressed:  () {
                log("menu");
              },
              icon: const Icon(Icons.menu)),
        ],
        title: Text("WhatsUp"),
      ),
      body: Column(
        children: [
          Container(
            child: Row(
              children: [
                Icon(Icons.camera,color: Colors.white,),
                
              ],
            ),
          )
        ],
      ),
     ),
     );
  }
}