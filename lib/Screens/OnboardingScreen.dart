import 'package:flutter/material.dart';
import 'package:nimbus/App/AppColors.dart';
import 'package:nimbus/Components/BlueButton.dart';
import 'package:nimbus/Controllers/OnboardingScreenController.dart';
import 'package:nimbus/Controllers/SignInModalController.dart';
import 'package:nimbus/Modals/SignInModal.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final OnboardingScreenController _onboardingController;
  late final SignInModalController _signInModalController;

  @override
  void initState() {
    _onboardingController = context.read<OnboardingScreenController>();
    _signInModalController = context.read<SignInModalController>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Image.asset(
                  'assets/images/cloud.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to Nimbus!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: AppColors.fontColor,
                  ),
                ),

                Text(
                  'Your personal and secure cloud storage solution. Effortlessly upload, access, and manage your files from any device. With real-time sync and powerful sharing features, Nimbus keeps your digital life organized and always within reach.',
                  style: TextStyle(color: AppColors.subtext, fontSize: 13),
                ),
                const SizedBox(height: 10),

                Text(
                  'Join for free!',
                  style: TextStyle(color: AppColors.subtext, fontSize: 13),
                ),
                const SizedBox(height: 30),

                Row(
                  children: [
                    Expanded(
                      child: BlueButton(
                        onPressed: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            enableDrag: true,
                            isDismissible: true,
                            context: context,
                            builder:
                                (context) => SignInModal(
                                  controller: _signInModalController,
                                ),
                          );
                        },
                        label: 'Sign In',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Use social login',
                      style: TextStyle(color: AppColors.subtext, fontSize: 13),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _onboardingController.signInWithGoogle,
                      icon: Image.asset('assets/images/instagram.png'),
                    ),
                    IconButton(
                      onPressed: _onboardingController.signInWithFacebook,
                      icon: Image.asset('assets/images/facebook.png'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
