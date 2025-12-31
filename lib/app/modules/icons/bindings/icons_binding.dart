import 'package:get/get.dart';

import '../controllers/icons_controller.dart';

class IconsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IconsController>(
      () => IconsController(),
    );
  }
}
