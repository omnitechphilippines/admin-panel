import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../helper/services/auth_services.dart';
import '../../../../../helper/widgets/my_form_validator.dart';
import '../../../../../helper/widgets/my_validators.dart';
import '../../../../routes/app_pages.dart';

class ResetPasswordController extends GetxController {
  MyFormValidator basicValidator = MyFormValidator();

  @override
  void onInit() {
    super.onInit();
    basicValidator.addField(
      'email',
      required: true,
      label: 'Email',
      validators: <MyEmailValidator>[MyEmailValidator()],
      controller: TextEditingController(text: 'demo@gmail.com'),
    );
  }

  Future<void> onLogin() async {
    if (basicValidator.validateForm()) {
      update();
      final Map<String, String>? errors = await AuthService.loginUser(basicValidator.getData());
      if (errors != null) {
        basicValidator.validateForm();
        basicValidator.clearErrors();
      }
      Get.toNamed(Routes.RESET_PASSWORD);
      update();
    }
  }

  void gotoLogIn() {
    Get.offNamed(Routes.LOGIN);
  }
}
