import 'package:ecommerce/core/lib/custom_widgets.dart';

import '../../../manger/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterBody extends GetWidget<AuthController> {
  final GlobalKey<FormState> _authForm = GlobalKey<FormState>();
  RegisterBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: Get.height*.1),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 14),
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
              width: Get.width,
              child: Column(
                children: [
                  CustomText(
                    "Sign Up",
                    fontSize: 30,
                  ),
                  VerticalSpace(30),
                  Form(
                    key: _authForm,
                      child: Column(
                    children: [
                      CustomInput(
                        hint: "David Spade",
                        label: "Name",
                        labelColor: Color(0xff000000).withOpacity(1),
                        onSave: (val) => controller.name = val!,
                      ),
                      VerticalSpace(30),
                      CustomInput(
                        hint: "example@gmail.com",
                        label: "Email",
                        inputType: TextInputType.emailAddress,
                        labelColor: Color(0xff000000).withOpacity(1),
                        onSave: (val) => controller.email = val!,
                      ),
                      VerticalSpace(30),
                      CustomInput(
                        hint: "*********",
                        obscureText: true,
                        label: "Password",
                        labelColor: Color(0xff000000).withOpacity(1),
                        onSave: (val) => controller.password = val!,
                        textInputAction: TextInputAction.done,
                      ),
                      VerticalSpace(20),
                      CustomText(
                        "Forget Password ?",
                        textAlign: TextAlign.end,
                        width: Get.width,
                        fontWeight: FontWeight.normal,
                      ),
                      VerticalSpace(20),
                      CustomButton(text: "SIGN IN",onTap: ()=>controller.register(_authForm),),
                    ],
                  ))
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x0d242424),
                    offset: Offset(0, 5),
                    blurRadius: 15,
                  ),
                ],
              ),
            )
          ]),
    );
  }
}
