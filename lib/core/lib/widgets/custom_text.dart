import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String data;
  final Color? color;
  final double? fontSize,width;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  CustomText(this.data,
      {Key? key,
      this.color = const Color(0xff000000),
      this.fontSize = 14,
      this.fontWeight = FontWeight.w100,
      this.textAlign = TextAlign.left, this.width, this.onTap, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:  Container(
        padding: padding,
        width: width,
        child: Text(
          data,
          style: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: fontSize,
            color: color,
            fontWeight: FontWeight.w700,
          ),
          textAlign: textAlign,
        ),
      ),
    );
  }
}
