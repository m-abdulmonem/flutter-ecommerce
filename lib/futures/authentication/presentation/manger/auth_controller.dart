import 'package:ecommerce/futures/authentication/data/repo/auth_repo_impl.dart';
import 'package:ecommerce/futures/home/presentation/pages/main/main_view.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  String name = "", email = "", password = "";
  final _auth = AuthRepoImpl();

  void login(authForm) {
    final form = authForm.currentState;
    if (form!.validate()) {
      form.save();
      _auth
          .login(email: email, password: password)
          .then((response) => _handleResponse("Login", response));
    }
  }

  void register(authForm) {
    final form = authForm.currentState;
    if (form!.validate()) {
      form.save();
      _auth
          .register(email: email, password: password, name: name)
          .then((response) => _handleResponse("Sign Up", response));
    }
  }

  void facebookLogin() => _auth
      .loginWithFacebook()
      .then((response) => _handleResponse("Facebook Login", response));

  // void googleLogin() =>
  //     _auth.loginWithGoogle().then((response) => _handleResponse(response));

  void googleLogin() => _auth.signInWithGoogle().then((value) => print(value));

  void _handleResponse(String method, response) {
    if (response == null) {
      Get.offAll(() => MainView());
      return;
    }
    Get.snackbar("$method failed", response.toString());
  }
}
