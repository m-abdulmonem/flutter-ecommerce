import 'package:ecommerce/futures/account/presentation/pages/account/account_view.dart';
import 'package:ecommerce/futures/cart/presentation/cart_view.dart';
import 'package:ecommerce/futures/home/presentation/pages/home/home_view.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MainController extends GetxController{
  int selectedIndex = 0;
  List views = [
    HomeView(),
    CartView(),
    AccountView(),
  ];

  @override
  void onInit() {

    super.onInit();
  }

  void selectIndex(int index){
    selectedIndex = index;
    update();
  }

}