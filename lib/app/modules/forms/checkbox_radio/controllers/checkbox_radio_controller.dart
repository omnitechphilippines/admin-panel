import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckboxRadioController extends GetxController {
  final RxBool isChecked1 = false.obs, isChecked2 = false.obs, isChecked3 = false.obs, isChecked4 = false.obs;
  final RxnInt selectedRadioValue = RxnInt(), selectedInlineValue = RxnInt(), selectedDisableRadioValue = RxnInt(), selectedRadioColorValue = RxnInt();
  final RxBool isSwitch1 = false.obs, isSwitch2 = false.obs, isSwitch3 = false.obs, isSwitch4 = true.obs;

  final List<Map<String, dynamic>> checkboxData = <Map<String, dynamic>>[
    <String, dynamic>{'label': 'Default Checkbox', 'color': Colors.black54, 'isChecked': true},
    <String, dynamic>{'label': 'Success Checkbox', 'color': Colors.green, 'isChecked': true},
    <String, dynamic>{'label': 'Info Checkbox', 'color': Colors.blue, 'isChecked': true},
    <String, dynamic>{'label': 'Secondary Checkbox', 'color': Colors.grey, 'isChecked': true},
    <String, dynamic>{'label': 'Warning Checkbox', 'color': Colors.amber, 'isChecked': true},
    <String, dynamic>{'label': 'Danger Checkbox', 'color': Colors.red, 'isChecked': true},
    <String, dynamic>{'label': 'Dark Checkbox', 'color': Colors.black, 'isChecked': true},
  ];

  @override
  void onInit() {
    super.onInit();
    selectedDisableRadioValue.value = 2;
    selectedRadioColorValue.value = 1;
  }

  void onSwitch1() {
    isSwitch1.value = !isSwitch1.value;
    update();
  }

  void onSwitch2() {
    isSwitch2.value = !isSwitch2.value;
    update();
  }

  void onSelectColorRadio(int? value) {
    selectedRadioColorValue.value = value;
    update();
  }

  void onSelectInlineRadio(int? value) {
    selectedInlineValue.value = value;
    update();
  }

  void onColorCheckbox(int index, bool? value) {
    checkboxData[index]['isChecked'] = value ?? true;
    update();
  }

  void onCheckbox1() {
    isChecked1.value = !isChecked1.value;
    update();
  }

  void onCheckbox2() {
    isChecked2.value = !isChecked2.value;
    update();
  }

  void onCheckbox3() {
    isChecked3.value = !isChecked3.value;
    update();
  }

  void onCheckbox4() {
    isChecked4.value = !isChecked4.value;
    update();
  }

  void onSelectRadio(int? value) {
    selectedRadioValue.value = value;
    update();
  }
}
