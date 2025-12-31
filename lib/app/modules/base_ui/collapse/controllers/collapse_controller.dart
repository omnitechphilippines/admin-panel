import 'package:get/get.dart';

import '../../../../../helper/utils/my_utils.dart';

class CollapseController extends GetxController {
  final RxBool isCollapse = false.obs;
  final RxBool isCollapseHorizontal = false.obs;
  final RxBool isPanel1Expanded = false.obs;
  final RxBool isPanel2Expanded = false.obs;
  final RxList<String> dummyTexts = List<String>.generate(12, (int index) => MyTextUtils.getDummyText(60)).obs;

  void toggleAllPanels() {
    isPanel1Expanded.value = !isPanel1Expanded.value;
    isPanel2Expanded.value = !isPanel2Expanded.value;
    update();
  }

  void togglePanel1() {
    isPanel1Expanded.value = !isPanel1Expanded.value;
    update();
  }

  void togglePanel2() {
    isPanel2Expanded.value = !isPanel2Expanded.value;
    update();
  }

  void onCollapse() {
    isCollapse.value = !isCollapse.value;
    update();
  }

  void onCollapseHorizontal() {
    isCollapseHorizontal.value = !isCollapseHorizontal.value;
    update();
  }
}
