import 'package:ecommerce/core/lib/custom_widgets.dart';
import 'package:ecommerce/futures/home/presentation/pages/main/manger/main_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainView extends StatelessWidget {
  MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainController>(
        builder: (controller){
          return controller.views.elementAt(controller.selectedIndex);
        },
      ),
      bottomNavigationBar: GetBuilder<MainController>(
        builder: (controller) =>  BottomNavigationBar(
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),
          selectedItemColor: Colors.black,
          selectedFontSize: 18,
          unselectedLabelStyle: TextStyle(color: Colors.transparent, fontSize: 0),
          currentIndex: controller.selectedIndex,
          onTap: (index) => controller.selectIndex(index),
          items: [
            BottomNavigationBarItem(
              activeIcon: CustomText("Explore"),
                icon: Image.asset("assets/image/Icon_explore.png"),
                label: controller.selectedIndex ==0 ? "." :""),
            BottomNavigationBarItem(
                activeIcon: CustomText("Cart"),
                icon: Image.asset("assets/image/Icon_cart.png"),
                label: controller.selectedIndex ==1 ? "." :""),
            BottomNavigationBarItem(
                activeIcon: CustomText("Account"),
                icon: Image.asset("assets/image/Icon_user.png"),
                label:  controller.selectedIndex ==2 ? ".": ""),
          ],
        ),
      ),
    );
  }
}
