import 'package:get/get.dart';

class BasicElementController extends GetxController {
  final RxBool isShowPassword = true.obs;
  final RxnString selectedValue = RxnString();
  final RxList<String> options = <String>['1', '2', '3', '4', '5'].obs;
  final RxList<String> selectedOptions = <String>[].obs;

  void passwordToggle() {
    isShowPassword.value = !isShowPassword.value;
    update();
  }

  void onSelectValue(String? value) {
    selectedValue.value = value;
    // update();
  }

  void toggleSelection(String value) {
    if (selectedOptions.contains(value)) {
      selectedOptions.remove(value);
    } else {
      selectedOptions.add(value);
    }
    // update();
  }
}
