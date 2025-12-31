import 'package:get/get.dart';

import '../controllers/advance_ui_controller.dart';

class AdvanceUiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdvanceUiController>(
      () => AdvanceUiController(),
    );
  }
}
