import 'package:get/get.dart';

import '../controllers/basic_element_controller.dart';

class BasicElementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BasicElementController>(
      () => BasicElementController(),
    );
  }
}
