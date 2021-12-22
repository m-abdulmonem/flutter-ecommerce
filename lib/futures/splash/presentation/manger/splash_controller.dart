import 'dart:async';
import 'package:ecommerce/core/helper/authentication.dart';
import 'package:ecommerce/futures/authentication/presentation/pages/login/login_view.dart';
import 'package:ecommerce/futures/home/presentation/pages/main/main_view.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final int _seconds = 3;
  @override
  void onInit() {
    _timer();
    super.onInit();
  }

  _timer() {
    Timer(
        Duration(seconds: _seconds),
        () => auth.storage.isLoggedIn
            ? Get.offAll(() => MainView())
            : Get.off(() => LoginView()));
    update();
  }
}
