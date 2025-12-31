import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/advance_ui_controller.dart';

class AdvanceUiView extends GetView<AdvanceUiController> {
  const AdvanceUiView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet(
      initialRoute: Routes.RATING,
    );
  }
}
