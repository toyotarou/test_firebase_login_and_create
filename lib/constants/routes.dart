import 'package:flutter/material.dart';

import '../views/login_page.dart';
import '../views/signup_page.dart';

///
void toSignupPage({required BuildContext context}) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const SignupPage()),
  );
}

///
void toLoginPage({required BuildContext context}) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const LoginPage()),
  );
}
