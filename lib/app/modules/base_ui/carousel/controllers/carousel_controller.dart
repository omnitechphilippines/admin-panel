import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../helper/utils/my_utils.dart';

class CarouselController extends GetxController {
  final RxInt selectedSimpleCarousel = 0.obs, selectedCarousel = 0.obs, selectedWithIndicator = 0.obs, withCaptionCarousel = 0.obs, crossFadeCarousel = 0.obs;
  final RxInt pageControlSize = 3.obs, withIndicatorsSize = 3.obs, withCaptionSize = 3.obs, withDarkVariantSize = 3.obs, darkVariantCarousel = 0.obs;
  Timer? timerAnimation;
  final PageController simplePageController = PageController(initialPage: 0);
  final PageController pageControls = PageController(initialPage: 0);
  final PageController indicatorControl = PageController(initialPage: 0);
  final PageController captionCarousel = PageController(initialPage: 0);
  final PageController crossFade = PageController(initialPage: 0);
  final PageController darkVariant = PageController(initialPage: 0);

  final RxList<String> dummyTexts = List<String>.generate(12, (int index) => MyTextUtils.getDummyText(60)).obs;

  @override
  void onInit() {
    timerAnimation = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      // Page Controls
      if (selectedCarousel < pageControlSize.value - 1) {
        selectedCarousel.value++;
      } else {
        selectedCarousel.value = 0;
      }

      pageControls.animateToPage(selectedCarousel.value, duration: const Duration(milliseconds: 600), curve: Curves.ease);

      if (selectedWithIndicator.value < withIndicatorsSize.value - 1) {
        selectedWithIndicator.value++;
      } else {
        selectedWithIndicator.value = 0;
      }

      indicatorControl.animateToPage(selectedWithIndicator.value, duration: const Duration(milliseconds: 600), curve: Curves.ease);

      if (withCaptionCarousel.value < withCaptionSize.value - 1) {
        withCaptionCarousel.value++;
      } else {
        withCaptionCarousel.value = 0;
      }

      captionCarousel.animateToPage(withCaptionCarousel.value, duration: const Duration(milliseconds: 600), curve: Curves.ease);
      update();
    });
    super.onInit();
  }

  void onChangePreviewDarkVariant() {
    darkVariant.previousPage(duration: const Duration(milliseconds: 600), curve: Curves.ease);
    update();
  }

  void onChangeNextDarkVariant() {
    darkVariant.nextPage(duration: const Duration(milliseconds: 600), curve: Curves.ease);
    update();
  }

  void onChangeDarkVariantCarousel(int value) {
    darkVariantCarousel.value = value;
    update();
  }

  void onChangePreviewCrossFadeControls() {
    crossFade.previousPage(duration: const Duration(milliseconds: 600), curve: Curves.fastLinearToSlowEaseIn);
    update();
  }

  void onChangeNextCrossFadeControls() {
    crossFade.nextPage(duration: const Duration(milliseconds: 600), curve: Curves.fastLinearToSlowEaseIn);
    update();
  }

  void onChangeCrossFade(int value) {
    crossFadeCarousel.value = value;
    update();
  }

  void onChangeCaptionCarousel(int value) {
    withCaptionCarousel.value = value;
    update();
  }

  void onChangeIndicatorCarousel(int value) {
    selectedWithIndicator.value = value;
    update();
  }

  void onChangePreviewControls() {
    pageControls.previousPage(duration: const Duration(milliseconds: 600), curve: Curves.ease);
    update();
  }

  void onChangePreviewIndicatorControls() {
    indicatorControl.previousPage(duration: const Duration(milliseconds: 600), curve: Curves.ease);
    update();
  }

  void onChangeSimpleCarousel(int value) {
    selectedSimpleCarousel.value = value;
    update();
  }

  void onChangeNextIndicatorControls() {
    indicatorControl.nextPage(duration: const Duration(milliseconds: 600), curve: Curves.ease);
    update();
  }

  void onChangeNextControls() {
    pageControls.nextPage(duration: const Duration(milliseconds: 600), curve: Curves.ease);
    update();
  }

  void onChangeCarousel(int value) {
    selectedCarousel.value = value;
    update();
  }

  @override
  void onClose() {
    simplePageController.dispose();
    pageControls.dispose();
    indicatorControl.dispose();
    captionCarousel.dispose();
    crossFade.dispose();
    darkVariant.dispose();
    super.onClose();
  }
}
