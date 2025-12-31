import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../helper/utils/my_shadow.dart';
import '../../../../../helper/widgets/my_card.dart';
import '../../../../../helper/widgets/my_container.dart';
import '../../../../../helper/widgets/my_flex.dart';
import '../../../../../helper/widgets/my_flex_item.dart';
import '../../../../../helper/widgets/my_spacing.dart';
import '../../../../../helper/widgets/my_text.dart';
import '../../../../../helper/widgets/responsive.dart';
import '../../../../../themes/ui_mixin.dart';
import '../../../../../views/layout/layout.dart';
import '../controllers/collapse_controller.dart';

class CollapseView extends GetView<CollapseController> {
  const CollapseView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Layout(
        child: Padding(
          padding: MySpacing.x(flexSpacing / 2),
          child: Center(
            child: MyFlex(
              children: <MyFlexItem>[
                MyFlexItem(sizes: 'lg-8', child: defaultExample()),
                MyFlexItem(sizes: 'lg-8', child: horizontal()),
                MyFlexItem(sizes: 'lg-8', child: multipleTargets()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget defaultExample() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Default Example', fontWeight: 600),
          MySpacing.height(16),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: <Widget>[
              MyContainer(
                onTap: controller.onCollapse,
                color: UiMixin.contentTheme.primary,
                padding: MySpacing.xy(12, 8),
                child: MyText.bodyMedium('Link with href', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
              ),
              MyContainer(
                onTap: controller.onCollapse,
                color: UiMixin.contentTheme.primary,
                padding: MySpacing.xy(12, 8),
                child: MyText.bodyMedium('Button with data-bs-target', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
              ),
            ],
          ),
          if (controller.isCollapse.value) MySpacing.height(20),
          if (controller.isCollapse.value) MyContainer.bordered(child: MyText.bodyMedium(controller.dummyTexts[0], maxLines: 3, xMuted: true, fontWeight: 600)),
        ],
      ),
    );
  }

  Widget horizontal() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Horizontal', fontWeight: 600),
          MySpacing.height(16),
          MyContainer(
            onTap: controller.onCollapseHorizontal,
            color: UiMixin.contentTheme.primary,
            padding: MySpacing.xy(12, 8),
            child: MyText.bodySmall('Button with data-bs-target', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
          ),
          if (!controller.isCollapseHorizontal.value) MySpacing.height(20),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: controller.isCollapseHorizontal.value ? 0 : 300,
            child: Visibility(
              visible: !controller.isCollapseHorizontal.value,
              child: MyCard(child: MyText.bodyMedium(controller.dummyTexts[1], xMuted: true, maxLines: 3)),
            ),
          ),
        ],
      ),
    );
  }

  Widget multipleTargets() {
    return MyCard(
      shadow: MyShadow(elevation: 0.6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Multiple Targets', fontWeight: 600),
          MySpacing.height(16),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: <Widget>[
              MyContainer(
                onTap: controller.togglePanel1,
                color: UiMixin.contentTheme.primary,
                padding: MySpacing.xy(12, 8),
                child: MyText.bodySmall('Toggle first element', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
              ),
              MyContainer(
                onTap: controller.togglePanel2,
                color: UiMixin.contentTheme.primary,
                padding: MySpacing.xy(12, 8),
                child: MyText.bodySmall('Toggle second element', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
              ),
              MyContainer(
                onTap: controller.toggleAllPanels,
                color: UiMixin.contentTheme.primary,
                padding: MySpacing.xy(12, 8),
                child: MyText.bodySmall('Toggle both element', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
              ),
            ],
          ),
          if (controller.isPanel1Expanded.value || controller.isPanel2Expanded.value) MySpacing.height(20),
          Row(
            children: <Widget>[
              if (controller.isPanel1Expanded.value) Expanded(child: MyCard(child: MyText.bodyMedium(controller.dummyTexts[0], maxLines: 3, xMuted: true, fontWeight: 600))),
              if (controller.isPanel1Expanded.value) MySpacing.width(20),
              if (controller.isPanel2Expanded.value) Expanded(child: MyCard(child: MyText.bodyMedium(controller.dummyTexts[1], maxLines: 3, xMuted: true, fontWeight: 600))),
            ],
          ),
        ],
      ),
    );
  }
}
