import 'package:get/get.dart';

import '../controllers/breadcrumb_controller.dart';

class BreadcrumbBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BreadcrumbController>(
      () => BreadcrumbController(),
    );
  }
}
