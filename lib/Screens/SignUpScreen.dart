import 'package:flutter/material.dart';
import 'package:nimbus/App/AppColors.dart';
import 'package:nimbus/Components/AppFormTextField.dart';
import 'package:nimbus/Components/BlueButton.dart';
import 'package:nimbus/Components/SignInButton.dart';
import 'package:nimbus/Controllers/SignUpScreenController.dart';
import 'package:nimbus/Utils/FormValidator.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with FormValidator {
  late final SignUpScreenController _controller;

  @override
  void initState() {
    _controller = context.read<SignUpScreenController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Back', style: TextStyle(fontWeight: FontWeight.w300)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 10,
          right: 40,
          left: 40,
          bottom: 50,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight:
                MediaQuery.of(context).size.height * .8 -
                MediaQuery.of(context).padding.top -
                AppBar().preferredSize.height,
          ),
          child: IntrinsicHeight(
            child: Column(
              children: [
                Text(
                  'Create your account',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  'Please enter your login information below to create your account',
                  style: TextStyle(color: AppColors.subtext),
                ),
                const SizedBox(height: 20),
                Form(
                  key: _controller.formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      AppFormTextField(
                        prefixIcon: Icon(Icons.email_outlined),
                        label: 'Enter your email here',
                        hint: 'example@email.com',
                        controller: _controller.email,
                        keyboardType: TextInputType.emailAddress,
                        validator: isNotEmpty,
                      ),
                      const SizedBox(height: 15),
                      AppFormTextField(
                        prefixIcon: Icon(Icons.password_rounded),
                        label: 'Enter your password here',
                        hint: '••••••',
                        controller: _controller.password,
                        keyboardType: TextInputType.visiblePassword,
                        isObscure: true,
                        validator: isNotEmpty,
                      ),
                      const SizedBox(height: 15),
                      AppFormTextField(
                        prefixIcon: Icon(Icons.lock_outline_rounded),
                        label: 'Confirm your password',
                        hint: '••••••',
                        controller: _controller.confirmPassword,
                        keyboardType: TextInputType.visiblePassword,
                        isObscure: true,
                        validator: isNotEmpty,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: BlueButton(
                            onPressed: _controller.signUpPressed,
                            label: 'Sign Up',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SignInButton(onPressed: _controller.signInPressed),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
