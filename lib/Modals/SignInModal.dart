import 'package:flutter/material.dart';
import 'package:nimbus/Components/AppFormTextField.dart';
import 'package:nimbus/Components/BlueButton.dart';
import 'package:nimbus/Components/SignUpButton.dart';
import 'package:nimbus/Controllers/SignInModalController.dart';

class SignInModal extends StatelessWidget {
  final SignInModalController controller;
  const SignInModal({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, right: 40, left: 40),
      child: Column(
        children: [
          Text(
            'Welcome Back',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            'Please enter your login information below to access your account',
          ),
          const SizedBox(height: 20),
          AppFormTextField(
            prefixIcon: Icon(Icons.email_outlined),
            label: 'Enter your email here',
            hint: 'example@email.com',
            controller: controller.email,
          ),
          const SizedBox(height: 10),
          AppFormTextField(
            prefixIcon: Icon(Icons.password_rounded),
            label: 'Enter your password here',
            hint: '••••••',
            controller: controller.password,
            isObscure: true,
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: BlueButton(
                  onPressed: controller.SignInPressed,
                  label: 'Sign In',
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SignUpButton(onPressed: controller.SignUpPressed),
        ],
      ),
    );
  }
}
