import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:whatsup/component/text_style.dart';
import 'package:whatsup/constance/whatsup_color.dart';
import 'package:whatsup/controller/user_contact_controller.dart';
import 'package:whatsup/gen/assets.gen.dart';
import 'package:whatsup/model/usermodel.dart';

class ContactListScreen extends StatelessWidget {
  ContactListScreen({Key? key}) : super(key: key);

  UserContactController userContactController =
      Get.put(UserContactController());
  int editIndex = -1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(hintText: "@name"),
              controller: userContactController.userTextEditingController,
            ),
            TextField(
              decoration: const InputDecoration(hintText: "@phone"),
              controller: userContactController.phoneTextEditingController,
            ),
            ElevatedButton(
                onPressed: (() {
                  userContactController.addToContact();
                }),
                child: Text("add contact")),
            ElevatedButton(
                onPressed: (() {
                  userContactController.editContact(editIndex);
                }),
                child: Text("Update")),
            SizedBox(
              child: Obx(
                (() => ListView.builder(
                      shrinkWrap: true,
                      itemCount: userContactController.contactList.length,
                      itemBuilder: (context, index) {
                        GestureDetector(onTap: () {
                          userContactController
                                  .phoneTextEditingController.text =
                              userContactController.contactList[index].phone;
                          userContactController.userTextEditingController.text =
                              userContactController.contactList[index].name;
                          editIndex = index;
                        });
                        return contactItem(index);
                      },
                    )),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget contactItem(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(image: Image.asset(Assets.image.avatar.path).image),
                ),
              ),
              SizedBox(width: 12,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userContactController.contactList[index].name,style: usernameTextStyle,),
                  Text("data",style: messageTextStyle,),
                ],
              )
            ],
          )
           
          , Column(children: [
              Text("17:45",style: timeTextStyle,),
                  Text("data",style: messageTextStyle,),
                  Container(
                    height: 18,
                    width: 18,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: badg,
                    ),
                    child: Center(child: Text("1"),),
                  )
           ],)
        ]
      ),
    );
  }
}
