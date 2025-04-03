import 'package:flutter/material.dart';
import 'package:nimbus/App/AppColors.dart';
import 'package:nimbus/Components/AuthPin.dart';
import 'package:nimbus/Components/BlueButton.dart';
import 'package:nimbus/Controllers/OTPScreenController.dart';
import 'package:provider/provider.dart';

class OTPScreen extends StatefulWidget {
  final String phoneNumber;
  const OTPScreen({super.key, required this.phoneNumber});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  late final OTPScreenController _controller;

  @override
  void initState() {
    _controller = context.read<OTPScreenController>();
    _controller.sendCode(phoneNumber: widget.phoneNumber);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        actions: [
          IconButton(
            onPressed: _controller.exitPressed,
            icon: Icon(Icons.exit_to_app_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 40,
          right: 30,
          left: 30,
          bottom: 50,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(),
            Text(
              'We\'ve sent a verification code to your phone.',
              style: TextStyle(
                color: AppColors.fontColor,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Please check your messages and enter the code to continue.',
              style: TextStyle(color: AppColors.subtext),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AuthPin(
                  onChanged: (pin) async => await _controller.onPinputSubmitted(pin),
                ),
              ],
            ),
            ValueListenableBuilder(
              valueListenable: _controller.sendCodeEnabled,
              builder: (context, isEnabled, _) {
                return ValueListenableBuilder(
                  valueListenable: _controller.countdown,
                  builder: (context, countdown, _) {
                    return Column(
                      children: [
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed:
                                  isEnabled
                                      ? () => _controller.sendCode(
                                        phoneNumber: widget.phoneNumber,
                                      )
                                      : null,
                              child: Text(
                                isEnabled
                                    ? 'Didn\'t receive it? Resend code'
                                    : 'Wait ${countdown}s to resend.',
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
            Spacer(),
            Row(
              children: [
                Expanded(child: BlueButton(onPressed: () {}, label: 'Next')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
