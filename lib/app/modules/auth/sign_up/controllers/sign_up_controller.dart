import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../helper/services/auth_services.dart';
import '../../../../../helper/widgets/my_form_validator.dart';
import '../../../../../helper/widgets/my_validators.dart';
import '../../../../routes/app_pages.dart';

class SignUpController extends GetxController {
  MyFormValidator basicValidator = MyFormValidator();
  final RxBool termAndConditions = false.obs;

  @override
  void onInit() {
    super.onInit();
    basicValidator.addField('email', required: true, label: 'Email', validators: <MyEmailValidator>[MyEmailValidator()], controller: TextEditingController());
    basicValidator.addField('name', required: true, label: 'Name', validators: <MyNameValidator>[MyNameValidator(max: 10)], controller: TextEditingController());
    basicValidator.addField('password', required: true, validators: <MyLengthValidator>[MyLengthValidator(min: 6, max: 10)], controller: TextEditingController());
  }

  void termAndConditionsToggle() {
    termAndConditions.value = !termAndConditions.value;
  }

  Future<void> onLogin() async {
    if (basicValidator.validateForm()) {
      update();
      final Map<String, String>? errors = await AuthService.loginUser(basicValidator.getData());
      if (errors != null) {
        basicValidator.addErrors(errors);
        basicValidator.validateForm();
        basicValidator.clearErrors();
      }
      final String nextUrl = Uri.parse(ModalRoute.of(Get.context!)?.settings.name ?? '').queryParameters['next'] ?? '/dashboard';
      Get.toNamed(nextUrl);
      update();
    }
  }

  void gotoLogin() {
    Get.toNamed(Routes.LOGIN);
  }
}
