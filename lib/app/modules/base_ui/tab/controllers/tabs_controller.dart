import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../helper/utils/my_utils.dart';

class TabsController extends GetxController with GetTickerProviderStateMixin {
  final RxList<String> dummyTexts = List<String>.generate(12, (int index) => MyTextUtils.getDummyText(60)).obs;
  final RxInt defaultIndex = 0.obs, fullWidthIndex = 0.obs, backgroundIndex = 0.obs, borderedIndex = 0.obs, softIndex = 0.obs, customIndex1 = 0.obs, customIndex2 = 0.obs;
  late final TickerProvider tickerProvider;
  late TabController defaultTabController = TabController(length: 3, vsync: tickerProvider, initialIndex: defaultIndex.value);
  late TabController fullWidthTabController = TabController(length: 3, vsync: tickerProvider, initialIndex: fullWidthIndex.value);
  late TabController backgroundTabController = TabController(length: 3, vsync: tickerProvider, initialIndex: backgroundIndex.value);
  late TabController borderedTabController = TabController(length: 3, vsync: tickerProvider, initialIndex: borderedIndex.value);
  late TabController softTabController = TabController(length: 3, vsync: tickerProvider, initialIndex: softIndex.value);
  late TabController customTabController1 = TabController(length: 3, vsync: tickerProvider, initialIndex: customIndex1.value);
  late TabController customTabController2 = TabController(length: 3, vsync: tickerProvider, initialIndex: customIndex2.value);

  @override
  void onInit() {
    super.onInit();
    tickerProvider = this;
    defaultTabController.addListener(() {
      if (defaultIndex.value != defaultTabController.index) {
        defaultIndex.value = defaultTabController.index;
      }
    });
    fullWidthTabController.addListener(() {
      if (fullWidthIndex.value != fullWidthTabController.index) {
        fullWidthIndex.value = fullWidthTabController.index;
      }
    });
    backgroundTabController.addListener(() {
      if (backgroundIndex.value != backgroundTabController.index) {
        backgroundIndex.value = backgroundTabController.index;
      }
    });
    borderedTabController.addListener(() {
      if (borderedIndex.value != borderedTabController.index) {
        borderedIndex.value = borderedTabController.index;
      }
    });
    softTabController.addListener(() {
      if (softIndex.value != softTabController.index) {
        softIndex.value = softTabController.index;
      }
    });
    customTabController1.addListener(() {
      if (customIndex1.value != customTabController1.index) {
        customIndex1.value = customTabController1.index;
      }
    });
    customTabController2.addListener(() {
      if (customIndex2.value != customTabController2.index) {
        customIndex2.value = customTabController2.index;
      }
    });
  }

  @override
  void onClose() {
    defaultTabController.dispose();
    fullWidthTabController.dispose();
    backgroundTabController.dispose();
    borderedTabController.dispose();
    softTabController.dispose();
    customTabController1.dispose();
    customTabController2.dispose();
    super.onClose();
  }
}
