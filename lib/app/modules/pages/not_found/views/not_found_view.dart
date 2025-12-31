import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../../../helper/utils/my_shadow.dart';
import '../../../../../helper/widgets/my_card.dart';
import '../../../../../helper/widgets/my_container.dart';
import '../../../../../helper/widgets/my_flex.dart';
import '../../../../../helper/widgets/my_flex_item.dart';
import '../../../../../helper/widgets/my_spacing.dart';
import '../../../../../helper/widgets/my_text.dart';
import '../../../../../helper/widgets/responsive.dart';
import '../../../../../images.dart';
import '../../../../../themes/ui_mixin.dart';
import '../../../../../views/layout/layout.dart';
import '../controllers/not_found_controller.dart';

class NotFoundView extends GetView<NotFoundController> {
  const NotFoundView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: MySpacing.x(flexSpacing),
        child: Center(
          child: MyFlex(
            children: <MyFlexItem>[
              MyFlexItem(
                sizes: 'lg-4',
                child: MyCard(
                  height: 500,
                  padding: MySpacing.y(32),
                  shadow: MyShadow(elevation: 0.3, position: MyShadowPosition.center),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image.asset(Images.logoDarkFull, height: 36),
                      SvgPicture.asset('assets/404.svg', fit: BoxFit.fitHeight, height: 250),
                      MyText.titleLarge('Page not found!', fontWeight: 600),
                      Padding(
                        padding: MySpacing.x(MediaQuery.of(context).size.width * 0.07),
                        child: MyText.bodyMedium("The page you're trying to reach seems to have gone missing in the digital wilderness", height: 1.5, textAlign: TextAlign.center, fontWeight: 600, muted: true),
                      ),
                      MyContainer(
                        color: UiMixin.contentTheme.success,
                        paddingAll: 12,
                        onTap: controller.goToHome,
                        child: MyText.bodyMedium('Back to home', fontWeight: 600, color: UiMixin.contentTheme.onSuccess),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
