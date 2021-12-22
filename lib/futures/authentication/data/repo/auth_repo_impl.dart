import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:ecommerce/core/helper/services.dart';
import 'package:ecommerce/core/util/functions.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import '../../data/storage/auth_storage.dart';
import '../../domain/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRepoImpl extends AuthStorage with Services implements AuthRepo {
  final _auth = FirebaseAuth.instance;
  User? _user;
  var _position;
  void location() async => _position = await determinePosition();

  @override
  Future<String?> login(
      {required String email, required String password}) async {
    try {
      _user = (await _auth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
      save(_user!, provider: "email");
    } on FirebaseAuthException catch (e) {
      return e.code.replaceAll("-", " ");
    }
  }

  @override
  Future<String?> loginWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    print(facebookAuthCredential);

    FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

    switch (loginResult.status) {
      case LoginStatus.success:
        _user = (await _auth.signInWithCredential(
                FacebookAuthProvider.credential(
                    loginResult.accessToken!.token)))
            .user!;

        save(_user!, provider: "facebook");
        break;
      case LoginStatus.cancelled:
        return "facebook Login cancelled";
      case LoginStatus.failed:
        return "Something went wrong. ${loginResult.message}";
      case LoginStatus.operationInProgress:
        return "loading...";
    }
  }

  @override
  Future<String?> loginWithGoogle() async {
    final googleDom = "https://www.googleapis.com/auth";
    print(googleDom);
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await (await googleSignIn.signIn())!.authentication;
    try {
      _user = (await FirebaseAuth.instance
              .signInWithCredential(GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      )))
          .user;

      save(_user!, provider: "google");
    } on FirebaseAuthException catch (e) {
      return e.code.replaceAll("-", " ");
    } catch (e) {}
  }

  @override
  Future<String?> register(
      {required String email,
      required String password,
      required String name}) async {
    try {
      _user = (await _auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;

      _user?.updateDisplayName(name);
      // _setFirebaseUser(name: name);

      save(_user!, provider: "email");
      _setFirebaseUser(
          age: 15,
          birthday: "15/3/2000",
          gender: "male",
          name: name,
          username: "sdfhusd",
          photo: "dsjfsdjfu");
    } on FirebaseAuthException catch (e) {
      return e.code.replaceAll("-", " ");
    }
  }

  Future<User?> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
            await auth.signInWithPopup(authProvider);

        user = userCredential.user;
      } catch (e) {
        print(e);
      }
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: [
          'email',
          'https://www.googleapis.com/auth/contacts.readonly',
        ],
      );

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          final UserCredential userCredential =
              await auth.signInWithCredential(credential);

          user = userCredential.user;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            // ...
          } else if (e.code == 'invalid-credential') {
            // ...
          }
        } catch (e) {
          // ...
        }
      }
    }

    return user;
  }

  void _setFirebaseUser({photo, username, name, age, birthday, gender}) {
    var location = _position != null
        ? GeoPoint(_position.latitude, _position.longitude)
        : null;
    FirebaseFirestore.instance.collection("users").doc(_user!.uid).set({
      'username': username,
      'd_o_b': birthday ?? DateTime.now(),
      'gender': gender ?? "male",
      'age': age ?? "15-50",
      'name': name ?? null,
      'picture': photo ?? null,
      'status': null,
      'sexual_orientation': "straight",
      'location': location,
    });
  }
}
