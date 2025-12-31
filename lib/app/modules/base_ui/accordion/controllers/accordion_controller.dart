import 'package:get/get.dart';

import '../../../../../helper/widgets/my_text_utils.dart';

class AccordionController extends GetxController {
  final List<bool> alwaysOpenAccordions = <bool>[true, false, false].obs;
  final List<bool> flushAccordions = <bool>[true, false, false].obs;
  final List<bool> defaultAccordions = <bool>[false, true, false].obs;
  final List<String> dummyTexts = List<String>.generate(12, (int index) => MyTextUtils.getDummyText(60)).obs;
}
