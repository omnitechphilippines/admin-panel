import 'package:get/get.dart';

import '../controllers/sweet_alert_controller.dart';

class SweetAlertBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SweetAlertController>(
      () => SweetAlertController(),
    );
  }
}
