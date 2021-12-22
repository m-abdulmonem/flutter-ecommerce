import 'package:ecommerce/core/lib/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../manger/category_controller.dart';
class CategoryBody extends GetWidget<CategoryController> {
  const CategoryBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemBuilder: (_,int index){
          return Container(
            child: Column(
              children: [
                Image.asset("assets/image/logo.png"),
                CustomText("BeoPlay Speaker",color: Colors.black,),
                CustomText("Bang and Olufsen",color: Color(0xff929292),),
                CustomText("\$755",color: ColorPrimary,)
              ],
            ),
          );
        });
  }
}
