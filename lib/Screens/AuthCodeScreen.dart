import 'package:flutter/material.dart';
import 'package:nimbus/App/AppColors.dart';
import 'package:nimbus/Components/BlueButton.dart';
import 'package:nimbus/Controllers/AuthCodeScreenController.dart';
import 'package:nimbus/Utils/FormValidator.dart';
import 'package:provider/provider.dart';

class AuthCodeScreen extends StatefulWidget {
  const AuthCodeScreen({super.key});

  @override
  State<AuthCodeScreen> createState() => _AuthCodeScreenState();
}

class _AuthCodeScreenState extends State<AuthCodeScreen> with FormValidator {
  late final AuthCodeScreenController _controller;

  @override
  void initState() {
    _controller = context.read<AuthCodeScreenController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _controller.exitPressed,
            icon: Icon(Icons.exit_to_app_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 100,
          right: 30,
          left: 30,
          bottom: 100,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(),
            Text(
              'We\'ve sent a verification link to your email.',
              style: TextStyle(
                color: AppColors.fontColor,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Please check your inbox and click the link to continue',
              style: TextStyle(color: AppColors.subtext),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/email.png', width: 128, height: 128),
              ],
            ),

            Spacer(),
            ValueListenableBuilder(
              valueListenable: _controller.sendCodeEnabled,
              builder: (context, isEnabled, _) {
                return ValueListenableBuilder(
                  valueListenable: _controller.countdown,
                  builder: (context, countdown, _) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: BlueButton(
                                onPressed:
                                    isEnabled
                                        ? _controller.sendCodePressed
                                        : null,
                                label: isEnabled ? 'Send' : 'Wait ${countdown}s',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed:
                                  isEnabled ? _controller.sendCodePressed : null,
                              child: Text(
                                'Didn\'t receive it? Resend the link',
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
