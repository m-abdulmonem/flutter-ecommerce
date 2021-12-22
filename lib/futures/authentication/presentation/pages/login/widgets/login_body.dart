import 'package:ecommerce/core/lib/custom_widgets.dart';
import 'package:ecommerce/futures/authentication/presentation/pages/login/widgets/facebook_button.dart';
import 'package:ecommerce/futures/authentication/presentation/pages/login/widgets/form.dart';
import 'package:ecommerce/futures/authentication/presentation/pages/login/widgets/google_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../manger/auth_controller.dart';

class LoginBody extends GetWidget<AuthController> {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: Get.height *.1),
      children: [
        LoginForm(),
        VerticalSpace(40),
        CustomText("-OR-",width: Get.width,textAlign: TextAlign.center,),
        VerticalSpace(40),
        FacebookButton(),
        VerticalSpace(30),
        GoogleButton()
      ],
    );
  }
}
