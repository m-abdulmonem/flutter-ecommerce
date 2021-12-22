import 'package:ecommerce/core/lib/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap, onLongTap;
  const CustomButton({Key? key, required this.text, this.onTap, this.onLongTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongTap,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        decoration: BoxDecoration(
          color: ColorPrimary,
          border: Border(

          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: CustomText(
          text,
          fontSize: 20,
          width: Get.width,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
