import 'package:ecommerce/futures/account/presentation/pages/account/manger/account_controller.dart';
import 'package:ecommerce/futures/authentication/presentation/manger/auth_controller.dart';
import 'package:ecommerce/futures/home/presentation/pages/main/manger/main_controller.dart';
import 'package:ecommerce/futures/splash/presentation/manger/splash_controller.dart';
import 'package:get/get.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => AccountController());

  }

}