abstract class AuthRepo{

  Future<String?> login({required String email,
    required String password});

  Future<String?> register({required String email,
    required String password,required String name});

  Future<String?> loginWithFacebook();

  Future<String?> loginWithGoogle();


}