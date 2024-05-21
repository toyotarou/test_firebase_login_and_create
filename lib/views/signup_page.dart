// ignore_for_file: unnecessary_await_in_return

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/rounded_text_field.dart';
import '../models/signup_model.dart';

class SignupPage extends ConsumerWidget {
  const SignupPage({super.key});

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signupModel = ref.watch(signupProvider);

    final emailEditingController = TextEditingController(text: signupModel.email);
    final passwordEditingController = TextEditingController(text: signupModel.password);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          RoundedTextField(
            keybordType: TextInputType.emailAddress,
            onChanged: (text) => signupModel.email = text,
            controller: emailEditingController,
            color: Colors.white,
            borderColor: Colors.black,
          ),
          const SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            controller: passwordEditingController,
            onChanged: (text) => signupModel.password = text,
            //
            obscureText: signupModel.isObscure,
            decoration: InputDecoration(
              suffix: InkWell(
                onTap: signupModel.toggleIsObscure,
                child: (signupModel.isObscure) ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await signupModel.createUser(context: context),
        child: const Icon(Icons.details),
      ),
    );
  }
}
