import 'package:flutter/material.dart';
import 'package:nimbus/App/AppColors.dart';
import 'package:nimbus/Utils/FormValidator.dart';
import 'package:pinput/pinput.dart';

class AuthPin extends StatelessWidget with FormValidator {
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  const AuthPin({super.key, this.onSubmitted, this.onChanged, this.controller});

  @override
  Widget build(BuildContext context) {
    return Pinput(
      onSubmitted: onSubmitted,
      onChanged: onChanged,
      submittedPinTheme: PinTheme(
        textStyle: TextStyle(color: AppColors.fontColor, fontSize: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.green[100],
        ),
        height: 40,
        width: 40,
      ),
      showCursor: false,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      controller: controller,
      validator: isNotEmpty,
      hapticFeedbackType: HapticFeedbackType.selectionClick,
      length: 6,
      closeKeyboardWhenCompleted: true,
      autofocus: true,
      defaultPinTheme: PinTheme(
        textStyle: TextStyle(color: AppColors.fontColor, fontSize: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.primarySwatch[50],
        ),
        height: 40,
        width: 40,
      ),
      focusedPinTheme: PinTheme(
        textStyle: TextStyle(color: AppColors.fontColor, fontSize: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.primarySwatch[200],
        ),
        height: 40,
        width: 40,
      ),
      errorPinTheme: PinTheme(
        textStyle: TextStyle(color: AppColors.fontColor, fontSize: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.red[100],
        ),
        height: 40,
        width: 40,
      ),
    );
  }
}
