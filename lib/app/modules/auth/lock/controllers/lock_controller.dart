import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../helper/widgets/my_form_validator.dart';
import '../../../../../helper/widgets/my_validators.dart';
import '../../../../routes/app_pages.dart';

class LockController extends GetxController {
  MyFormValidator basicValidator = MyFormValidator();

  @override
  void onInit() {
    basicValidator.addField(
      'password',
      required: true,
      label: 'Password',
      validators: <MyLengthValidator>[MyLengthValidator(min: 6, max: 10)],
      controller: TextEditingController(text: '123456789'),
    );
    super.onInit();
  }

  Future<void> onSignIn() async {
    if (basicValidator.validateForm()) {
      update();
      // await Future<dynamic>.delayed(const Duration(seconds: 1));
      Get.toNamed(Routes.DASHBOARD);
      update();
    }
  }

  void goToSignUp() {
    Get.toNamed(Routes.SIGN_UP);
  }
}
