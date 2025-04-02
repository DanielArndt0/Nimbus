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
      showCursor: false,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      controller: controller,
      validator: isNotEmpty,
      hapticFeedbackType: HapticFeedbackType.selectionClick,
      length: 5,
      closeKeyboardWhenCompleted: true,
      autofocus: true,
      defaultPinTheme: PinTheme(
        textStyle: TextStyle(color: AppColors.fontColor, fontSize: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.primarySwatch[50],
        ),
        height: 60,
        width: 60,
      ),
      focusedPinTheme: PinTheme(
        textStyle: TextStyle(color: AppColors.fontColor, fontSize: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.primarySwatch[200],
        ),
        height: 60,
        width: 60,
      ),
    );
  }
}
