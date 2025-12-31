import 'package:get/get.dart';

import '../controllers/accordion_controller.dart';

class AccordionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccordionController>(
      () => AccordionController(),
    );
  }
}
