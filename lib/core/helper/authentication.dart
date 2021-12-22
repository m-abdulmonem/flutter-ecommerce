import 'package:ecommerce/futures/authentication/data/storage/auth_storage.dart';


class Auth {
  final _storage = AuthStorage();

  AuthStorage get storage => _storage;
  // bool get isLoggedIn => _storage.isLoggedIn;
  String get token => "" ;//_storage.token;
}

Auth get auth => new Auth();
