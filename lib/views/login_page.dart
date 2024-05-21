// ignore_for_file: unnecessary_await_in_return

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/rounded_password_field.dart';
import '../components/rounded_text_field.dart';
import '../models/login_model.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginModel = ref.watch(loginProvider);

    final emailEditingController = TextEditingController(text: loginModel.email);
    final passwordEditingController = TextEditingController(text: loginModel.password);

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Column(
        children: [
          const SizedBox(height: 10),
          RoundedTextField(
            keybordType: TextInputType.emailAddress,
            onChanged: (text) => loginModel.email = text,
            controller: emailEditingController,
            color: Colors.white,
            borderColor: Colors.black,
          ),
          const SizedBox(height: 10),
          RoundedPasswordField(
            onChanged: (text) => loginModel.password = text,
            controller: passwordEditingController,
            obscureText: loginModel.isObscure,
            toggleIsObscureText: loginModel.toggleIsObscure,
            color: Colors.white,
            borderColor: Colors.black,
            shadowColor: Colors.purpleAccent,
          ),
          const SizedBox(height: 10),
          Center(child: (loginModel.currentUser == null) ? const Text('null') : const Text('not null')),
          const SizedBox(height: 50),
          ElevatedButton(onPressed: loginModel.logout, child: const Text('logout')),
          const SizedBox(height: 50),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            onPressed: () {
              emailEditingController.text = 'toyohide0521@test.com';
              passwordEditingController.text = 'password';

              loginModel
                ..email = 'toyohide0521@test.com'
                ..password = 'password';
            },
            child: const Text('dummy'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await loginModel.login(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
