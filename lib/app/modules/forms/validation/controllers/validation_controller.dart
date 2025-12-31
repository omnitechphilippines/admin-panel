import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../helper/widgets/my_field_validator.dart';
import '../../../../../helper/widgets/my_form_validator.dart';
import '../../../../../helper/widgets/my_validators.dart';

enum Gender {
  male,
  female,
  none;

  const Gender();
}

class GenderValidator extends MyFieldValidatorRule<Gender> {
  @override
  String? validate(Gender? value, bool required, Map<String, dynamic> data) => null;
}

class ValidationController extends GetxController {
  MyFormValidator basicValidator = MyFormValidator();

  void FormValidationController() {
    basicValidator.addField('full_name', required: true, label: 'Full Name', controller: TextEditingController());

    basicValidator.addField('email', required: true, label: 'Email', validators: <MyEmailValidator>[MyEmailValidator()], controller: TextEditingController());

    basicValidator.addField('city', required: true, label: 'City', validators: <MyEmailValidator>[MyEmailValidator()], controller: TextEditingController());

    basicValidator.addField('state', required: true, label: 'State', validators: <MyEmailValidator>[MyEmailValidator()], controller: TextEditingController());

    basicValidator.addField('password', required: true, label: 'Password', validators: <MyLengthValidator>[MyLengthValidator(min: 6, max: 10)], controller: TextEditingController());

    basicValidator.addField('gender', required: true, label: 'Gender', validators: <GenderValidator>[GenderValidator()]);
  }

  void onSubmitBasicForm() {
    basicValidator.validateForm();
  }

  void onResetBasicForm() {
    basicValidator.resetForm();
  }
}
