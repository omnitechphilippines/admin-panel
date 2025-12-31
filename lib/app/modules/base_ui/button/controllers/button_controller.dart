import 'package:get/get.dart';

class ButtonController extends GetxController {
  final RxList<bool> selected = List<bool>.filled(3, false).obs;

  void buttonsController() {
    selected[0] = true;
  }

  void onSelect(int index) {
    selected.value = List<bool>.filled(3, false);
    selected[index] = true;
    update();
  }
}
