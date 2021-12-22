import 'package:ecommerce/core/helper/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthStorage extends Services {
  final String _isLoggedInKey = "isLoggedInKey";
  final String _providerKey = "providerKey";
  final String _profileKey = "profileKey";

  Future<void> save(User user, {String? provider}) async {
    await storage.write(_isLoggedInKey, true);
    await storage.write(_profileKey, _userHandle(user));
    await storage.write(_providerKey, provider);
  }

  bool get isLoggedIn => storage.read(_isLoggedInKey) ?? false;

  Map<String, dynamic> get profile =>storage.read(_profileKey);

  Map<String, dynamic> _userHandle(User user) {
    return {
      'email': user.email,
      'displayName': user.displayName,
      'emailVerified': user.emailVerified,
      'isAnonymous': user.isAnonymous,
      'metadata': {
        'creationTime': user.metadata.creationTime.toString(),
        'lastSignInTime': user.metadata.lastSignInTime.toString(),
      },
      'phoneNumber': user.phoneNumber,
      'photoURL': user.photoURL,
      'providerData': user.providerData.toList().toString(),
      'refreshToken': user.refreshToken,
      'tenantId': user.tenantId,
      'uid': user.uid,
    };
  }

  void signOut(){

  }
}
