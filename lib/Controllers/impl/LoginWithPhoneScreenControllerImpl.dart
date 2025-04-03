import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:flutter/src/widgets/form.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:nimbus/Controllers/LoginWithPhoneScreenController.dart';
import 'package:nimbus/Controllers/NavigationController.dart';
import 'package:nimbus/Services/AuthService.dart';
import 'package:nimbus/Services/LogService.dart';

class LoginWithPhoneScreenControllerImpl
    implements LoginWithPhoneScreenController {
  LoginWithPhoneScreenControllerImpl({
    required this.navigationController,
    required this.authService,
    required this.logService,
  });

  final NavigationController navigationController;
  final AuthService authService;
  final LogService logService;

  final _phone = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _phoneNumber = ValueNotifier(
    PhoneNumber(countryISOCode: '', countryCode: '', number: ''),
  );

  @override
  ValueNotifier<PhoneNumber> get phoneNumber => _phoneNumber;

  @override
  TextEditingController get phone => _phone;

  @override
  GlobalKey<FormState> get formKey => _formKey;

  @override
  Future<void> nextButtonPressed() async {
    if (formKey.currentState!.validate() &&
        _phoneNumber.value.number.trim().isNotEmpty) {
      logService.debug(message: _phoneNumber.value.completeNumber);
      navigationController.goToOTP(phoneNumber: _phoneNumber.value.completeNumber);
    }
  }
}
