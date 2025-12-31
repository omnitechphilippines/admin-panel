import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/forms_controller.dart';

class FormsView extends GetView<FormsController> {
  const FormsView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet(
      initialRoute: Routes.BASIC_ELEMENT,
    );
  }
}
