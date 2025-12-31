import 'package:get/get.dart';

import '../controllers/scrollbar_controller.dart';

class ScrollbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScrollbarController>(() => ScrollbarController());
  }
}
