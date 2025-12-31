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
import '../controllers/tooltip_controller.dart';

class TooltipView extends GetView<TooltipController> {
  const TooltipView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Center(
        child: Padding(
          padding: MySpacing.x(flexSpacing / 2),
          child: MyFlex(
            children: <MyFlexItem>[
              MyFlexItem(sizes: 'lg-8', child: tooltipDirection()),
              MyFlexItem(sizes: 'lg-8', child: colorTooltip()),
            ],
          ),
        ),
      ),
    );
  }

  Widget tooltipDirection() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Tooltip Direction', fontWeight: 600),
          MySpacing.height(16),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: <Widget>[
              Tooltip(
                verticalOffset: -48,
                message: 'Tool tip on top',
                child: MyContainer(
                  padding: MySpacing.all(12),
                  color: UiMixin.contentTheme.primary,
                  child: MyText.bodySmall('Tooltip on top', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
                ),
              ),
              Tooltip(
                message: 'Tool tip on bottom',
                child: MyContainer(
                  padding: MySpacing.all(12),
                  color: UiMixin.contentTheme.primary,
                  child: MyText.bodySmall('Tooltip on bottom', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
                ),
              ),
              Tooltip(
                message: 'Tool tip on left',
                preferBelow: true,
                margin: MySpacing.left(240),
                verticalOffset: -12,
                child: MyContainer(
                  padding: MySpacing.all(12),
                  color: UiMixin.contentTheme.primary,
                  child: MyText.bodySmall('Tooltip on left', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
                ),
              ),
              Tooltip(
                message: 'Tool tip on right',
                preferBelow: true,
                margin: MySpacing.right(240),
                verticalOffset: -12,
                child: MyContainer(
                  padding: MySpacing.all(12),
                  color: UiMixin.contentTheme.primary,
                  child: MyText.bodySmall('Tooltip on right', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget colorTooltip() {
    Widget colorToolTipWidget(String name, Color color) {
      return Tooltip(
        message: '$name Tooltip',
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
        child: MyContainer(
          padding: MySpacing.xy(12, 8),
          color: color,
          onTap: () {},
          child: MyText.bodySmall('$name Tooltip', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
        ),
      );
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Color Tooltip', fontWeight: 600),
          MySpacing.height(16),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: <Widget>[
              colorToolTipWidget('Primary', UiMixin.contentTheme.primary),
              colorToolTipWidget('Danger', UiMixin.contentTheme.danger),
              colorToolTipWidget('Info', UiMixin.contentTheme.info),
              colorToolTipWidget('Success', UiMixin.contentTheme.success),
              colorToolTipWidget('Pink', UiMixin.contentTheme.pink),
              colorToolTipWidget('Purple', UiMixin.contentTheme.purple),
            ],
          ),
        ],
      ),
    );
  }
}
