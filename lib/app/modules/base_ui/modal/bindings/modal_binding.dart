import 'package:get/get.dart';

import '../controllers/modal_controller.dart';

class ModalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ModalController>(
      () => ModalController(),
    );
  }
}
