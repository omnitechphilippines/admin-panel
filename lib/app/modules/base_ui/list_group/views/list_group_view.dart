import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../helper/utils/my_shadow.dart';
import '../../../../../helper/widgets/my_button.dart';
import '../../../../../helper/widgets/my_card.dart';
import '../../../../../helper/widgets/my_container.dart';
import '../../../../../helper/widgets/my_flex.dart';
import '../../../../../helper/widgets/my_flex_item.dart';
import '../../../../../helper/widgets/my_spacing.dart';
import '../../../../../helper/widgets/my_text.dart';
import '../../../../../helper/widgets/responsive.dart';
import '../../../../../themes/app_theme.dart';
import '../../../../../themes/ui_mixin.dart';
import '../../../../../views/layout/layout.dart';
import '../controllers/list_group_controller.dart';

class ListGroupView extends GetView<ListGroupController> {
  const ListGroupView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: MySpacing.x(flexSpacing / 2),
        child: Center(
          child: MyFlex(
            children: <MyFlexItem>[
              MyFlexItem(sizes: 'lg-8', child: basic()),
              MyFlexItem(sizes: 'lg-8', child: activeItems()),
              MyFlexItem(sizes: 'lg-8', child: disabledItems()),
              MyFlexItem(sizes: 'lg-8', child: linksAndButtons()),
              MyFlexItem(sizes: 'lg-8', child: flush()),
              MyFlexItem(sizes: 'lg-8', child: numbered()),
              MyFlexItem(sizes: 'lg-8', child: horizontal()),
              MyFlexItem(sizes: 'lg-8', child: contextualClasses()),
              MyFlexItem(sizes: 'lg-8', child: customContent()),
              MyFlexItem(sizes: 'lg-8', child: checkboxesAndRadios()),
            ],
          ),
        ),
      ),
    );
  }

  Widget basic() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Basic', fontWeight: 600),
          MySpacing.height(16),
          MyContainer.bordered(
            paddingAll: 0,
            child: ListView.separated(
              itemCount: controller.basicExample.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final Map<String, String> basic = controller.basicExample[index];
                return MyContainer(
                  padding: MySpacing.all(16),
                  child: MyText.bodyMedium(basic['title']!, muted: true, fontWeight: 600, overflow: TextOverflow.ellipsis),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(height: 0);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget activeItems() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Active items', fontWeight: 600),
          MySpacing.height(16),
          MyContainer.bordered(
            paddingAll: 0,
            child: ListView.separated(
              itemCount: controller.basicExample.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final Map<String, String> basic = controller.basicExample[index];
                return MyContainer(
                  padding: MySpacing.all(16),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: index == 0 ? UiMixin.contentTheme.primary : null,
                  child: MyText.bodyMedium(basic['title']!, muted: true, fontWeight: 600, color: index == 0 ? UiMixin.contentTheme.onPrimary : null, overflow: TextOverflow.ellipsis),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(height: 0);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget disabledItems() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Disabled items', fontWeight: 600),
          MySpacing.height(16),
          MyContainer.bordered(
            paddingAll: 0,
            child: ListView.separated(
              itemCount: controller.basicExample.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final Map<String, String> basic = controller.basicExample[index];
                return MyContainer(
                  padding: MySpacing.all(16),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: index == 0 ? UiMixin.contentTheme.light : null,
                  child: Row(
                    children: <Widget>[MyText.bodyMedium(basic['title']!, muted: true, fontWeight: 600, color: index == 0 ? UiMixin.contentTheme.secondary : null, overflow: TextOverflow.ellipsis)],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(height: 0);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget linksAndButtons() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Links and buttons', fontWeight: 600),
          MySpacing.height(16),
          MyContainer.bordered(
            paddingAll: 0,
            child: ListView.separated(
              itemCount: controller.basicExample.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final Map<String, String> basic = controller.basicExample[index];
                return MyButton(
                  padding: MySpacing.all(16),
                  backgroundColor: theme.colorScheme.surface.withAlpha(5),
                  splashColor: theme.colorScheme.onSurface.withAlpha(10),
                  onPressed: () {},
                  child: Row(children: <Widget>[MyText.bodyMedium(basic['title']!, muted: true, fontWeight: 600, overflow: TextOverflow.ellipsis)]),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(height: 0);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget flush() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Flush', fontWeight: 600),
          MySpacing.height(16),
          ListView.separated(
            itemCount: controller.basicExample.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              final Map<String, String> basic = controller.basicExample[index];
              return MyText.bodyMedium(basic['title']!, muted: true, fontWeight: 600);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(height: 29);
            },
          ),
        ],
      ),
    );
  }

  Widget numbered() {
    Widget buildListItem(String index, String title, String badgeText) {
      return MyContainer.bordered(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyText.bodySmall(index, fontWeight: 600),
            MySpacing.width(20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MyText.bodyMedium(title, fontWeight: 600, maxLines: 1, overflow: TextOverflow.ellipsis),
                  MyText.bodySmall(title, fontWeight: 600, muted: true, maxLines: 1, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            MySpacing.width(20),
            MyContainer(
              padding: MySpacing.xy(6, 4),
              borderRadiusAll: 100,
              color: UiMixin.contentTheme.primary,
              child: MyText.bodySmall(badgeText, color: UiMixin.contentTheme.onPrimary),
            ),
          ],
        ),
      );
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Numbered', fontWeight: 600),
          MySpacing.height(16),
          ListView(shrinkWrap: true, children: <Widget>[buildListItem('1.', 'Henox Admin', '865'), MySpacing.height(20), buildListItem('2.', 'Henox React Admin', '140'), MySpacing.height(20), buildListItem('3.', 'Angular Version', '85')]),
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
          SizedBox(
            height: 55,
            child: ListView.separated(
              itemCount: controller.basicExample.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final Map<String, String> basic = controller.basicExample[index];
                return MyContainer.bordered(child: MyText.bodyMedium(basic['title']!, muted: true, fontWeight: 600));
              },
              separatorBuilder: (BuildContext context, int index) {
                return MySpacing.width(20);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget contextualClasses() {
    Widget buildListItem(String text, Color? color) {
      return MyContainer.bordered(
        borderRadiusAll: 0,
        border: Border(
          bottom: BorderSide(color: color!),
          left: BorderSide(color: color),
          right: BorderSide(color: color),
        ),
        color: color.withAlpha(36),
        paddingAll: 12,
        child: MyText.bodySmall(text, color: color),
      );
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Contextual classes', fontWeight: 600),
          MySpacing.height(16),
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              buildListItem('Dapibus ac facilisis in', UiMixin.contentTheme.light),
              buildListItem('A simple primary list group item', UiMixin.contentTheme.primary),
              buildListItem('A simple secondary list group item', UiMixin.contentTheme.secondary),
              buildListItem('A simple success list group item', UiMixin.contentTheme.success),
              buildListItem('A simple danger list group item', UiMixin.contentTheme.danger),
              buildListItem('A simple warning list group item', UiMixin.contentTheme.warning),
              buildListItem('A simple info list group item', UiMixin.contentTheme.info),
              buildListItem('A simple light list group item', UiMixin.contentTheme.light),
              buildListItem('A simple dark list group item', UiMixin.contentTheme.dark),
            ],
          ),
        ],
      ),
    );
  }

  Widget customContent() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Custom content', fontWeight: 600),
          MySpacing.height(16),
          Column(
            children: controller.customContent.asMap().entries.map((MapEntry<int, Map<String, String>> content) {
              final int index = content.key;
              final Map<String, dynamic> value = content.value;
              final bool isSelected = controller.selectedIndex.value == index;
              return MyContainer(
                onTap: () => controller.onSelectContent(index),
                color: isSelected ? UiMixin.contentTheme.primary : null,
                height: 112,
                bordered: !isSelected,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: MyText.bodyMedium(value['heading'], fontWeight: 600, color: isSelected ? UiMixin.contentTheme.onPrimary : null, overflow: TextOverflow.ellipsis, maxLines: 1),
                        ),
                        MyText.bodySmall(value['timestamp'], muted: true, fontWeight: 600, color: isSelected ? UiMixin.contentTheme.onPrimary : null, overflow: TextOverflow.ellipsis, maxLines: 1),
                      ],
                    ),
                    MyText.bodySmall(value['description'], muted: true, fontWeight: 600, color: isSelected ? UiMixin.contentTheme.onPrimary : null, overflow: TextOverflow.ellipsis, maxLines: 1),
                    MyText.bodyMedium(value['footer'], muted: true, fontWeight: 600, color: isSelected ? UiMixin.contentTheme.onPrimary : null, overflow: TextOverflow.ellipsis, maxLines: 1),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget checkboxesAndRadios() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Checkboxes and radios', fontWeight: 600),
          MySpacing.height(16),
          Theme(
            data: ThemeData(visualDensity: VisualDensity.compact),
            child: CheckboxListTile(
              title: MyText.bodyMedium('First checkbox', muted: true, fontWeight: 600),
              value: controller.isFirstChecked.value,
              controlAffinity: ListTileControlAffinity.leading,
              visualDensity: VisualDensity.compact,
              contentPadding: MySpacing.x(4),
              dense: true,
              onChanged: (bool? value) => controller.onFirstCheckBox(value),
            ),
          ),
          const Divider(height: 0),
          Theme(
            data: ThemeData(visualDensity: VisualDensity.compact),
            child: CheckboxListTile(
              title: MyText.bodyMedium('Second checkbox', muted: true, fontWeight: 600),
              value: controller.isSecondChecked.value,
              controlAffinity: ListTileControlAffinity.leading,
              visualDensity: VisualDensity.compact,
              contentPadding: MySpacing.x(4),
              dense: true,
              onChanged: (bool? value) => controller.onSecondCheckBox(value),
            ),
          ),
        ],
      ),
    );
  }
}
