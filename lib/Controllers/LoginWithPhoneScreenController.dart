import 'package:flutter/widgets.dart';
import 'package:intl_phone_field/phone_number.dart';

abstract class LoginWithPhoneScreenController {
  Future<void> nextButtonPressed();

  TextEditingController get phone;
  GlobalKey<FormState> get formKey;
  ValueNotifier<PhoneNumber> get phoneNumber;
}
