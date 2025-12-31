import 'package:get/get.dart';

import '../controllers/checkbox_radio_controller.dart';

class CheckboxRadioBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckboxRadioController>(
      () => CheckboxRadioController(),
    );
  }
}
