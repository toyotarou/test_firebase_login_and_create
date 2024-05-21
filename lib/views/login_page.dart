// ignore_for_file: unnecessary_await_in_return

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: emailEditingController,
            onChanged: (text) => loginModel.email = text,
          ),
          const SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            controller: passwordEditingController,
            onChanged: (text) => loginModel.password = text,
            //
            obscureText: loginModel.isObscure,
            decoration: InputDecoration(
              suffix: InkWell(
                onTap: loginModel.toggleIsObscure,
                child: (loginModel.isObscure) ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(child: (loginModel.currentUser == null) ? const Text('null') : const Text('not null')),
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
