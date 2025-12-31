import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

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
import '../controllers/placeholder_controller.dart';

class PlaceholderView extends GetView<PlaceholderController> {
  const PlaceholderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Center(
        child: Padding(
          padding: MySpacing.x(flexSpacing / 2),
          child: MyFlex(
            children: <MyFlexItem>[
              MyFlexItem(sizes: 'lg-8', child: defaultPlaceholders()),
              MyFlexItem(sizes: 'lg-8', child: width()),
              MyFlexItem(sizes: 'lg-8', child: color()),
            ],
          ),
        ),
      ),
    );
  }

  Widget defaultPlaceholders() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Default', fontWeight: 600),
          MySpacing.height(16),
          MyFlex(
            contentPadding: false,
            children: <MyFlexItem>[
              MyFlexItem(
                sizes: 'lg-6 md-6',
                child: MyCard(
                  paddingAll: 0,
                  borderRadiusAll: 4,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MyContainer(
                        height: 250,
                        paddingAll: 0,
                        width: double.infinity,
                        child: Image.asset(Images.small[0], fit: BoxFit.cover),
                      ),
                      Padding(
                        padding: MySpacing.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            MyText.titleMedium('Card Title', fontWeight: 600),
                            MySpacing.height(20),
                            MyText.bodyMedium(controller.dummyTexts[0], xMuted: true, maxLines: 3),
                            MySpacing.height(20),
                            MyContainer(
                              onTap: () {},
                              color: UiMixin.contentTheme.primary,
                              paddingAll: 12,
                              child: MyText.bodyMedium('Go somewhere', color: UiMixin.contentTheme.onPrimary),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              MyFlexItem(
                sizes: 'lg-6 md-6',
                child: Shimmer.fromColors(
                  baseColor: UiMixin.contentTheme.secondary.withAlpha(36),
                  highlightColor: UiMixin.contentTheme.dark.withAlpha(60),
                  child: Container(
                    padding: MySpacing.all(16),
                    width: Get.mediaQuery.size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(height: 200, width: double.infinity, color: Colors.grey),
                        Padding(
                          padding: MySpacing.only(top: 20),
                          child: Container(height: 12, width: 100, color: Colors.grey),
                        ),
                        Padding(
                          padding: MySpacing.only(top: 20),
                          child: Container(height: 52, color: Colors.grey),
                        ),
                        Padding(
                          padding: MySpacing.only(top: 20),
                          child: Container(height: 32, width: 80, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget width() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Width', fontWeight: 600),
          MySpacing.height(16),
          colorWidget(UiMixin.contentTheme.secondary, width: Get.size.width * .2),
          MySpacing.height(20),
          colorWidget(UiMixin.contentTheme.secondary, width: Get.size.width * .35),
          MySpacing.height(20),
          colorWidget(UiMixin.contentTheme.secondary, width: Get.size.width * .15),
        ],
      ),
    );
  }

  Widget color() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Color', fontWeight: 600),
          MySpacing.height(16),
          colorWidget(UiMixin.contentTheme.secondary),
          colorWidget(UiMixin.contentTheme.primary),
          colorWidget(UiMixin.contentTheme.info),
          colorWidget(UiMixin.contentTheme.danger),
          colorWidget(UiMixin.contentTheme.warning),
          colorWidget(UiMixin.contentTheme.pink),
          colorWidget(UiMixin.contentTheme.purple),
          colorWidget(UiMixin.contentTheme.light),
          colorWidget(UiMixin.contentTheme.dark),
        ],
      ),
    );
  }

  Widget colorWidget(Color color, {double? width}) {
    return Shimmer.fromColors(
      baseColor: color.withAlpha(36),
      highlightColor: UiMixin.contentTheme.secondary.withAlpha(60),
      child: Container(margin: MySpacing.top(12), height: 12, width: width ?? double.infinity, color: Colors.grey),
    );
  }
}
