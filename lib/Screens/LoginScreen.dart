import 'package:flutter/material.dart';
import 'package:nimbus/App/AppColors.dart';
import 'package:nimbus/Components/AppFormTextField.dart';
import 'package:nimbus/Components/BlueButton.dart';
import 'package:nimbus/Components/SignUpButton.dart';
import 'package:nimbus/Controllers/LoginScreenController.dart';
import 'package:nimbus/Utils/FormValidator.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with FormValidator {
  late final LoginScreenController _controller;

  @override
  void initState() {
    _controller = context.read<LoginScreenController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Back', style: TextStyle(fontWeight: FontWeight.w300)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          right: 40,
          left: 40,
          bottom: 50,
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
              key: _controller.formKey,
              child: Column(
                children: [
                  AppFormTextField(
                    prefixIcon: Icon(Icons.email_outlined),
                    label: 'Enter your email here',
                    hint: 'example@email.com',
                    controller: _controller.email,
                    keyboardType: TextInputType.emailAddress,
                    validator: isNotEmpty,
                  ),
                  const SizedBox(height: 10),
                  AppFormTextField(
                    prefixIcon: Icon(Icons.password_rounded),
                    label: 'Enter your password here',
                    hint: '••••••',
                    controller: _controller.password,
                    keyboardType: TextInputType.visiblePassword,
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
                  onPressed: _controller.forgotPasswordPressed,
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(color: AppColors.primary),
                  ),
                ),
              ],
            ),
            Spacer(),
            Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: BlueButton(
                        onPressed: _controller.signInPressed,
                        label: 'Sign In',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SignUpButton(onPressed: _controller.signUpPressed),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
