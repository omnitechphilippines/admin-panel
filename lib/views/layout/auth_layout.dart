import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/layout/auth_layout_controller.dart';
import '../../helper/widgets/my_flex.dart';
import '../../helper/widgets/my_flex_item.dart';
import '../../helper/widgets/my_responsiv.dart';
import '../../helper/widgets/my_spacing.dart';

class AuthLayout extends StatelessWidget {
  final Widget? child;

  final AuthLayoutController controller = AuthLayoutController();

  AuthLayout({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return MyResponsive(
      builder: (BuildContext context, _, screenMT) {
        return GetBuilder(
          init: controller,
          builder: (controller) {
            return screenMT.isMobile ? mobileScreen(context) : largeScreen(context);
          },
        );
      },
    );
  }

  Widget mobileScreen(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      body: Center(
        child: SingleChildScrollView(padding: MySpacing.x(24), key: controller.scrollKey, child: child),
      ),
    );
  }

  Widget largeScreen(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: Color(0xfff3f3f5),
      body: Center(
        child: MyFlex(
          wrapAlignment: WrapAlignment.center,
          wrapCrossAlignment: WrapCrossAlignment.center,
          runAlignment: WrapAlignment.center,
          spacing: 0,
          runSpacing: 0,
          children: [MyFlexItem(sizes: "xxl-3.3 lg-4 md-6 sm-8", child: child ?? Container())],
        ),
      ),
    );
  }
}
