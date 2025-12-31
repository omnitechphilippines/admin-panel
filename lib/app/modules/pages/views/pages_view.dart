import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/pages_controller.dart';

class PagesView extends GetView<PagesController> {
  const PagesView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet(
      initialRoute: Routes.FAQS,
    );
  }
}
