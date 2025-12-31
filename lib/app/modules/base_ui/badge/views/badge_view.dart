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
import '../controllers/badge_controller.dart';

class BadgeView extends GetView<BadgeController> {
  const BadgeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: MySpacing.x(flexSpacing / 2),
        child: Center(
          child: MyFlex(
            children: <MyFlexItem>[
              MyFlexItem(sizes: 'lg-8', child: heading()),
              MyFlexItem(sizes: 'lg-8', child: defaultAndPillBadges()),
              MyFlexItem(sizes: 'lg-8', child: outlineAndOutlinePillBadges()),
              MyFlexItem(sizes: 'lg-8', child: softAndSoftPillBadges()),
              MyFlexItem(sizes: 'lg-8', child: buttonsAndPosition()),
            ],
          ),
        ),
      ),
    );
  }

  Widget heading() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Heading', fontWeight: 600),
          MySpacing.height(16),
          Row(
            children: <Widget>[
              MyText.displaySmall('h1.Example heading', fontWeight: 600),
              MySpacing.width(4),
              MyContainer(
                padding: MySpacing.xy(8, 2),
                color: UiMixin.contentTheme.secondary,
                child: MyText.displaySmall('New', color: UiMixin.contentTheme.onSecondary),
              ),
            ],
          ),
          MySpacing.height(8),
          Row(
            children: <Widget>[
              MyText.titleLarge('h2.Example heading', fontWeight: 600),
              MySpacing.width(4),
              MyContainer(
                padding: MySpacing.xy(8, 2),
                color: UiMixin.contentTheme.success.withValues(alpha: 0.2),
                child: MyText.titleLarge('New', color: UiMixin.contentTheme.success),
              ),
            ],
          ),
          MySpacing.height(8),
          Row(
            children: <Widget>[
              MyText.bodyLarge('h4.Example heading', fontWeight: 600),
              MySpacing.width(4),
              MyContainer(
                padding: MySpacing.xy(6, 2),
                color: UiMixin.contentTheme.primary,
                child: MyText.bodyLarge('New', color: UiMixin.contentTheme.onPrimary),
              ),
            ],
          ),
          MySpacing.height(8),
          Row(
            children: <Widget>[
              MyText.titleMedium('h2.Example heading', fontWeight: 600),
              MySpacing.width(4),
              MyContainer(
                padding: MySpacing.xy(8, 2),
                color: UiMixin.contentTheme.info.withValues(alpha: 0.2),
                child: MyText.titleMedium('Info Link', color: UiMixin.contentTheme.info),
              ),
            ],
          ),
          MySpacing.height(8),
          Row(
            children: <Widget>[
              MyText.bodyMedium('h5.Example heading', fontWeight: 600),
              MySpacing.width(4),
              MyContainer.bordered(
                padding: MySpacing.xy(8, 2),
                borderColor: UiMixin.contentTheme.warning,
                child: MyText.bodyMedium('New', color: UiMixin.contentTheme.warning),
              ),
            ],
          ),
          MySpacing.height(8),
          Row(
            children: <Widget>[
              MyText.bodySmall('h6.Example heading', fontWeight: 600),
              MySpacing.width(4),
              MyContainer(
                padding: MySpacing.xy(4, 2),
                color: UiMixin.contentTheme.danger,
                child: MyText.bodySmall('New', color: UiMixin.contentTheme.onDanger),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget defaultAndPillBadges() {
    Widget defaultBadge(Color color, String text, [Color? textColor]) {
      return MyContainer(
        padding: MySpacing.xy(8, 6),
        color: color,
        child: MyText.labelMedium(text, fontWeight: 600, color: textColor),
      );
    }

    Widget pillBadge(Color color, String text, [Color? textColor]) {
      return MyContainer(
        padding: MySpacing.xy(8, 6),
        borderRadiusAll: 100,
        color: color,
        child: MyText.labelMedium(text, fontWeight: 600, color: textColor),
      );
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Default & Pill Badges', fontWeight: 600),
          MySpacing.height(16),
          Wrap(
            runSpacing: 8,
            spacing: 8,
            children: <Widget>[
              defaultBadge(UiMixin.contentTheme.primary, 'Primary', UiMixin.contentTheme.onPrimary),
              defaultBadge(UiMixin.contentTheme.secondary, 'Secondary', UiMixin.contentTheme.onSecondary),
              defaultBadge(UiMixin.contentTheme.success, 'Success', UiMixin.contentTheme.onSuccess),
              defaultBadge(UiMixin.contentTheme.info, 'Info', UiMixin.contentTheme.onInfo),
              defaultBadge(UiMixin.contentTheme.warning, 'Warning', UiMixin.contentTheme.onWarning),
              defaultBadge(UiMixin.contentTheme.danger, 'Danger', UiMixin.contentTheme.onDanger),
              defaultBadge(UiMixin.contentTheme.dark, 'Dark', UiMixin.contentTheme.onDark),
            ],
          ),
          MySpacing.height(16),
          Wrap(
            runSpacing: 8,
            spacing: 8,
            children: <Widget>[
              pillBadge(UiMixin.contentTheme.primary, 'Primary', UiMixin.contentTheme.onPrimary),
              pillBadge(UiMixin.contentTheme.secondary, 'Secondary', UiMixin.contentTheme.onSecondary),
              pillBadge(UiMixin.contentTheme.success, 'Success', UiMixin.contentTheme.onSuccess),
              pillBadge(UiMixin.contentTheme.info, 'Info', UiMixin.contentTheme.onInfo),
              pillBadge(UiMixin.contentTheme.warning, 'Warning', UiMixin.contentTheme.onWarning),
              pillBadge(UiMixin.contentTheme.danger, 'Danger', UiMixin.contentTheme.onDanger),
              pillBadge(UiMixin.contentTheme.dark, 'Dark', UiMixin.contentTheme.onDark),
            ],
          ),
        ],
      ),
    );
  }

  Widget outlineAndOutlinePillBadges() {
    Widget outlinedBadges(Color color, String text) {
      return MyContainer.bordered(
        padding: MySpacing.xy(8, 6),
        borderColor: color.withValues(alpha: .2),
        child: MyText.labelMedium(text, fontWeight: 600, color: color),
      );
    }

    Widget outlinedPillBadges(Color color, String text) {
      return MyContainer.bordered(
        padding: MySpacing.xy(8, 6),
        borderRadiusAll: 100,
        borderColor: color.withValues(alpha: .2),
        child: MyText.labelMedium(text, fontWeight: 600, color: color),
      );
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Outline & Outline Pill Badges', fontWeight: 600),
          MySpacing.height(16),
          Wrap(
            runSpacing: 8,
            spacing: 8,
            children: <Widget>[
              outlinedBadges(UiMixin.contentTheme.primary, 'Primary'),
              outlinedBadges(UiMixin.contentTheme.secondary, 'Secondary'),
              outlinedBadges(UiMixin.contentTheme.success, 'Success'),
              outlinedBadges(UiMixin.contentTheme.info, 'Info'),
              outlinedBadges(UiMixin.contentTheme.warning, 'Warning'),
              outlinedBadges(UiMixin.contentTheme.danger, 'Danger'),
              outlinedBadges(UiMixin.contentTheme.dark, 'Dark'),
            ],
          ),
          MySpacing.height(16),
          Wrap(
            runSpacing: 8,
            spacing: 8,
            children: <Widget>[
              outlinedPillBadges(UiMixin.contentTheme.primary, 'Primary'),
              outlinedPillBadges(UiMixin.contentTheme.secondary, 'Secondary'),
              outlinedPillBadges(UiMixin.contentTheme.success, 'Success'),
              outlinedPillBadges(UiMixin.contentTheme.info, 'Info'),
              outlinedPillBadges(UiMixin.contentTheme.warning, 'Warning'),
              outlinedPillBadges(UiMixin.contentTheme.danger, 'Danger'),
              outlinedPillBadges(UiMixin.contentTheme.dark, 'Dark'),
            ],
          ),
        ],
      ),
    );
  }

  Widget softAndSoftPillBadges() {
    Widget lightenBadges(Color color, String text) {
      return MyContainer(
        padding: MySpacing.xy(8, 6),
        color: color.withValues(alpha: .2),
        child: MyText.labelMedium(text, fontWeight: 600, color: color),
      );
    }

    Widget lightenPillBadges(Color color, String text) {
      return MyContainer(
        padding: MySpacing.xy(8, 6),
        borderRadiusAll: 100,
        color: color.withValues(alpha: .2),
        child: MyText.labelMedium(text, fontWeight: 600, color: color),
      );
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Soft & Soft Pill Badges', fontWeight: 600),
          MySpacing.height(16),
          Wrap(
            runSpacing: 8,
            spacing: 8,
            children: <Widget>[
              lightenBadges(UiMixin.contentTheme.primary, 'Primary'),
              lightenBadges(UiMixin.contentTheme.secondary, 'Secondary'),
              lightenBadges(UiMixin.contentTheme.success, 'Success'),
              lightenBadges(UiMixin.contentTheme.info, 'Info'),
              lightenBadges(UiMixin.contentTheme.warning, 'Warning'),
              lightenBadges(UiMixin.contentTheme.danger, 'Danger'),
              lightenBadges(UiMixin.contentTheme.dark, 'Dark'),
            ],
          ),
          MySpacing.height(16),
          Wrap(
            runSpacing: 8,
            spacing: 8,
            children: <Widget>[
              lightenPillBadges(UiMixin.contentTheme.primary, 'Primary'),
              lightenPillBadges(UiMixin.contentTheme.secondary, 'Secondary'),
              lightenPillBadges(UiMixin.contentTheme.success, 'Success'),
              lightenPillBadges(UiMixin.contentTheme.info, 'Info'),
              lightenPillBadges(UiMixin.contentTheme.warning, 'Warning'),
              lightenPillBadges(UiMixin.contentTheme.danger, 'Danger'),
              lightenPillBadges(UiMixin.contentTheme.dark, 'Dark'),
            ],
          ),
        ],
      ),
    );
  }

  Widget buttonsAndPosition() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Buttons & Positioned', fontWeight: 600),
          MySpacing.height(16),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: <Widget>[
              MyContainer(
                color: UiMixin.contentTheme.primary,
                paddingAll: 12,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    MyText.bodyMedium('Notifications', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
                    MySpacing.width(6),
                    MyContainer(
                      paddingAll: 0,
                      height: 20,
                      width: 20,
                      color: UiMixin.contentTheme.danger,
                      child: Center(child: MyText.bodySmall('4', fontWeight: 600, color: UiMixin.contentTheme.onDanger)),
                    ),
                  ],
                ),
              ),
              MyContainer.bordered(
                borderColor: UiMixin.contentTheme.primary,
                paddingAll: 12,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    MyText.bodyMedium('Notifications', fontWeight: 600, color: UiMixin.contentTheme.primary),
                    MySpacing.width(6),
                    MyContainer(
                      paddingAll: 3,
                      color: UiMixin.contentTheme.primary,
                      child: Center(child: MyText.labelSmall('new', fontWeight: 600, color: UiMixin.contentTheme.onPrimary)),
                    ),
                  ],
                ),
              ),
              MyContainer(
                color: UiMixin.contentTheme.primary.withValues(alpha: 0.2),
                paddingAll: 12,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    MyText.bodyMedium('Notifications', fontWeight: 600, color: UiMixin.contentTheme.primary),
                    MySpacing.width(6),
                    MyContainer(
                      paddingAll: 3,
                      color: UiMixin.contentTheme.primary,
                      child: Center(child: MyText.labelSmall('11', fontWeight: 600, color: UiMixin.contentTheme.onPrimary)),
                    ),
                  ],
                ),
              ),
              MyContainer(
                paddingAll: 12,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    MyText.bodyMedium('Notifications', fontWeight: 600),
                    MySpacing.width(6),
                    MyContainer(
                      paddingAll: 3,
                      color: UiMixin.contentTheme.primary,
                      child: Center(child: MyText.labelSmall('90+', fontWeight: 600, color: UiMixin.contentTheme.onPrimary)),
                    ),
                  ],
                ),
              ),
              MyContainer(
                paddingAll: 0,
                height: 44,
                width: 90,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    MyContainer(
                      height: 40,
                      width: 80,
                      paddingAll: 0,
                      color: UiMixin.contentTheme.primary,
                      child: Center(child: MyText.bodyMedium('inbox', fontWeight: 600, color: UiMixin.contentTheme.onPrimary)),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: MyContainer(
                        padding: MySpacing.xy(4, 3),
                        borderRadiusAll: 100,
                        color: UiMixin.contentTheme.danger,
                        child: MyText.bodySmall('99+', fontSize: 10, color: UiMixin.contentTheme.onDanger),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 44,
                width: 90,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    MyContainer(
                      height: 40,
                      width: 80,
                      paddingAll: 0,
                      color: UiMixin.contentTheme.primary,
                      child: Center(child: MyText.bodyMedium('Profile', fontWeight: 600, color: UiMixin.contentTheme.onPrimary)),
                    ),
                    Positioned(top: 0, right: 0, child: MyContainer.rounded(paddingAll: 6, borderRadiusAll: 100, color: UiMixin.contentTheme.danger)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
