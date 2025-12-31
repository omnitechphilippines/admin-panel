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
import '../controllers/spinner_controller.dart';

class SpinnerView extends GetView<SpinnerController> {
  const SpinnerView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Center(
        child: Padding(
          padding: MySpacing.x(flexSpacing / 2),
          child: MyFlex(
            children: <MyFlexItem>[
              MyFlexItem(sizes: 'lg-8', child: borderSpinners()),
              MyFlexItem(sizes: 'lg-8', child: colorSpinners()),
              MyFlexItem(sizes: 'lg-8', child: alignment()),
              MyFlexItem(sizes: 'lg-8', child: placement()),
              MyFlexItem(sizes: 'lg-8', child: buttonsSpinner()),
            ],
          ),
        ),
      ),
    );
  }

  Widget borderSpinners() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[MyText.titleMedium('Border Spinners', fontWeight: 600), MySpacing.height(16), const CircularProgressIndicator()]),
    );
  }

  Widget colorSpinners() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Color Spinners', fontWeight: 600),
          MySpacing.height(16),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: <Widget>[
              const CircularProgressIndicator(),
              CircularProgressIndicator(color: UiMixin.contentTheme.secondary),
              CircularProgressIndicator(color: UiMixin.contentTheme.success),
              CircularProgressIndicator(color: UiMixin.contentTheme.danger),
              CircularProgressIndicator(color: UiMixin.contentTheme.pink),
              CircularProgressIndicator(color: UiMixin.contentTheme.light),
              CircularProgressIndicator(color: UiMixin.contentTheme.dark),
            ],
          ),
        ],
      ),
    );
  }

  Widget alignment() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Alignment', fontWeight: 600),
          MySpacing.height(16),
          const MyContainer.bordered(paddingAll: 12, child: Center(child: CircularProgressIndicator())),
        ],
      ),
    );
  }

  Widget placement() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Placement', fontWeight: 600),
          MySpacing.height(16),
          MyContainer.bordered(
            paddingAll: 12,
            child: Row(
              children: <Widget>[
                Expanded(child: MyText.bodyMedium('Loading...', fontWeight: 600)),
                const CircularProgressIndicator(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonsSpinner() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Buttons Spinner', fontWeight: 600),
          MySpacing.height(16),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: <Widget>[
              MyContainer(
                paddingAll: 12,
                color: UiMixin.contentTheme.primary,
                child: SizedBox(height: 24, width: 24, child: CircularProgressIndicator(color: UiMixin.contentTheme.onPrimary)),
              ),
              MyContainer(
                paddingAll: 12,
                color: UiMixin.contentTheme.primary,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(height: 24, width: 24, child: CircularProgressIndicator(color: UiMixin.contentTheme.onPrimary)),
                    const SizedBox(width: 12),
                    MyText.labelMedium('Loading...', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
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
