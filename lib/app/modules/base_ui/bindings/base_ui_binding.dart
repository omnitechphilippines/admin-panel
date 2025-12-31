import 'package:get/get.dart';

import '../controllers/base_ui_controller.dart';

class BaseUiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseUiController>(
      () => BaseUiController(),
    );
  }
}
