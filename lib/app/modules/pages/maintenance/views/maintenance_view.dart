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
import '../controllers/maintenance_controller.dart';

class MaintenanceView extends GetView<MaintenanceController> {
  const MaintenanceView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: MySpacing.x(flexSpacing),
        child: Center(
          child: MyFlex(
            children: <MyFlexItem>[
              MyFlexItem(
                sizes: 'lg-8',
                child: MyCard(
                  paddingAll: 0,
                  shadow: MyShadow(elevation: 0.3, position: MyShadowPosition.center),
                  child: MyFlex(
                    wrapCrossAlignment: WrapCrossAlignment.center,
                    spacing: 0,
                    runSpacing: 0,
                    children: <MyFlexItem>[
                      MyFlexItem(
                        sizes: 'lg-6 md-6 ',
                        child: MyContainer.bordered(borderRadiusAll: 0, child: SvgPicture.asset('assets/404.svg', fit: BoxFit.fitHeight)),
                      ),
                      MyFlexItem(
                        sizes: 'lg-6 md-6 ',
                        child: Padding(
                          padding: MySpacing.y(flexSpacing),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(Images.logoDarkFull, height: 32),
                              MySpacing.height(32),
                              Padding(
                                padding: MySpacing.x(flexSpacing),
                                child: MyText.titleLarge('We are currently performing maintenance', fontWeight: 800, fontSize: 34, textAlign: TextAlign.center),
                              ),
                              MySpacing.height(32),
                              Padding(
                                padding: MySpacing.x(flexSpacing),
                                child: MyText.bodyMedium("We're making the system more awesome. We'll be back shortly.", fontWeight: 600, textAlign: TextAlign.center),
                              ),
                              MySpacing.height(32),
                              MyContainer(
                                color: UiMixin.contentTheme.success,
                                paddingAll: 12,
                                onTap: () {},
                                child: MyText.bodyMedium('Contact us', fontWeight: 600, color: UiMixin.contentTheme.onSuccess),
                              ),
                            ],
                          ),
                        ),
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
