import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../helper/utils/my_shadow.dart';
import '../../../../../helper/widgets/my_card.dart';
import '../../../../../helper/widgets/my_flex.dart';
import '../../../../../helper/widgets/my_flex_item.dart';
import '../../../../../helper/widgets/my_spacing.dart';
import '../../../../../helper/widgets/my_text.dart';
import '../../../../../helper/widgets/responsive.dart';
import '../../../../../themes/ui_mixin.dart';
import '../../../../../views/layout/layout.dart';
import '../controllers/scrollbar_controller.dart';

class ScrollbarView extends GetView<ScrollbarController> {
  const ScrollbarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: MySpacing.x(flexSpacing / 2),
        child: Center(
          child: MyFlex(
            children: <MyFlexItem>[
              MyFlexItem(sizes: 'lg-8', child: defaultScrollExample()),
              MyFlexItem(sizes: 'lg-8', child: rtlPosition()),
              MyFlexItem(sizes: 'lg-8', child: scrollSize(context)),
              MyFlexItem(sizes: 'lg-8', child: scrollColor()),
            ],
          ),
        ),
      ),
    );
  }

  Widget defaultScrollExample() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Default Scroll Example', fontWeight: 600),
          MySpacing.height(16),
          SizedBox(
            height: 400,
            child: ListView(
              shrinkWrap: true,
              padding: MySpacing.all(20),
              children: <Widget>[
                MyText.bodySmall(controller.dummyTexts[0], muted: true),
                MySpacing.height(20),
                MyText.bodySmall(controller.dummyTexts[1], muted: true),
                MySpacing.height(20),
                MyText.bodySmall(controller.dummyTexts[2], muted: true),
                MySpacing.height(20),
                MyText.bodySmall(controller.dummyTexts[3], muted: true),
                MySpacing.height(20),
                MyText.bodySmall(controller.dummyTexts[4], muted: true),
                MySpacing.height(20),
                MyText.bodySmall(controller.dummyTexts[5], muted: true),
                MySpacing.height(20),
                MyText.bodySmall(controller.dummyTexts[6], muted: true),
                MySpacing.height(20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget rtlPosition() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('RTL Position', fontWeight: 600),
          MySpacing.height(16),
          SizedBox(
            height: 400,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: SingleChildScrollView(
                child: Padding(
                  padding: MySpacing.all(20),
                  child: Column(
                    children: <Widget>[
                      MyText.bodySmall(controller.dummyTexts[0], muted: true),
                      MySpacing.height(20),
                      MyText.bodySmall(controller.dummyTexts[1], muted: true),
                      MySpacing.height(20),
                      MyText.bodySmall(controller.dummyTexts[2], muted: true),
                      MySpacing.height(20),
                      MyText.bodySmall(controller.dummyTexts[3], muted: true),
                      MySpacing.height(20),
                      MyText.bodySmall(controller.dummyTexts[4], muted: true),
                      MySpacing.height(20),
                      MyText.bodySmall(controller.dummyTexts[5], muted: true),
                      MySpacing.height(20),
                      MyText.bodySmall(controller.dummyTexts[6], muted: true),
                      MySpacing.height(20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget scrollSize(BuildContext context) {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Scroll Size', fontWeight: 600),
          MySpacing.height(16),
          SizedBox(
            height: 400,
            child: Scrollbar(
              thickness: 12,
              thumbVisibility: true,
              controller: controller.scrollController.value,
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: ListView(
                  shrinkWrap: true,
                  controller: controller.scrollController.value,
                  padding: MySpacing.all(20),
                  children: <Widget>[
                    MyText.bodySmall(controller.dummyTexts[0], muted: true),
                    MySpacing.height(20),
                    MyText.bodySmall(controller.dummyTexts[1], muted: true),
                    MySpacing.height(20),
                    MyText.bodySmall(controller.dummyTexts[2], muted: true),
                    MySpacing.height(20),
                    MyText.bodySmall(controller.dummyTexts[3], muted: true),
                    MySpacing.height(20),
                    MyText.bodySmall(controller.dummyTexts[4], muted: true),
                    MySpacing.height(20),
                    MyText.bodySmall(controller.dummyTexts[5], muted: true),
                    MySpacing.height(20),
                    MyText.bodySmall(controller.dummyTexts[6], muted: true),
                    MySpacing.height(20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget scrollColor() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Scroll Color', fontWeight: 600),
          MySpacing.height(16),
          SizedBox(
            height: 400,
            child: ScrollbarTheme(
              data: ScrollbarThemeData(thumbColor: WidgetStatePropertyAll<Color?>(UiMixin.contentTheme.primary)),
              child: ListView(
                shrinkWrap: true,
                padding: MySpacing.all(20),
                children: <Widget>[
                  MyText.bodySmall(controller.dummyTexts[0], muted: true),
                  MySpacing.height(20),
                  MyText.bodySmall(controller.dummyTexts[1], muted: true),
                  MySpacing.height(20),
                  MyText.bodySmall(controller.dummyTexts[2], muted: true),
                  MySpacing.height(20),
                  MyText.bodySmall(controller.dummyTexts[3], muted: true),
                  MySpacing.height(20),
                  MyText.bodySmall(controller.dummyTexts[4], muted: true),
                  MySpacing.height(20),
                  MyText.bodySmall(controller.dummyTexts[5], muted: true),
                  MySpacing.height(20),
                  MyText.bodySmall(controller.dummyTexts[6], muted: true),
                  MySpacing.height(20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
