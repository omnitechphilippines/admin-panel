import 'package:get/get.dart';

class AlertController extends GetxController {
  final List<Map<String, String>> dismissingAlerts = <Map<String, String>>[
    <String, String>{'colorName': 'Primary', 'color': '0xff007bff'},
    <String, String>{'colorName': 'Secondary', 'color': '0xff6c757d'},
    <String, String>{'colorName': 'Success', 'color': '0xff28a745'},
    <String, String>{'colorName': 'Error', 'color': '0xffdc3545'},
    <String, String>{'colorName': 'Warning', 'color': '0xffffc107'},
    <String, String>{'colorName': 'Info', 'color': '0xff17a2b8'},
    <String, String>{'colorName': 'Light', 'color': '0xfff8f9fa'},
    <String, String>{'colorName': 'Dark', 'color': '0xff343a40'},
  ];

  void removeColorToggle(int index) {
    dismissingAlerts.removeAt(index);
    // update();
  }
}
