import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliderController extends GetxController {
  final RxDouble sliderValue = 127.0.obs;
  final RxDouble minValue = 0.0.obs;
  final RxDouble maxValue = 255.0.obs;

  final RxDouble startValue = 20.0.obs;
  final RxDouble endValue = 80.0.obs;

  final RxDouble red = 127.0.obs;
  final RxDouble green = 127.0.obs;
  final RxDouble blue = 127.0.obs;
  RangeValues multiElementValues = const RangeValues(20, 80);

  Color currentColor = const Color.fromARGB(255, 127, 127, 127);

  RangeValues currentRangeValues = const RangeValues(0.05, 0.80);
  RxString lowerValueText = '500'.obs;
  RxString upperValueText = '4000'.obs;
  RxString lowerPositionText = '5%'.obs;
  RxString upperPositionText = '80%'.obs;

  RxBool lockedState = false.obs;
  RxDouble slider1Value = 60.0.obs;
  RxDouble slider2Value = 80.0.obs;
  RxDouble lockedSlider1 = 60.0.obs;
  RxDouble lockedSlider2 = 80.0.obs;

  double calculateNonLinearValue(double normalizedValue) => normalizedValue < 0.1
      ? normalizedValue * 500
      : normalizedValue < 0.5
      ? 500 + (normalizedValue - 0.1) * 3500
      : 4000 + (normalizedValue - 0.5) * 6000;

  double calculatePosition(double value) => value < 500
      ? value / 500
      : value < 4000
      ? (value - 500) / 3500 + 0.1
      : (value - 4000) / 6000 + 0.5;

  double normalizeValue(double value) => value < 500
      ? value / 500
      : value < 4000
      ? (value - 500) / 3500 + 0.1
      : (value - 4000) / 6000 + 0.5;

  void updateValueRange(RangeValues values) {
    final double startValue = calculateNonLinearValue(values.start);
    final double endValue = calculateNonLinearValue(values.end);

    currentRangeValues = RangeValues(normalizeValue(startValue), normalizeValue(endValue));

    lowerValueText.value = startValue.toStringAsFixed(0);
    upperValueText.value = endValue.toStringAsFixed(0);
    lowerPositionText.value = '${(calculatePosition(startValue) * 100).toStringAsFixed(2)}%';
    upperPositionText.value = '${(calculatePosition(endValue) * 100).toStringAsFixed(2)}%';
    update();
  }

  void toggleLock() {
    lockedState.value = !lockedState.value;
    update();
  }

  void crossUpdate(double value, int sliderIndex) {
    if (!lockedState.value) {
      return;
    }

    final double lockedDifference = sliderIndex == 1 ? lockedSlider1.value - lockedSlider2.value : lockedSlider2.value - lockedSlider1.value;

    sliderIndex == 1 ? slider2Value.value = value - lockedDifference : slider1Value.value = value - lockedDifference;

    update();
  }

  void setLockedValues() {
    lockedSlider1.value = slider1Value.value;
    lockedSlider2.value = slider2Value.value;
    update();
  }

  void updateSlider(double value) {
    sliderValue.value = value;
    update();
  }

  void updateLockingSliders1(double value) {
    slider1Value.value = value;
    crossUpdate(value, 1);
    setLockedValues();
    update();
  }

  void updateLockingSliders2(double value) {
    slider2Value.value = value;
    crossUpdate(value, 2);
    setLockedValues();
    update();
  }

  void updateRangeValue(RangeValues values) {
    multiElementValues = values;
    update();
  }

  void updateVerticalSlider(RangeValues values) {
    startValue.value = values.start;
    endValue.value = values.end;
    update();
  }

  void updateBlueColor(double value) {
    blue.value = value;
    updateColor();
  }

  void updateGreenColor(double value) {
    green.value = value;
    updateColor();
  }

  void updateRedColor(double value) {
    red.value = value;
    updateColor();
  }

  void updateColor() {
    currentColor = Color.fromARGB(255, red.value.toInt(), green.value.toInt(), blue.value.toInt());
    update();
  }
}
