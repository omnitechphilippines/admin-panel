import 'package:get/get.dart';

import '../controllers/collapse_controller.dart';

class CollapseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CollapseController>(
      () => CollapseController(),
    );
  }
}
