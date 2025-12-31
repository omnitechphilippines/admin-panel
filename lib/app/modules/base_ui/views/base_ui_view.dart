import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/base_ui_controller.dart';

class BaseUiView extends GetView<BaseUiController> {
  const BaseUiView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet(
      initialRoute: Routes.ACCORDION,
    );
  }
}
