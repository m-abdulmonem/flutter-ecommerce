import 'package:ecommerce/core/lib/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../manger/account_controller.dart';
class AccountBody extends GetWidget<AccountController> {
  const AccountBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: Get.height *.1),
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/image/avatar.png",),
              radius: Get.width *.1,
            ),
            HorizontalSpace(Get.width*.1),
            Container(
              child:    Column(
                children: [
                  CustomText(controller.profile.displayName ?? "user 55454", color: Colors.black,fontSize: 21,textAlign: TextAlign.start,),
                  CustomText(controller.profile.email!, color: Colors.black,fontSize: 15,),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
