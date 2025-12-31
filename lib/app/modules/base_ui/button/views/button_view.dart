import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

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
import '../../../../../themes/ui_mixin.dart';
import '../../../../../views/layout/layout.dart';
import '../controllers/button_controller.dart';

class ButtonView extends GetView<ButtonController> {
  const ButtonView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: MySpacing.x(flexSpacing / 2),
        child: Center(
          child: MyFlex(
            children: <MyFlexItem>[
              MyFlexItem(sizes: 'lg-8', child: defaultButtons()),
              MyFlexItem(sizes: 'lg-8', child: roundedButtons()),
              MyFlexItem(sizes: 'lg-8', child: outlineButtons()),
              MyFlexItem(sizes: 'lg-8', child: outlineRoundedButtons()),
              MyFlexItem(sizes: 'lg-8', child: softButtons()),
              MyFlexItem(sizes: 'lg-8', child: buttonWidth()),
              MyFlexItem(sizes: 'lg-8', child: buttonSize()),
              MyFlexItem(sizes: 'lg-8', child: disabledButton()),
              MyFlexItem(sizes: 'lg-8', child: iconButton()),
              MyFlexItem(sizes: 'lg-8', child: buttonGroup()),
              MyFlexItem(sizes: 'lg-8', child: blockButton()),
            ],
          ),
        ),
      ),
    );
  }

  Widget defaultButtons() {
    Widget buildDefaultButtons(String btnName, Color color) {
      return MyButton(
        onPressed: () {},
        elevation: 0,
        padding: MySpacing.xy(20, 16),
        backgroundColor: color,
        borderRadiusAll: 4,
        child: MyText.bodySmall(btnName, color: UiMixin.contentTheme.onPrimary, fontWeight: 600),
      );
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Default Buttons', fontWeight: 600),
          MySpacing.height(16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: <Widget>[
              buildDefaultButtons('Primary', UiMixin.contentTheme.primary),
              buildDefaultButtons('Secondary', UiMixin.contentTheme.secondary),
              buildDefaultButtons('Success', UiMixin.contentTheme.success),
              buildDefaultButtons('Warning', UiMixin.contentTheme.warning),
              buildDefaultButtons('Info', UiMixin.contentTheme.info),
              buildDefaultButtons('Danger', UiMixin.contentTheme.danger),
            ],
          ),
        ],
      ),
    );
  }

  Widget roundedButtons() {
    Widget roundedBtn(String btnName, Color color) {
      return MyButton(
        onPressed: () {},
        elevation: 0,
        padding: MySpacing.xy(20, 16),
        backgroundColor: color,
        borderRadiusAll: 20,
        child: MyText.bodySmall(btnName, color: UiMixin.contentTheme.onPrimary, fontWeight: 600),
      );
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Rounded Buttons', fontWeight: 600),
          MySpacing.height(16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: <Widget>[
              roundedBtn('Primary', UiMixin.contentTheme.primary),
              roundedBtn('Secondary', UiMixin.contentTheme.secondary),
              roundedBtn('Success', UiMixin.contentTheme.success),
              roundedBtn('Warning', UiMixin.contentTheme.warning),
              roundedBtn('Info', UiMixin.contentTheme.info),
              roundedBtn('Danger', UiMixin.contentTheme.danger),
            ],
          ),
        ],
      ),
    );
  }

  Widget outlineButtons() {
    Widget outLinedBtn(String btnName, Color color) {
      return MyButton.outlined(
        onPressed: () {},
        elevation: 0,
        padding: MySpacing.xy(20, 16),
        borderColor: color,
        splashColor: color.withValues(alpha: 0.1),
        borderRadiusAll: 4,
        child: MyText.bodySmall(btnName, color: color, fontWeight: 600),
      );
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Outline Buttons', fontWeight: 600),
          MySpacing.height(16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: <Widget>[
              outLinedBtn('Primary', UiMixin.contentTheme.primary),
              outLinedBtn('Secondary', UiMixin.contentTheme.secondary),
              outLinedBtn('Success', UiMixin.contentTheme.success),
              outLinedBtn('Warning', UiMixin.contentTheme.warning),
              outLinedBtn('Info', UiMixin.contentTheme.info),
              outLinedBtn('Danger', UiMixin.contentTheme.danger),
            ],
          ),
        ],
      ),
    );
  }

  Widget outlineRoundedButtons() {
    Widget outlinedRoundedBtn(String btnName, Color color) {
      return MyButton.outlined(
        onPressed: () {},
        elevation: 0,
        padding: MySpacing.xy(20, 16),
        borderColor: color,
        splashColor: color.withValues(alpha: 0.1),
        borderRadiusAll: 20,
        child: MyText.bodySmall(btnName, color: color, fontWeight: 600),
      );
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Outline Rounded Buttons', fontWeight: 600),
          MySpacing.height(16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: <Widget>[
              outlinedRoundedBtn('Primary', UiMixin.contentTheme.primary),
              outlinedRoundedBtn('Secondary', UiMixin.contentTheme.secondary),
              outlinedRoundedBtn('Success', UiMixin.contentTheme.success),
              outlinedRoundedBtn('Warning', UiMixin.contentTheme.warning),
              outlinedRoundedBtn('Info', UiMixin.contentTheme.info),
              outlinedRoundedBtn('Danger', UiMixin.contentTheme.danger),
            ],
          ),
        ],
      ),
    );
  }

  Widget softButtons() {
    Widget softBtn(String btnName, Color color) {
      return MyButton(
        onPressed: () {},
        elevation: 0,
        padding: MySpacing.xy(20, 16),
        borderColor: color,
        backgroundColor: color.withValues(alpha: 0.12),
        splashColor: color.withValues(alpha: 0.2),
        borderRadiusAll: 4,
        child: MyText.bodySmall(btnName, color: color, fontWeight: 600),
      );
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Soft Buttons', fontWeight: 600),
          MySpacing.height(16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: <Widget>[
              softBtn('Primary', UiMixin.contentTheme.primary),
              softBtn('Secondary', UiMixin.contentTheme.secondary),
              softBtn('Success', UiMixin.contentTheme.success),
              softBtn('Warning', UiMixin.contentTheme.warning),
              softBtn('Info', UiMixin.contentTheme.info),
              softBtn('Danger', UiMixin.contentTheme.danger),
            ],
          ),
        ],
      ),
    );
  }

  Widget buttonWidth() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Button Width', fontWeight: 600),
          MySpacing.height(16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            crossAxisAlignment: WrapCrossAlignment.center,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            runAlignment: WrapAlignment.start,
            alignment: WrapAlignment.start,
            children: <Widget>[
              MyContainer(
                color: UiMixin.contentTheme.primary,
                width: 200,
                height: 40,
                paddingAll: 0,
                onTap: () {},
                child: Center(child: MyText.bodyMedium('Extra large', fontWeight: 600, color: UiMixin.contentTheme.onPrimary)),
              ),
              MyContainer(
                color: UiMixin.contentTheme.secondary,
                width: 160,
                height: 40,
                paddingAll: 0,
                onTap: () {},
                child: Center(child: MyText.bodyMedium('Large', fontWeight: 600, color: UiMixin.contentTheme.onPrimary)),
              ),
              MyContainer(
                color: UiMixin.contentTheme.success,
                width: 130,
                height: 40,
                paddingAll: 0,
                onTap: () {},
                child: Center(child: MyText.bodyMedium('Medium', fontWeight: 600, color: UiMixin.contentTheme.onPrimary)),
              ),
              MyContainer(
                color: UiMixin.contentTheme.info,
                width: 100,
                height: 40,
                paddingAll: 0,
                onTap: () {},
                child: Center(child: MyText.bodyMedium('Small', fontWeight: 600, color: UiMixin.contentTheme.onPrimary)),
              ),
              MyContainer(
                color: UiMixin.contentTheme.warning,
                width: 70,
                height: 40,
                paddingAll: 0,
                onTap: () {},
                child: Center(child: MyText.bodyMedium('XS', fontWeight: 600, color: UiMixin.contentTheme.onPrimary)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buttonSize() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Button Size', fontWeight: 600),
          MySpacing.height(16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            crossAxisAlignment: WrapCrossAlignment.center,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            runAlignment: WrapAlignment.start,
            alignment: WrapAlignment.start,
            children: <Widget>[
              MyButton(
                onPressed: () {},
                elevation: 0,
                padding: MySpacing.xy(40, 24),
                backgroundColor: UiMixin.contentTheme.primary,
                borderRadiusAll: 8,
                child: MyText.bodySmall('Large', color: UiMixin.contentTheme.onPrimary, fontWeight: 600),
              ),
              MyButton(
                onPressed: () {},
                elevation: 0,
                padding: MySpacing.xy(20, 16),
                backgroundColor: UiMixin.contentTheme.primary,
                borderRadiusAll: 8,
                child: MyText.bodySmall('Normal', color: UiMixin.contentTheme.onPrimary, fontWeight: 600),
              ),
              MyButton(
                onPressed: () {},
                elevation: 0,
                backgroundColor: UiMixin.contentTheme.primary,
                borderRadiusAll: 8,
                child: MyText.labelSmall('Small', color: UiMixin.contentTheme.onPrimary, fontWeight: 600),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget disabledButton() {
    Widget disableButtonWidget(String btnName, Color color) {
      return MyContainer(
        color: color.withValues(alpha: 0.5),
        paddingAll: 8,
        child: MyText.labelMedium(btnName, color: UiMixin.contentTheme.onPrimary, fontWeight: 600),
      );
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Disabled Button', fontWeight: 600),
          MySpacing.height(16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: <Widget>[
              disableButtonWidget('Primary', UiMixin.contentTheme.primary),
              disableButtonWidget('Secondary', UiMixin.contentTheme.secondary),
              disableButtonWidget('Success', UiMixin.contentTheme.success),
              disableButtonWidget('Warning', UiMixin.contentTheme.warning),
              disableButtonWidget('Info', UiMixin.contentTheme.info),
              disableButtonWidget('Danger', UiMixin.contentTheme.danger),
            ],
          ),
        ],
      ),
    );
  }

  Widget iconButton() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Icon Button', fontWeight: 600),
          MySpacing.height(16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: <Widget>[
              MyContainer(
                paddingAll: 12,
                color: UiMixin.contentTheme.primary,
                onTap: () {},
                child: Icon(LucideIcons.heart, size: 16, color: UiMixin.contentTheme.onPrimary),
              ),
              MyContainer(
                paddingAll: 12,
                color: UiMixin.contentTheme.secondary,
                onTap: () {},
                child: Icon(LucideIcons.user_round_cog, size: 16, color: UiMixin.contentTheme.onPrimary),
              ),
              MyContainer(
                paddingAll: 12,
                color: UiMixin.contentTheme.success,
                onTap: () {},
                child: Icon(LucideIcons.check_check, size: 16, color: UiMixin.contentTheme.onPrimary),
              ),
              MyContainer(
                paddingAll: 12,
                color: UiMixin.contentTheme.info,
                onTap: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(LucideIcons.cloud, size: 16, color: UiMixin.contentTheme.onPrimary),
                    MySpacing.width(8),
                    MyText.bodyMedium('Cloud Hosting', color: UiMixin.contentTheme.onPrimary),
                  ],
                ),
              ),
              MyContainer(
                paddingAll: 12,
                color: UiMixin.contentTheme.warning,
                onTap: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(LucideIcons.info, size: 16, color: UiMixin.contentTheme.onPrimary),
                    MySpacing.width(8),
                    MyText.bodyMedium('Cloud Hosting', color: UiMixin.contentTheme.onPrimary),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buttonGroup() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Button Group', fontWeight: 600),
          MySpacing.height(16),
          Padding(
            padding: MySpacing.only(left: 23, bottom: 20),
            child: ToggleButtons(
              splashColor: UiMixin.contentTheme.primary.withAlpha(48),
              color: UiMixin.contentTheme.onBackground,
              fillColor: UiMixin.contentTheme.primary.withAlpha(32),
              selectedBorderColor: UiMixin.contentTheme.primary.withAlpha(48),
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              isSelected: controller.selected,
              onPressed: controller.onSelect,
              children: <Widget>[
                Icon(Icons.wb_sunny_outlined, color: UiMixin.contentTheme.primary, size: 24),
                Icon(Icons.dark_mode_outlined, color: UiMixin.contentTheme.primary, size: 24),
                Icon(Icons.brightness_6_outlined, color: UiMixin.contentTheme.primary, size: 24),
              ],
            ),
          ),
          Padding(
            padding: MySpacing.only(left: 23, bottom: 20),
            child: ToggleButtons(
              splashColor: UiMixin.contentTheme.primary.withAlpha(48),
              color: UiMixin.contentTheme.onBackground,
              fillColor: UiMixin.contentTheme.primary.withAlpha(32),
              selectedBorderColor: UiMixin.contentTheme.primary.withAlpha(48),
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              isSelected: controller.selected,
              onPressed: controller.onSelect,
              children: <Widget>[
                Padding(
                  padding: MySpacing.x(16),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.wb_sunny_outlined, color: UiMixin.contentTheme.primary, size: 24),
                      MySpacing.width(12),
                      MyText.labelLarge('light', color: UiMixin.contentTheme.primary, fontWeight: 600),
                    ],
                  ),
                ),
                Padding(
                  padding: MySpacing.x(16),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.dark_mode_outlined, color: UiMixin.contentTheme.primary, size: 24),
                      MySpacing.width(12),
                      MyText.labelLarge('dark', color: UiMixin.contentTheme.primary, fontWeight: 600),
                    ],
                  ),
                ),
                Padding(
                  padding: MySpacing.x(16),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.brightness_6_outlined, color: UiMixin.contentTheme.primary, size: 24),
                      MySpacing.width(12),
                      MyText.labelLarge('system', color: UiMixin.contentTheme.primary, fontWeight: 600),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget blockButton() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Block Button', fontWeight: 600),
          MySpacing.height(16),
          MyContainer(
            onTap: () {},
            color: UiMixin.contentTheme.primary,
            paddingAll: 16,
            child: Center(child: MyText.bodyMedium('Block Button', fontWeight: 600, color: UiMixin.contentTheme.onPrimary)),
          ),
          MySpacing.height(16),
          MyContainer(
            onTap: () {},
            color: UiMixin.contentTheme.secondary,
            paddingAll: 12,
            child: Center(child: MyText.bodyMedium('Block Button', fontWeight: 600, color: UiMixin.contentTheme.onPrimary)),
          ),
          MySpacing.height(16),
          MyContainer(
            onTap: () {},
            color: UiMixin.contentTheme.light,
            paddingAll: 8,
            child: Center(child: MyText.bodyMedium('Block Button', fontWeight: 600)),
          ),
        ],
      ),
    );
  }
}
