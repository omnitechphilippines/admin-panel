import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../helper/utils/my_shadow.dart';
import '../../../../../helper/widgets/my_card.dart';
import '../../../../../helper/widgets/my_flex.dart';
import '../../../../../helper/widgets/my_flex_item.dart';
import '../../../../../helper/widgets/my_spacing.dart';
import '../../../../../helper/widgets/my_tab_indicator_style.dart';
import '../../../../../helper/widgets/my_text.dart';
import '../../../../../helper/widgets/responsive.dart';
import '../../../../../themes/ui_mixin.dart';
import '../../../../../views/layout/layout.dart';
import '../controllers/tabs_controller.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Center(
        child: Obx(
          () => Padding(
            padding: MySpacing.x(flexSpacing / 2),
            child: MyFlex(
              children: <MyFlexItem>[
                MyFlexItem(sizes: 'lg-8', child: defaultTab()),
                MyFlexItem(sizes: 'lg-8', child: fullWidth()),
                MyFlexItem(sizes: 'lg-8', child: backgroundIndicator()),
                MyFlexItem(sizes: 'lg-8', child: borderedIndicator()),
                MyFlexItem(sizes: 'lg-8', child: softIndicator()),
                MyFlexItem(sizes: 'lg-8', child: customIndicator1()),
                MyFlexItem(sizes: 'lg-8', child: customIndicator2()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget defaultTab() {
    return MyCard(
      paddingAll: 0,
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: MySpacing.only(left: 16, top: 12), child: MyText.titleMedium('Default Tabs', fontWeight: 600)),
          const Divider(height: 20),
          Padding(
            padding: MySpacing.only(left: 16, bottom: 12),
            child: TabBar(
              controller: controller.defaultTabController,
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  icon: MyText.bodyMedium('Home', fontWeight: controller.defaultIndex.value == 0 ? 600 : 500, color: controller.defaultIndex.value == 0 ? UiMixin.contentTheme.primary : null),
                ),
                Tab(
                  icon: MyText.bodyMedium('Profile', fontWeight: controller.defaultIndex.value == 1 ? 600 : 500, color: controller.defaultIndex.value == 1 ? UiMixin.contentTheme.primary : null),
                ),
                Tab(
                  icon: MyText.bodyMedium('Messages', fontWeight: controller.defaultIndex.value == 2 ? 600 : 500, color: controller.defaultIndex.value == 2 ? UiMixin.contentTheme.primary : null),
                ),
              ],
              indicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
          SizedBox(
            height: 60,
            child: Padding(
              padding: MySpacing.only(left: 16, bottom: 12),
              child: TabBarView(controller: controller.defaultTabController, children: <Widget>[MyText.bodySmall(controller.dummyTexts[0]), MyText.bodySmall(controller.dummyTexts[1]), MyText.bodySmall(controller.dummyTexts[2])]),
            ),
          ),
        ],
      ),
    );
  }

  Widget fullWidth() {
    return MyCard(
      paddingAll: 0,
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: MySpacing.only(left: 16, top: 12), child: MyText.titleMedium('Full Width', fontWeight: 600)),
          const Divider(height: 28),
          Padding(
            padding: MySpacing.only(left: 16, bottom: 8),
            child: TabBar(
              controller: controller.fullWidthTabController,
              tabs: <Widget>[
                Tab(
                  icon: MyText.bodyMedium('Home', fontWeight: controller.fullWidthIndex.value == 0 ? 600 : 500, color: controller.fullWidthIndex.value == 0 ? UiMixin.contentTheme.primary : null),
                ),
                Tab(
                  icon: MyText.bodyMedium('Profile', fontWeight: controller.fullWidthIndex.value == 1 ? 600 : 500, color: controller.fullWidthIndex.value == 1 ? UiMixin.contentTheme.primary : null),
                ),
                Tab(
                  icon: MyText.bodyMedium('Messages', fontWeight: controller.fullWidthIndex.value == 2 ? 600 : 500, color: controller.fullWidthIndex.value == 2 ? UiMixin.contentTheme.primary : null),
                ),
              ],
              indicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
          MySpacing.height(16),
          SizedBox(
            height: 60,
            child: Padding(
              padding: MySpacing.only(left: 16, bottom: 12),
              child: TabBarView(controller: controller.fullWidthTabController, children: <Widget>[MyText.bodySmall(controller.dummyTexts[0]), MyText.bodySmall(controller.dummyTexts[1]), MyText.bodySmall(controller.dummyTexts[2])]),
            ),
          ),
        ],
      ),
    );
  }

  Widget backgroundIndicator() {
    return MyCard(
      paddingAll: 0,
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: MySpacing.only(left: 16, top: 12), child: MyText.titleMedium('Background Indicator', fontWeight: 600)),
          const Divider(height: 28),
          Padding(
            padding: MySpacing.only(left: 16, bottom: 12),
            child: TabBar(
              controller: controller.backgroundTabController,
              isScrollable: true,
              indicator: BoxDecoration(borderRadius: BorderRadius.circular(4), color: UiMixin.contentTheme.primary),
              tabs: <Widget>[
                Tab(
                  icon: MyText.bodyMedium('Home', fontWeight: controller.backgroundIndex.value == 0 ? 600 : 500, color: controller.backgroundIndex.value == 0 ? UiMixin.contentTheme.onPrimary : null),
                ),
                Tab(
                  icon: MyText.bodyMedium('Profile', fontWeight: controller.backgroundIndex.value == 1 ? 600 : 500, color: controller.backgroundIndex.value == 1 ? UiMixin.contentTheme.onPrimary : null),
                ),
                Tab(
                  icon: MyText.bodyMedium('Messages', fontWeight: controller.backgroundIndex.value == 2 ? 600 : 500, color: controller.backgroundIndex.value == 2 ? UiMixin.contentTheme.onPrimary : null),
                ),
              ],
              indicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
          MySpacing.height(16),
          SizedBox(
            height: 60,
            child: Padding(
              padding: MySpacing.only(left: 16, bottom: 12),
              child: TabBarView(controller: controller.backgroundTabController, children: <Widget>[MyText.bodySmall(controller.dummyTexts[0]), MyText.bodySmall(controller.dummyTexts[1]), MyText.bodySmall(controller.dummyTexts[2])]),
            ),
          ),
        ],
      ),
    );
  }

  Widget borderedIndicator() {
    return MyCard(
      paddingAll: 0,
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: MySpacing.only(left: 16, top: 12), child: MyText.titleMedium('Bordered Indicator', fontWeight: 600)),
          const Divider(height: 28),
          Padding(
            padding: MySpacing.only(left: 16, bottom: 12),
            child: TabBar(
              controller: controller.borderedTabController,
              isScrollable: true,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: UiMixin.contentTheme.primary, width: 1.2),
              ),
              tabs: <Widget>[
                Tab(
                  icon: MyText.bodyMedium('Home', fontWeight: controller.borderedIndex.value == 0 ? 600 : 500, color: controller.borderedIndex.value == 0 ? UiMixin.contentTheme.primary : null),
                ),
                Tab(
                  icon: MyText.bodyMedium('Profile', fontWeight: controller.borderedIndex.value == 1 ? 600 : 500, color: controller.borderedIndex.value == 1 ? UiMixin.contentTheme.primary : null),
                ),
                Tab(
                  icon: MyText.bodyMedium('Messages', fontWeight: controller.borderedIndex.value == 2 ? 600 : 500, color: controller.borderedIndex.value == 2 ? UiMixin.contentTheme.primary : null),
                ),
              ],
              indicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
          MySpacing.height(16),
          SizedBox(
            height: 60,
            child: Padding(
              padding: MySpacing.only(left: 16, bottom: 12),
              child: TabBarView(controller: controller.borderedTabController, children: <Widget>[MyText.bodySmall(controller.dummyTexts[0]), MyText.bodySmall(controller.dummyTexts[1]), MyText.bodySmall(controller.dummyTexts[2])]),
            ),
          ),
        ],
      ),
    );
  }

  Widget softIndicator() {
    return MyCard(
      paddingAll: 0,
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: MySpacing.only(left: 16, top: 12), child: MyText.titleMedium('Soft Indicator', fontWeight: 600)),
          const Divider(height: 28),
          Padding(
            padding: MySpacing.only(left: 16, bottom: 12),
            child: TabBar(
              controller: controller.softTabController,
              isScrollable: true,
              indicator: BoxDecoration(borderRadius: BorderRadius.circular(4), color: UiMixin.contentTheme.primary.withAlpha(40)),
              tabs: <Widget>[
                Tab(
                  icon: MyText.bodyMedium('Home', fontWeight: controller.softIndex.value == 0 ? 600 : 500, color: controller.softIndex.value == 0 ? UiMixin.contentTheme.primary : null),
                ),
                Tab(
                  icon: MyText.bodyMedium('Profile', fontWeight: controller.softIndex.value == 1 ? 600 : 500, color: controller.softIndex.value == 1 ? UiMixin.contentTheme.primary : null),
                ),
                Tab(
                  icon: MyText.bodyMedium('Messages', fontWeight: controller.softIndex.value == 2 ? 600 : 500, color: controller.softIndex.value == 2 ? UiMixin.contentTheme.primary : null),
                ),
              ],
              indicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
          MySpacing.height(16),
          SizedBox(
            height: 60,
            child: Padding(
              padding: MySpacing.only(left: 16, bottom: 12),
              child: TabBarView(controller: controller.softTabController, children: <Widget>[MyText.bodySmall(controller.dummyTexts[0]), MyText.bodySmall(controller.dummyTexts[1]), MyText.bodySmall(controller.dummyTexts[2])]),
            ),
          ),
        ],
      ),
    );
  }

  Widget customIndicator1() {
    return MyCard(
      paddingAll: 0,
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: MySpacing.only(left: 16, top: 12), child: MyText.titleMedium("${"Custom Indicator"} #1", fontWeight: 600)),
          const Divider(height: 28),
          Padding(
            padding: MySpacing.only(left: 16, bottom: 12),
            child: TabBar(
              controller: controller.customTabController1,
              isScrollable: true,
              indicator: MyTabIndicator(indicatorColor: UiMixin.contentTheme.primary, indicatorStyle: MyTabIndicatorStyle.rectangle, yOffset: 40),
              tabs: <Widget>[
                Tab(
                  icon: MyText.bodyMedium('Home', fontWeight: controller.customIndex1.value == 0 ? 600 : 500, color: controller.customIndex1.value == 0 ? UiMixin.contentTheme.primary : null),
                ),
                Tab(
                  icon: MyText.bodyMedium('Profile', fontWeight: controller.customIndex1.value == 1 ? 600 : 500, color: controller.customIndex1.value == 1 ? UiMixin.contentTheme.primary : null),
                ),
                Tab(
                  icon: MyText.bodyMedium('Messages', fontWeight: controller.customIndex1.value == 2 ? 600 : 500, color: controller.customIndex1.value == 2 ? UiMixin.contentTheme.primary : null),
                ),
              ],
              indicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
          MySpacing.height(16),
          SizedBox(
            height: 60,
            child: Padding(
              padding: MySpacing.only(left: 16, bottom: 12),
              child: TabBarView(controller: controller.customTabController1, children: <Widget>[MyText.bodySmall(controller.dummyTexts[0]), MyText.bodySmall(controller.dummyTexts[1]), MyText.bodySmall(controller.dummyTexts[2])]),
            ),
          ),
        ],
      ),
    );
  }

  Widget customIndicator2() {
    return MyCard(
      paddingAll: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: MySpacing.only(left: 16, top: 12), child: MyText.titleMedium('Custom Indicator #2', fontWeight: 600)),
          const Divider(height: 28),
          Padding(
            padding: MySpacing.only(left: 16, bottom: 12),
            child: TabBar(
              controller: controller.customTabController2,
              isScrollable: true,
              physics: const NeverScrollableScrollPhysics(),
              indicator: MyTabIndicator(indicatorColor: UiMixin.contentTheme.primary, indicatorStyle: MyTabIndicatorStyle.circle, yOffset: 40),
              tabs: <Widget>[
                Tab(
                  icon: MyText.bodyMedium('Home', fontWeight: controller.customIndex2.value == 0 ? 600 : 500, color: controller.customIndex2.value == 0 ? UiMixin.contentTheme.primary : null),
                ),
                Tab(
                  icon: MyText.bodyMedium('Profile', fontWeight: controller.customIndex2.value == 1 ? 600 : 500, color: controller.customIndex2.value == 1 ? UiMixin.contentTheme.primary : null),
                ),
                Tab(
                  icon: MyText.bodyMedium('Messages', fontWeight: controller.customIndex2.value == 2 ? 600 : 500, color: controller.customIndex2.value == 2 ? UiMixin.contentTheme.primary : null),
                ),
              ],
              indicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
          MySpacing.height(16),
          SizedBox(
            height: 60,
            child: Padding(
              padding: MySpacing.only(left: 16, bottom: 12),
              child: TabBarView(controller: controller.customTabController2, children: <Widget>[MyText.bodySmall(controller.dummyTexts[0]), MyText.bodySmall(controller.dummyTexts[1]), MyText.bodySmall(controller.dummyTexts[2])]),
            ),
          ),
        ],
      ),
    );
  }
}
