import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

final mainProvider = ChangeNotifierProvider((ref) => MainModel());

class MainModel extends ChangeNotifier {
  int counter = 0;

  ///
  void incrementCounter() {
    counter++;
    notifyListeners();
  }

  ///
  Future<void> createUser({required BuildContext context}) async {
    final v4 = const Uuid().v4();

    final userData = <String, dynamic>{'username': 'hideyuki', 'uid': v4};
    await FirebaseFirestore.instance.collection('members').doc(v4).set(userData);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('member create')));
    notifyListeners();
  }
}
