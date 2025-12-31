import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../helper/utils/my_utils.dart';

class ScrollbarController extends GetxController {
  final List<String> dummyTexts = List<String>.generate(12, (int index) => MyTextUtils.getDummyText(60)).obs;
  final Rx<ScrollController> scrollController = ScrollController().obs;
}
