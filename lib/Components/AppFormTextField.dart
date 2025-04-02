import 'package:flutter/material.dart';

class AppFormTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? hint;
  final String? label;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isObscure;
  final bool isEnabled;
  final bool haveCounter;
  final bool isReadonly;

  const AppFormTextField({
    this.controller,
    this.keyboardType,
    this.validator,
    this.hint,
    this.label,
    this.suffixIcon,
    this.prefixIcon,
    this.isObscure = false,
    this.haveCounter = false,
    this.isReadonly = false,
    this.isEnabled = true,
    super.key,  
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      validator: validator,
      readOnly: isReadonly,
      keyboardType: keyboardType,
      enabled: isEnabled,
      controller: controller,
      obscureText: isObscure,
      buildCounter:
          haveCounter == false
              ? null
              : (
                context, {
                required currentLength,
                required isFocused,
                required maxLength,
              }) => Text('$currentLength'),
      decoration: InputDecoration(
        hintText: hint,
        label: Text(label ?? ''),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
