import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = ChangeNotifierProvider((ref) => LoginModel());

class LoginModel extends ChangeNotifier {
  ///
  User? currentUser;
  String email = '';
  String password = '';

  Future<void> login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      currentUser = FirebaseAuth.instance.currentUser;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
    }
  }

  ///

  bool isObscure = true;

  void toggleIsObscure() {
    isObscure = !isObscure;
    notifyListeners();
  }
}
