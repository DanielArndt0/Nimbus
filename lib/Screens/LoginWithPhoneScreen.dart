import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:logger/logger.dart';
import 'package:nimbus/App/AppColors.dart';
import 'package:nimbus/Components/BlueButton.dart';
import 'package:nimbus/Controllers/LoginWithPhoneScreenController.dart';
import 'package:nimbus/Utils/FormValidator.dart';
import 'package:provider/provider.dart';

class LoginWithPhoneScreen extends StatefulWidget {
  const LoginWithPhoneScreen({super.key});

  @override
  State<LoginWithPhoneScreen> createState() => _LoginWithPhoneScreenState();
}

class _LoginWithPhoneScreenState extends State<LoginWithPhoneScreen>
    with FormValidator {
  late final LoginWithPhoneScreenController _controller;

  @override
  void initState() {
    _controller = context.read<LoginWithPhoneScreenController>();
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
          right: 30,
          left: 30,
          bottom: 50,
        ),
        child: Form(
          key: _controller.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(),
              Text(
                'Sign in with your phone number',
                style: TextStyle(
                  color: AppColors.fontColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Secure login using your phone. No password needed, just your number',
                style: TextStyle(color: AppColors.subtext),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: IntlPhoneField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        label: Text('Enter your phone'),
                        suffixIcon: Icon(Icons.phone),
                        suffixIconColor: AppColors.primary,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (phone) {
                        if (phone == null || phone.number.isEmpty) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
                      },
                      initialCountryCode: 'BR',
                      onChanged: (value) {
                        print("Novo número: ${value.completeNumber}");
                        _controller.phoneNumber.value = value;
                      },
                    ),
                  ),
                ],
              ),

              Spacer(),
              ValueListenableBuilder(
                valueListenable: _controller.phoneNumber,
                builder: (context, phone, child) {
                  Logger().d(phone.number.trim().isNotEmpty);
                  return Row(
                    children: [
                      Expanded(
                        child: BlueButton(
                          onPressed:
                              phone.number.trim().isNotEmpty
                                  ? _controller.nextButtonPressed
                                  : null,
                          label: 'Next',
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
