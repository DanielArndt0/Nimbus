import 'package:flutter/material.dart';
import 'package:nimbus/App/AppColors.dart';
import 'package:nimbus/Controllers/OnboardingScreenController.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardingScreenController _controller =
        Provider.of<OnboardingScreenController>(context);
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
                  'Welcome to',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Text(
                  'Nimbus',
                  style: TextStyle(fontSize: 38, fontWeight: FontWeight.w900),
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
                      child: ElevatedButton(
                        onPressed: _controller.signInButtonPressed,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryMaterial,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Sign In ->',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                      onPressed: _controller.signInWithGoogle,
                      icon: Image.asset('assets/images/instagram.png'),
                    ),
                    IconButton(
                      onPressed: _controller.signInWithFacebook,
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
