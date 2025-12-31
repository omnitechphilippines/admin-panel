import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

import 'package:get/get.dart';

import '../../../../../helper/utils/my_shadow.dart';
import '../../../../../helper/widgets/my_card.dart';
import '../../../../../helper/widgets/my_container.dart';
import '../../../../../helper/widgets/my_flex.dart';
import '../../../../../helper/widgets/my_flex_item.dart';
import '../../../../../helper/widgets/my_list_extension.dart';
import '../../../../../helper/widgets/my_spacing.dart';
import '../../../../../helper/widgets/my_text.dart';
import '../../../../../helper/widgets/responsive.dart';
import '../../../../../themes/ui_mixin.dart';
import '../../../../../views/layout/layout.dart';
import '../controllers/alert_controller.dart';

class AlertView extends GetView<AlertController> {
  const AlertView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: MySpacing.x(flexSpacing / 2),
        child: Center(
          child: MyFlex(
            children: <MyFlexItem>[
              MyFlexItem(sizes: 'lg-8', child: basicExample()),
              MyFlexItem(sizes: 'lg-8', child: dismissibleAlertsExample()),
              MyFlexItem(sizes: 'lg-8', child: alertLinkExample()),
              MyFlexItem(sizes: 'lg-8', child: iconsAlertExample()),
              MyFlexItem(sizes: 'lg-8', child: additionalContentAlertExample()),
            ],
          ),
        ),
      ),
    );
  }

  Widget basicExample() {
    Widget defaultAlertWidget(String colorName, Color color) {
      return MyContainer(
        width: Get.mediaQuery.size.width,
        color: color.withValues(alpha: 0.2),
        paddingAll: 12,
        onTap: () {},
        child: MyText.bodyMedium('A Simple $colorName alert--Check it out!', overflow: TextOverflow.ellipsis, color: colorName == 'Light' ? UiMixin.contentTheme.dark : null, fontWeight: 600),
      );
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Basic Example', fontWeight: 600),
          MySpacing.height(16),
          defaultAlertWidget('Primary', UiMixin.contentTheme.primary),
          MySpacing.height(16),
          defaultAlertWidget('Secondary', UiMixin.contentTheme.secondary),
          MySpacing.height(16),
          defaultAlertWidget('Success', UiMixin.contentTheme.success),
          MySpacing.height(16),
          defaultAlertWidget('Error', UiMixin.contentTheme.danger),
          MySpacing.height(16),
          defaultAlertWidget('Warning', UiMixin.contentTheme.warning),
          MySpacing.height(16),
          defaultAlertWidget('Info', UiMixin.contentTheme.info),
          MySpacing.height(16),
          defaultAlertWidget('Light', UiMixin.contentTheme.light),
          MySpacing.height(16),
          defaultAlertWidget('Dark', UiMixin.contentTheme.dark),
        ],
      ),
    );
  }

  Widget dismissibleAlertsExample() {
    Widget dismissingAlertsWidgets(String colorName, Color color, void Function()? onTap) {
      return MyContainer(
        color: color.withValues(alpha: 0.2),
        paddingAll: 12,
        margin: MySpacing.only(bottom: 15),
        child: Row(
          children: <Widget>[
            Expanded(
              child: MyText.bodyMedium('A Simple $colorName alert--Check it out!', overflow: TextOverflow.ellipsis, muted: true, color: colorName == 'Light' ? UiMixin.contentTheme.dark : null, fontWeight: 600),
            ),
            InkWell(
              onTap: onTap,
              child: Icon(LucideIcons.x, size: 17, color: colorName == 'Light' ? UiMixin.contentTheme.dark : null),
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
          MyText.titleMedium('Dismissible Alerts Example', fontWeight: 600),
          MySpacing.height(16),
          ...controller.dismissingAlerts.mapIndexed((int index, Object element) {
            final Map<String, String> alert = controller.dismissingAlerts[index];
            return dismissingAlertsWidgets(alert['colorName']!, Color(int.parse(alert['color']!)), () => controller.removeColorToggle(index));
          }),
        ],
      ),
    );
  }

  Widget alertLinkExample() {
    Widget linkColorWidget(String colorName, Color color) {
      return MyContainer(
        width: Get.mediaQuery.size.width,
        color: color.withValues(alpha: 0.2),
        paddingAll: 12,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: MyText.bodyMedium('A simple $colorName alert with', overflow: TextOverflow.ellipsis, muted: true, color: colorName == 'Light' ? UiMixin.contentTheme.dark : null),
            ),
            MySpacing.width(4),
            InkWell(
              onTap: () {},
              child: MyText.bodyMedium('an example link.', overflow: TextOverflow.ellipsis, maxLines: 1, fontWeight: 800, color: colorName == 'Light' ? UiMixin.contentTheme.dark : null),
            ),
            MySpacing.width(4),
            Expanded(
              child: MyText.bodyMedium('Give it a click if you like', overflow: TextOverflow.ellipsis, maxLines: 1, muted: true, color: colorName == 'Light' ? UiMixin.contentTheme.dark : null),
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
          MyText.titleMedium('Alert Link Example', fontWeight: 600),
          MySpacing.height(16),
          linkColorWidget('Primary', UiMixin.contentTheme.primary),
          MySpacing.height(16),
          linkColorWidget('Secondary', UiMixin.contentTheme.secondary),
          MySpacing.height(16),
          linkColorWidget('Success', UiMixin.contentTheme.success),
          MySpacing.height(16),
          linkColorWidget('Error', UiMixin.contentTheme.danger),
        ],
      ),
    );
  }

  Widget iconsAlertExample() {
    Widget iconWithAlertWidget(IconData icon, String colorName, Color color) {
      return MyContainer(
        color: color.withValues(alpha: 0.2),
        paddingAll: 12,
        child: Row(
          children: <Widget>[
            MyContainer(
              paddingAll: 8,
              color: color,
              child: Icon(icon, size: 20, color: UiMixin.contentTheme.light),
            ),
            MySpacing.width(12),
            MyText.bodyMedium('A simple $colorName alert—check it out!', fontWeight: 600),
          ],
        ),
      );
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Icons Alert Example', fontWeight: 600),
          MySpacing.height(16),
          iconWithAlertWidget(LucideIcons.check, 'Success', UiMixin.contentTheme.success),
          MySpacing.height(16),
          iconWithAlertWidget(LucideIcons.circle_x, 'Danger', UiMixin.contentTheme.danger),
          MySpacing.height(16),
          iconWithAlertWidget(LucideIcons.triangle_alert, 'Warning', UiMixin.contentTheme.warning),
          MySpacing.height(16),
          iconWithAlertWidget(LucideIcons.info, 'Info', UiMixin.contentTheme.info),
        ],
      ),
    );
  }

  Widget additionalContentAlertExample() {
    Widget additionalContentAlertExampleWidget(Color color) {
      return MyContainer(
        color: color.withValues(alpha: 0.2),
        width: Get.mediaQuery.size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyText.titleMedium('Well Done!', fontWeight: 600),
            MySpacing.height(12),
            MyText.bodyMedium(
              'Aww yeah, you successfully read this important alert message. This example text is going to run a bit longer so that you can see how spacing within an alert works with this kind of content.',
              muted: true,
              fontWeight: 600,
            ),
            Divider(color: UiMixin.contentTheme.onPrimary, thickness: .5, height: 24),
            MyText.bodySmall('Whenever you need to, be sure to use margin utilities to keep things nice and tidy.', fontWeight: 600),
          ],
        ),
      );
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Additional Content Alert Example', fontWeight: 600),
          MySpacing.height(16),
          MyFlex(
            contentPadding: false,
            children: <MyFlexItem>[
              MyFlexItem(sizes: 'lg-6', child: additionalContentAlertExampleWidget(UiMixin.contentTheme.primary)),
              MyFlexItem(sizes: 'lg-6', child: additionalContentAlertExampleWidget(UiMixin.contentTheme.secondary)),
            ],
          ),
        ],
      ),
    );
  }
}
