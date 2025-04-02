import 'package:flutter/material.dart';
import 'package:nimbus/App/AppColors.dart';
import 'package:nimbus/Components/AppFormTextField.dart';
import 'package:nimbus/Components/BlueButton.dart';
import 'package:nimbus/Components/SignUpButton.dart';
import 'package:nimbus/Controllers/SignInModalController.dart';
import 'package:nimbus/Utils/FormValidator.dart';

class SignInModal extends StatelessWidget with FormValidator {
  final SignInModalController controller;
  const SignInModal({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 30,
          right: 40,
          left: 40,
          bottom: 30,
        ),
        child: Column(
          children: [
            Text(
              'Welcome Back',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Please enter your login information below to access your account',
              style: TextStyle(color: AppColors.subtext),
            ),
            const SizedBox(height: 20),
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  AppFormTextField(
                    prefixIcon: Icon(Icons.email_outlined),
                    label: 'Enter your email here',
                    hint: 'example@email.com',
                    controller: controller.email,
                    validator: isNotEmpty,
                  ),
                  const SizedBox(height: 10),
                  AppFormTextField(
                    prefixIcon: Icon(Icons.password_rounded),
                    label: 'Enter your password here',
                    hint: '••••••',
                    controller: controller.password,
                    isObscure: true,
                    validator: isNotEmpty,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: controller.forgotPasswordPressed,
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(color: AppColors.primary),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: BlueButton(
                    onPressed: controller.signInPressed,
                    label: 'Sign In',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SignUpButton(onPressed: controller.signUpPressed),
          ],
        ),
      ),
    );
  }
}
