import 'package:get/get.dart';

import '../controllers/list_group_controller.dart';

class ListGroupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListGroupController>(
      () => ListGroupController(),
    );
  }
}
