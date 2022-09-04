

import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:hive/hive.dart';
import 'package:whatsup/constance/hive_keys.dart';

import 'package:whatsup/model/usermodel.dart';

class UserContactController extends GetxController{


        TextEditingController userTextEditingController = TextEditingController();
        TextEditingController phoneTextEditingController = TextEditingController();

        RxList<UserModel> contactList = RxList();

           @override
             onInit()async{
              super.onInit();
             await readContact();
            
             }

          // داخل یک متد گذاشتیم که همزمان هم بتونیم اضافه کنیم هم بخونیم
        addToContact()async{

          //add user to box
          var box = await Hive.openBox(HiveFieldConstant.userContactListBox);


          var user =UserModel(
            name: userTextEditingController.text,
            phone: phoneTextEditingController.text,
            profileUser: "profileUser");

            box.add(user);
            box.clear();
             

            //read user from box
            box.values.forEach((element) {
              UserModel userModel= element;
              contactList.add(element);
              print(element);
            });

        }
        readContact()async{
          var box = await Hive.openBox(HiveFieldConstant.userContactListBox);
             box.values.forEach((element) {
              UserModel userModel= element;
              contactList.add(element);
              print(element);
            });
        }

        editContact(int index)async{

             var box = await Hive.openBox(HiveFieldConstant.userContactListBox);
             
              UserModel userModel = box.getAt(index);
              userModel.name = userTextEditingController.text;
              userModel.phone = phoneTextEditingController.text;
              userModel.save();

              contactList.clear();
              //read contact
              readContact();
             
             
        }

}