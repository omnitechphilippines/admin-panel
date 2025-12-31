import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../helper/utils/my_shadow.dart';
import '../../../../../helper/widgets/my_card.dart';
import '../../../../../helper/widgets/my_flex.dart';
import '../../../../../helper/widgets/my_flex_item.dart';
import '../../../../../helper/widgets/my_progress_bar.dart';
import '../../../../../helper/widgets/my_spacing.dart';
import '../../../../../helper/widgets/my_text.dart';
import '../../../../../helper/widgets/responsive.dart';
import '../../../../../themes/app_theme.dart';
import '../../../../../themes/ui_mixin.dart';
import '../../../../../views/layout/layout.dart';
import '../controllers/progress_controller.dart';

class ProgressView extends GetView<ProgressController> {
  const ProgressView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Center(
        child: Padding(
          padding: MySpacing.x(flexSpacing / 2),
          child: MyFlex(
            children: <MyFlexItem>[
              MyFlexItem(sizes: 'lg-8', child: example()),
              MyFlexItem(sizes: 'lg-8', child: height()),
              MyFlexItem(sizes: 'lg-8', child: backgroundsColor()),
            ],
          ),
        ),
      ),
    );
  }

  Widget example() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Example', fontWeight: 600),
          MySpacing.height(16),
          MyProgressBar(progress: 0, height: 20, width: Get.mediaQuery.size.width, inactiveColor: theme.colorScheme.secondary.withAlpha(36)),
          MySpacing.height(20),
          MyProgressBar(progress: .2, height: 20, width: Get.mediaQuery.size.width, inactiveColor: theme.colorScheme.secondary.withAlpha(36), activeColor: UiMixin.contentTheme.primary),
          MySpacing.height(20),
          MyProgressBar(progress: .3, height: 20, width: Get.mediaQuery.size.width, inactiveColor: theme.colorScheme.secondary.withAlpha(36), activeColor: UiMixin.contentTheme.primary),
          MySpacing.height(20),
          MyProgressBar(progress: .4, height: 20, width: Get.mediaQuery.size.width, inactiveColor: theme.colorScheme.secondary.withAlpha(36), activeColor: UiMixin.contentTheme.primary),
          MySpacing.height(20),
          MyProgressBar(progress: 1, height: 20, width: Get.mediaQuery.size.width, inactiveColor: theme.colorScheme.secondary.withAlpha(36), activeColor: UiMixin.contentTheme.primary),
        ],
      ),
    );
  }

  Widget height() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Height', fontWeight: 600),
          MySpacing.height(16),
          MyProgressBar(progress: .1, height: 4, width: Get.mediaQuery.size.width, activeColor: UiMixin.contentTheme.primary, inactiveColor: theme.colorScheme.secondary.withAlpha(36)),
          MySpacing.height(20),
          MyProgressBar(progress: .2, height: 8, width: Get.mediaQuery.size.width, inactiveColor: theme.colorScheme.secondary.withAlpha(36), activeColor: UiMixin.contentTheme.secondary),
          MySpacing.height(20),
          MyProgressBar(progress: .3, height: 12, width: Get.mediaQuery.size.width, inactiveColor: theme.colorScheme.secondary.withAlpha(36), activeColor: UiMixin.contentTheme.info),
          MySpacing.height(20),
          MyProgressBar(progress: .4, height: 16, width: Get.mediaQuery.size.width, inactiveColor: theme.colorScheme.secondary.withAlpha(36), activeColor: UiMixin.contentTheme.pink),
          MySpacing.height(20),
          MyProgressBar(progress: .5, height: 20, width: Get.mediaQuery.size.width, inactiveColor: theme.colorScheme.secondary.withAlpha(36), activeColor: UiMixin.contentTheme.purple),
        ],
      ),
    );
  }

  Widget backgroundsColor() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Backgrounds Color', fontWeight: 600),
          MySpacing.height(16),
          MyProgressBar(progress: .1, height: 20, width: Get.mediaQuery.size.width, inactiveColor: theme.colorScheme.secondary.withAlpha(36), activeColor: UiMixin.contentTheme.success),
          MySpacing.height(20),
          MyProgressBar(progress: .2, height: 20, width: Get.mediaQuery.size.width, inactiveColor: theme.colorScheme.secondary.withAlpha(36), activeColor: UiMixin.contentTheme.info),
          MySpacing.height(20),
          MyProgressBar(progress: .3, height: 20, width: Get.mediaQuery.size.width, inactiveColor: theme.colorScheme.secondary.withAlpha(36), activeColor: UiMixin.contentTheme.warning),
          MySpacing.height(20),
          MyProgressBar(progress: .4, height: 20, width: Get.mediaQuery.size.width, inactiveColor: theme.colorScheme.secondary.withAlpha(36), activeColor: UiMixin.contentTheme.danger),
          MySpacing.height(20),
          MyProgressBar(progress: .4, height: 20, width: Get.mediaQuery.size.width, inactiveColor: theme.colorScheme.secondary.withAlpha(36), activeColor: UiMixin.contentTheme.pink),
          MySpacing.height(20),
          MyProgressBar(progress: .3, height: 20, width: Get.mediaQuery.size.width, inactiveColor: theme.colorScheme.secondary.withAlpha(36), activeColor: UiMixin.contentTheme.purple),
          MySpacing.height(20),
          MyProgressBar(progress: .2, height: 20, width: Get.mediaQuery.size.width, inactiveColor: theme.colorScheme.secondary.withAlpha(36), activeColor: UiMixin.contentTheme.dark),
          MySpacing.height(20),
          MyProgressBar(progress: .1, height: 20, width: Get.mediaQuery.size.width, inactiveColor: theme.colorScheme.secondary.withAlpha(36), activeColor: UiMixin.contentTheme.dark.withAlpha(70)),
        ],
      ),
    );
  }
}
