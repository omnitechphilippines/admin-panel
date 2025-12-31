import 'package:get/get.dart';

import '../../../../../helper/utils/my_utils.dart';

class PlaceholderController extends GetxController {
  List<String> dummyTexts = List<String>.generate(12, (int index) => MyTextUtils.getDummyText(60)).obs;
}
