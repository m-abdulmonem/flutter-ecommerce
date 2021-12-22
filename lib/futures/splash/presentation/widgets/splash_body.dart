import '../manger/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashBody extends GetWidget<SplashController> {
  const SplashBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/image/content.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: Get.height *.1),
            child: Text(
              'SCANNING',
              style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontSize: 14,
                color: const Color(0xffffffff),
                letterSpacing: 8.12,
              ),
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }
}
