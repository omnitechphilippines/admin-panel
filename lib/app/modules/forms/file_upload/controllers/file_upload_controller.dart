import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class FileUploadController extends GetxController {
  final RxList<PlatformFile> files = <PlatformFile>[].obs;
  final RxList<PlatformFile> multipleFiles = <PlatformFile>[].obs;
  final RxBool selectMultipleFile = false.obs;
  FileType type = FileType.any;

  Future<void> pickFiles() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: selectMultipleFile.value, type: type);
    if (result?.files.isNotEmpty ?? false) {
      files.addAll(result!.files);
    }
    // update();
  }

  void onSelectMultipleFile(bool? value) {
    selectMultipleFile.value = value ?? selectMultipleFile.value;
    // update();
  }

  void removeFile(PlatformFile file) {
    files.remove(file);
    // update();
  }
}
