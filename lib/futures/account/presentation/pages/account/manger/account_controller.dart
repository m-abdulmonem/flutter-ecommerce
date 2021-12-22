import 'package:ecommerce/futures/account/data/model/profile_model.dart';
import 'package:ecommerce/futures/authentication/data/storage/auth_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AccountController extends GetxController{
  final _auth = AuthStorage();
  final user = FirebaseAuth.instance.currentUser;


  AuthStorage get auth => _auth;

  ProfileModel get profile => ProfileModel.fromJson(auth.profile);




  @override
  void onInit() {
    if (profile.displayName == null)
      user?.updateDisplayName("user 8541541");
    super.onInit();
  }
}