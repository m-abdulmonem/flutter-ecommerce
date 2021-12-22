import 'package:ecommerce/core/lib/custom_widgets.dart';
import 'package:ecommerce/futures/authentication/presentation/manger/auth_controller.dart';
import 'package:ecommerce/futures/authentication/presentation/pages/register/register_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LoginForm extends GetWidget<AuthController> {
  final GlobalKey<FormState> _authForm = GlobalKey<FormState>();

  LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14),
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      width: Get.width,
      child: Column(
        children: [
          Row(
            children: [
              CustomText(
                "Welcome",
                fontSize: 30,
              ),
              Spacer(),
              CustomText(
                "Sign up",
                onTap: ()=> Get.to(() => RegisterView()),
                color: ColorPrimary,
              )
            ],
          ),
          VerticalSpace(20),
          CustomText(
            "Sign in to Continue",
            color: Color(0xff929292),
            textAlign: TextAlign.left,
            width: Get.width,
          ),
          VerticalSpace(30),
          Form(
            key: _authForm,
              child: Column(
                children: [
                  CustomInput(
                    hint: "example@gmail.com",
                    label: "Email",
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
                  CustomButton(text: "SIGN IN",onTap: () => controller.login(_authForm),),
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
    );
  }
}
