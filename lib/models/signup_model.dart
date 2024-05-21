// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/firestore_user/firestore_user.dart';

final signupProvider = ChangeNotifierProvider((ref) => SignupModel());

class SignupModel extends ChangeNotifier {
  User? currentUser;
  String email = '';
  String password = '';

  int counter = 0;

  void incrementCounter() {
    counter++;
    notifyListeners();
  }

  Future<void> createFirestoreUser({required BuildContext context, required String uid}) async {
    final now = Timestamp.now();

    final firestoreUser = FirestoreUser(
      userName: 'hidechy',
//      uid: v4,
      uid: uid,
      email: email,
      createdAt: now,
      updatedAt: now,
    );
    final userData = firestoreUser.toJson();

    // final userData = <String, dynamic>{
    //   'username': 'hideyuki',
    //   'uid': v4,
    // };

    await FirebaseFirestore.instance.collection('members').doc(uid).set(userData);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('member create')));
    notifyListeners();
  }

  ///
  Future<void> createUser({required BuildContext context}) async {
    try {
      final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      final user = result.user;
      final uid = user!.uid;

      await createFirestoreUser(context: context, uid: uid);
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
