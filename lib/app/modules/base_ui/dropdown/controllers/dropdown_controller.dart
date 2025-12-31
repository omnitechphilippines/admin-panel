import 'package:get/get.dart';

class DropdownController extends GetxController {
  Rx<SingleButtonDropdowns> singleButtonDropdowns1 = SingleButtonDropdowns.action.obs;
  Rx<SingleButtonDropdowns> singleButtonDropdowns2 = SingleButtonDropdowns.action.obs;
  Rx<SingleButtonDropdowns> primaryButton = SingleButtonDropdowns.action.obs;
  Rx<SingleButtonDropdowns> secondaryButton = SingleButtonDropdowns.action.obs;
  Rx<SingleButtonDropdowns> successButton = SingleButtonDropdowns.action.obs;
  Rx<SingleButtonDropdowns> infoButton = SingleButtonDropdowns.action.obs;
  Rx<SingleButtonDropdowns> warningButton = SingleButtonDropdowns.action.obs;
  Rx<SingleButtonDropdowns> dangerButton = SingleButtonDropdowns.action.obs;
  Rx<SingleButtonDropdowns> largeButton1 = SingleButtonDropdowns.action.obs;
  Rx<SingleButtonDropdowns> largeButton2 = SingleButtonDropdowns.action.obs;
  Rx<SingleButtonDropdowns> smallButton1 = SingleButtonDropdowns.action.obs;
  Rx<SingleButtonDropdowns> smallButton2 = SingleButtonDropdowns.action.obs;

  void onSelectSingleButtonDropdowns1(SingleButtonDropdowns value) => singleButtonDropdowns1.value = value;

  void onSelectSingleButtonDropdowns2(SingleButtonDropdowns value) => singleButtonDropdowns2.value = value;

  void onSelectSinglePrimaryButton(SingleButtonDropdowns value) => primaryButton.value = value;

  void onSelectSingleSecondaryButton(SingleButtonDropdowns value) => secondaryButton.value = value;

  void onSelectSingleSuccessButton(SingleButtonDropdowns value) => successButton.value = value;

  void onSelectSingleInfoButton(SingleButtonDropdowns value) => infoButton.value = value;

  void onSelectSingleWarningButton(SingleButtonDropdowns value) => warningButton.value = value;

  void onSelectSingleDangerButton(SingleButtonDropdowns value) => dangerButton.value = value;

  void onSelectLargeButton1(SingleButtonDropdowns value) => largeButton1.value = value;

  void onSelectLargeButton2(SingleButtonDropdowns value) => largeButton2.value = value;

  void onSelectSmallButton1(SingleButtonDropdowns value) => smallButton1.value = value;

  void onSelectSmallButton2(SingleButtonDropdowns value) => smallButton2.value = value;
}

enum SingleButtonDropdowns { action, anotherAction, somethingElse }
