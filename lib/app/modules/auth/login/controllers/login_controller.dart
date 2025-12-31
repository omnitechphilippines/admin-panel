import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../helper/services/auth_services.dart';
import '../../../../../helper/widgets/my_form_validator.dart';
import '../../../../../helper/widgets/my_validators.dart';
import '../../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final RxBool rememberMe = false.obs;
  MyFormValidator basicValidator = MyFormValidator();

  @override
  void onInit() {
    super.onInit();
    basicValidator.addField(
      'email',
      required: true,
      label: 'Email',
      validators: <MyEmailValidator>[MyEmailValidator()],
      controller: TextEditingController(text: 'omnitechphilippines@gmail.com'),
    );

    basicValidator.addField(
      'password',
      required: true,
      label: 'Password',
      validators: <MyLengthValidator>[MyLengthValidator(min: 6, max: 10)],
      controller: TextEditingController(text: '1234567'),
    );
  }

  Future<void> onLogin() async {
    if (basicValidator.validateForm()) {
      update();
      final Map<String, String>? errors = await AuthService.loginUser(basicValidator.getData());
      if (errors != null) {
        basicValidator.addErrors(errors);
        basicValidator.validateForm();
        basicValidator.clearErrors();
      } else {
        final String nextUrl = Uri.parse(ModalRoute.of(Get.context!)?.settings.name ?? '').queryParameters['next'] ?? Routes.DASHBOARD;
        Get.toNamed(nextUrl);
      }
      update();
    }
    // var errors = await AuthService.loginUser(basicValidator.getData());
    // if (errors != null) {
    //   basicValidator.addErrors(errors);
    //   // basicValidator.validateForm();
    //   basicValidator.clearErrors();
    // } else {
    //   final String nextUrl = Uri.parse(ModalRoute.of(Get.context!)?.settings.name ?? '').queryParameters['next'] ?? Routes.DASHBOARD;
    //   Get.toNamed(nextUrl);
    // }
    // update();
  }

  void rememberToggle() {
    rememberMe.value = !rememberMe.value;
  }

  void goToForgotPassword() {
    Get.toNamed(Routes.RESET_PASSWORD);
  }

  void goToSignUp() {
    Get.toNamed(Routes.SIGN_UP);
  }
}
