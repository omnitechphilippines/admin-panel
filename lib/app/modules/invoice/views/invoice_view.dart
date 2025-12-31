import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/invoice_controller.dart';

class InvoiceView extends GetView<InvoiceController> {
  const InvoiceView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet(
      initialRoute: Routes.LIST,
    );
  }
}
