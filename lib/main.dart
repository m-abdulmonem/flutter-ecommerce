import 'package:ecommerce/futures/splash/presentation/SplashView.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'core/util/binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  // print(GetStorage().getKeys());
  // print(GetStorage().getValues());

  // GetStorage().erase();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(GetMaterialApp(
      title: "Home",
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      // debugShowMaterialGrid: true,
      home: SplashView()));
}
