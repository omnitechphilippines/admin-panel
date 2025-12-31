import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/tables_controller.dart';

class TablesView extends GetView<TablesController> {
  const TablesView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet(
      initialRoute: Routes.BASIC,
    );
  }
}
