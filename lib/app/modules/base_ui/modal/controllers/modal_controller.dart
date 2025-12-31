import 'package:get/get.dart';

import '../../../../../helper/utils/my_utils.dart';

class ModalController extends GetxController {
  final RxList<String> dummyTexts = List<String>.generate(12, (int index) => MyTextUtils.getDummyText(60)).obs;
}
