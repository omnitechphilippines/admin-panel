import 'package:get/get.dart';

import '../controllers/form_mask_controller.dart';

class FormMaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormMaskController>(
      () => FormMaskController(),
    );
  }
}
