import 'package:get/get.dart';

import '../controllers/file_upload_controller.dart';

class FileUploadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FileUploadController>(
      () => FileUploadController(),
    );
  }
}
