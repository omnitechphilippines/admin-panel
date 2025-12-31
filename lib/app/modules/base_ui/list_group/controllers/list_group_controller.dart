import 'package:get/get.dart';

class ListGroupController extends GetxController {
  final RxInt selectedIndex = 0.obs;
  final RxBool isFirstChecked = false.obs;
  final RxBool isSecondChecked = false.obs;
  List<Map<String, String>> basicExample = <Map<String, String>>[
    <String, String>{'title': 'An item'},
    <String, String>{'title': 'A second item'},
    <String, String>{'title': 'A third item'},
    <String, String>{'title': 'A fourth item'},
    <String, String>{'title': 'And a fifth one'},
  ];
  List<Map<String, String>> customContent = <Map<String, String>>[
    <String, String>{'heading': 'List group item heading', 'timestamp': '3 days ago', 'description': 'Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.', 'footer': 'Donec id elit non mi porta.'},
    <String, String>{'heading': 'List group item heading', 'timestamp': '3 days ago', 'description': 'Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.', 'footer': 'Donec id elit non mi porta.'},
    <String, String>{'heading': 'List group item heading', 'timestamp': '3 days ago', 'description': 'Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.', 'footer': 'Donec id elit non mi porta.'},
  ];

  void onSelectContent(int value) => selectedIndex.value = value;

  void onFirstCheckBox(bool? value) => isFirstChecked.value = value ?? false;

  void onSecondCheckBox(bool? value) => isSecondChecked.value = value ?? false;
}
