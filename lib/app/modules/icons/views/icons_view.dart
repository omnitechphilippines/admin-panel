import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../helper/services/url_service.dart';
import '../../../../helper/utils/my_shadow.dart';
import '../../../../helper/widgets/my_button.dart';
import '../../../../helper/widgets/my_card.dart';
import '../../../../helper/widgets/my_spacing.dart';
import '../../../../helper/widgets/my_text.dart';
import '../../../../helper/widgets/responsive.dart';
import '../../../../themes/ui_mixin.dart';
import '../../../../views/layout/layout.dart';
import '../controllers/icons_controller.dart';

class IconsView extends GetView<IconsController> {
  const IconsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: MySpacing.x(flexSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GridView.builder(
              itemCount: controller.lucideIcons.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150, crossAxisSpacing: 20, mainAxisSpacing: 20, mainAxisExtent: 130),
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final Map<String, Object> icon = controller.lucideIcons[index];
                return MyCard(
                  shadow: MyShadow(elevation: 0.2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(icon['icon'] as IconData, size: 28, color: UiMixin.contentTheme.secondary),
                      MySpacing.height(16),
                      MyText.bodyMedium(icon['name'] as String, muted: true, fontWeight: 700, textAlign: TextAlign.center, color: UiMixin.contentTheme.secondary),
                    ],
                  ),
                );
              },
            ),
            MySpacing.height(20),
            Center(
              child: MyButton(
                onPressed: () => UrlService.goToLucideIcon(),
                elevation: 0,
                padding: MySpacing.all(16),
                backgroundColor: UiMixin.contentTheme.primary,
                borderRadiusAll: 4,
                child: MyText.bodyMedium('View All icons', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
