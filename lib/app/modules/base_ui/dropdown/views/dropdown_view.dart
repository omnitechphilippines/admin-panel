import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../helper/extensions/string.dart';
import '../../../../../helper/utils/my_shadow.dart';
import '../../../../../helper/widgets/my_card.dart';
import '../../../../../helper/widgets/my_flex.dart';
import '../../../../../helper/widgets/my_flex_item.dart';
import '../../../../../helper/widgets/my_spacing.dart';
import '../../../../../helper/widgets/my_text.dart';
import '../../../../../helper/widgets/my_text_style.dart';
import '../../../../../helper/widgets/responsive.dart';
import '../../../../../themes/ui_mixin.dart';
import '../../../../../views/layout/layout.dart';
import '../controllers/dropdown_controller.dart';

class DropdownView extends GetView<DropdownController> {
  final OutlineInputBorder outlineBorder = OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none);
  DropdownView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Layout(
        child: Padding(
          padding: MySpacing.x(flexSpacing / 2),
          child: Center(
            child: MyFlex(
              children: <MyFlexItem>[
                MyFlexItem(sizes: 'lg-8', child: singleButtonDropdowns()),
                MyFlexItem(sizes: 'lg-8', child: variant()),
                MyFlexItem(sizes: 'lg-8', child: sizing()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget singleButtonDropdowns() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      paddingAll: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Single button dropdowns', fontWeight: 600),
          MySpacing.height(16),
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MyText.titleSmall('Dropdown Button', fontWeight: 600),
                    MySpacing.height(20),
                    DropdownButtonFormField<SingleButtonDropdowns>(
                      initialValue: controller.singleButtonDropdowns1.value,
                      onChanged: (SingleButtonDropdowns? value) {},
                      dropdownColor: UiMixin.contentTheme.background,
                      items: SingleButtonDropdowns.values.map((SingleButtonDropdowns singleButton) {
                        return DropdownMenuItem<SingleButtonDropdowns>(onTap: () => controller.onSelectSingleButtonDropdowns1(singleButton), value: singleButton, child: MyText.bodyMedium(singleButton.name.capitalizeWords, fontWeight: 600));
                      }).toList(),
                      decoration: InputDecoration(
                        labelText: 'Select button',
                        labelStyle: MyTextStyle.bodyMedium(),
                        disabledBorder: outlineBorder,
                        enabledBorder: outlineBorder,
                        errorBorder: outlineBorder,
                        focusedBorder: outlineBorder,
                        focusedErrorBorder: outlineBorder,
                        border: outlineBorder,
                        contentPadding: MySpacing.all(16),
                        isCollapsed: true,
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MyText.titleSmall('Dropdown Link', fontWeight: 600),
                    MySpacing.height(20),
                    DropdownButtonFormField<SingleButtonDropdowns>(
                      initialValue: controller.singleButtonDropdowns2.value,
                      onChanged: (SingleButtonDropdowns? value) {},
                      dropdownColor: UiMixin.contentTheme.background,
                      items: SingleButtonDropdowns.values.map((SingleButtonDropdowns singleButton) {
                        return DropdownMenuItem<SingleButtonDropdowns>(onTap: () => controller.onSelectSingleButtonDropdowns2(singleButton), value: singleButton, child: MyText.bodyMedium(singleButton.name.capitalizeWords, fontWeight: 600));
                      }).toList(),
                      decoration: InputDecoration(
                        labelText: 'Select button link',
                        labelStyle: MyTextStyle.bodyMedium(),
                        disabledBorder: outlineBorder,
                        enabledBorder: outlineBorder,
                        errorBorder: outlineBorder,
                        focusedBorder: outlineBorder,
                        focusedErrorBorder: outlineBorder,
                        border: outlineBorder,
                        contentPadding: MySpacing.all(16),
                        filled: true,
                        isCollapsed: true,
                        isDense: true,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget variant() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      paddingAll: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Variant', fontWeight: 600),
          MySpacing.height(16),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: <Widget>[
              SizedBox(
                width: 170,
                child: DropdownButtonFormField<SingleButtonDropdowns>(
                  initialValue: controller.primaryButton.value,
                  onChanged: (SingleButtonDropdowns? value) => controller.onSelectSinglePrimaryButton(value!),
                  focusColor: UiMixin.contentTheme.onPrimary,
                  dropdownColor: UiMixin.contentTheme.primary,
                  style: MyTextStyle.bodyMedium(color: UiMixin.contentTheme.onPrimary),
                  iconEnabledColor: UiMixin.contentTheme.onPrimary,
                  isDense: true,
                  items: SingleButtonDropdowns.values
                      .map(
                        (SingleButtonDropdowns singleButton) => DropdownMenuItem<SingleButtonDropdowns>(
                          onTap: () => controller.primaryButton.value = singleButton,
                          value: singleButton,
                          child: MyText.bodyMedium(singleButton.name.capitalizeWords, color: UiMixin.contentTheme.onPrimary, fontWeight: 600),
                        ),
                      )
                      .toList(),
                  decoration: InputDecoration(
                    labelText: 'Primary',
                    labelStyle: MyTextStyle.bodyMedium(color: UiMixin.contentTheme.onPrimary),
                    disabledBorder: outlineBorder,
                    enabledBorder: outlineBorder,
                    errorBorder: outlineBorder,
                    focusedBorder: outlineBorder,
                    focusedErrorBorder: outlineBorder,
                    border: outlineBorder,
                    fillColor: UiMixin.contentTheme.primary,
                    contentPadding: MySpacing.all(16),
                    isCollapsed: true,
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
              ),
              SizedBox(
                width: 170,
                child: DropdownButtonFormField<SingleButtonDropdowns>(
                  initialValue: controller.secondaryButton.value,
                  onChanged: (SingleButtonDropdowns? value) => controller.onSelectSingleSecondaryButton(value!),
                  focusColor: UiMixin.contentTheme.onPrimary,
                  dropdownColor: UiMixin.contentTheme.secondary,
                  iconEnabledColor: UiMixin.contentTheme.onPrimary,
                  style: MyTextStyle.bodyMedium(color: UiMixin.contentTheme.onPrimary),
                  isDense: true,
                  items: SingleButtonDropdowns.values
                      .map(
                        (SingleButtonDropdowns singleButton) => DropdownMenuItem<SingleButtonDropdowns>(
                          onTap: () => controller.onSelectSingleSecondaryButton(singleButton),
                          value: singleButton,
                          child: MyText.bodyMedium(singleButton.name.capitalizeWords, color: UiMixin.contentTheme.onSecondary, fontWeight: 600),
                        ),
                      )
                      .toList(),
                  decoration: InputDecoration(
                    labelText: 'Secondary',
                    labelStyle: MyTextStyle.bodyMedium(color: UiMixin.contentTheme.onPrimary),
                    disabledBorder: outlineBorder,
                    enabledBorder: outlineBorder,
                    errorBorder: outlineBorder,
                    focusedBorder: outlineBorder,
                    focusedErrorBorder: outlineBorder,
                    border: outlineBorder,
                    fillColor: UiMixin.contentTheme.secondary,
                    contentPadding: MySpacing.all(16),
                    isCollapsed: true,
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
              ),
              SizedBox(
                width: 170,
                child: DropdownButtonFormField<SingleButtonDropdowns>(
                  initialValue: controller.successButton.value,
                  onChanged: (SingleButtonDropdowns? value) => controller.onSelectSingleSuccessButton(value!),
                  focusColor: UiMixin.contentTheme.onPrimary,
                  dropdownColor: UiMixin.contentTheme.success,
                  iconEnabledColor: UiMixin.contentTheme.onPrimary,
                  style: MyTextStyle.bodyMedium(color: UiMixin.contentTheme.onPrimary),
                  isDense: true,
                  items: SingleButtonDropdowns.values
                      .map(
                        (SingleButtonDropdowns singleButton) => DropdownMenuItem<SingleButtonDropdowns>(
                          onTap: () => controller.onSelectSingleSuccessButton(singleButton),
                          value: singleButton,
                          child: MyText.bodyMedium(singleButton.name.capitalizeWords, color: UiMixin.contentTheme.onSuccess, fontWeight: 600),
                        ),
                      )
                      .toList(),
                  decoration: InputDecoration(
                    labelText: 'Success',
                    labelStyle: MyTextStyle.bodyMedium(color: UiMixin.contentTheme.onPrimary),
                    disabledBorder: outlineBorder,
                    enabledBorder: outlineBorder,
                    errorBorder: outlineBorder,
                    focusedBorder: outlineBorder,
                    focusedErrorBorder: outlineBorder,
                    border: outlineBorder,
                    fillColor: UiMixin.contentTheme.success,
                    contentPadding: MySpacing.all(16),
                    isCollapsed: true,
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
              ),
              SizedBox(
                width: 170,
                child: DropdownButtonFormField<SingleButtonDropdowns>(
                  initialValue: controller.warningButton.value,
                  onChanged: (SingleButtonDropdowns? value) => controller.onSelectSingleWarningButton(value!),
                  focusColor: UiMixin.contentTheme.onPrimary,
                  dropdownColor: UiMixin.contentTheme.warning,
                  iconEnabledColor: UiMixin.contentTheme.onPrimary,
                  style: MyTextStyle.bodyMedium(color: UiMixin.contentTheme.onPrimary),
                  isDense: true,
                  items: SingleButtonDropdowns.values
                      .map(
                        (SingleButtonDropdowns singleButton) => DropdownMenuItem<SingleButtonDropdowns>(
                          onTap: () => controller.onSelectSingleWarningButton(singleButton),
                          value: singleButton,
                          child: MyText.bodyMedium(singleButton.name.capitalizeWords, color: UiMixin.contentTheme.onPrimary, fontWeight: 600),
                        ),
                      )
                      .toList(),
                  decoration: InputDecoration(
                    labelText: 'Warning',
                    labelStyle: MyTextStyle.bodyMedium(color: UiMixin.contentTheme.onPrimary),
                    disabledBorder: outlineBorder,
                    enabledBorder: outlineBorder,
                    errorBorder: outlineBorder,
                    focusedBorder: outlineBorder,
                    focusedErrorBorder: outlineBorder,
                    border: outlineBorder,
                    fillColor: UiMixin.contentTheme.warning,
                    contentPadding: MySpacing.all(16),
                    isCollapsed: true,
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
              ),
              SizedBox(
                width: 170,
                child: DropdownButtonFormField<SingleButtonDropdowns>(
                  initialValue: controller.dangerButton.value,
                  iconDisabledColor: UiMixin.contentTheme.onPrimary,
                  onChanged: (SingleButtonDropdowns? value) => controller.onSelectSingleDangerButton(value!),
                  focusColor: UiMixin.contentTheme.onPrimary,
                  dropdownColor: UiMixin.contentTheme.danger,
                  iconEnabledColor: UiMixin.contentTheme.onPrimary,
                  style: MyTextStyle.bodyMedium(color: UiMixin.contentTheme.onPrimary),
                  isDense: true,
                  items: SingleButtonDropdowns.values
                      .map(
                        (SingleButtonDropdowns singleButton) => DropdownMenuItem<SingleButtonDropdowns>(
                          onTap: () => controller.onSelectSingleDangerButton(singleButton),
                          value: singleButton,
                          child: MyText.bodyMedium(singleButton.name.capitalizeWords, fontWeight: 600, color: UiMixin.contentTheme.onDanger),
                        ),
                      )
                      .toList(),
                  decoration: InputDecoration(
                    labelText: 'Danger',
                    labelStyle: MyTextStyle.bodyMedium(color: UiMixin.contentTheme.onPrimary),
                    disabledBorder: outlineBorder,
                    enabledBorder: outlineBorder,
                    errorBorder: outlineBorder,
                    focusedBorder: outlineBorder,
                    focusedErrorBorder: outlineBorder,
                    border: outlineBorder,
                    fillColor: UiMixin.contentTheme.danger,
                    contentPadding: MySpacing.all(16),
                    isCollapsed: true,
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget sizing() {
    return MyCard(
      shadow: MyShadow(elevation: .7, position: MyShadowPosition.bottom),
      paddingAll: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MyText.titleMedium('Sizing', fontWeight: 600),
          MySpacing.height(20),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: <Widget>[
              DropdownButtonFormField<SingleButtonDropdowns>(
                initialValue: controller.largeButton1.value,
                onChanged: (SingleButtonDropdowns? value) {},
                focusColor: UiMixin.contentTheme.onPrimary,
                dropdownColor: UiMixin.contentTheme.background,
                itemHeight: 70,
                style: MyTextStyle.bodyLarge(),
                items: SingleButtonDropdowns.values
                    .map(
                      (SingleButtonDropdowns singleButton) =>
                          DropdownMenuItem<SingleButtonDropdowns>(onTap: () => controller.onSelectLargeButton1(singleButton), value: singleButton, child: MyText.bodyLarge(singleButton.name.capitalizeWords, fontWeight: 600)),
                    )
                    .toList(),
                decoration: InputDecoration(
                  labelText: 'Large Button',
                  labelStyle: MyTextStyle.bodyLarge(),
                  disabledBorder: outlineBorder,
                  enabledBorder: outlineBorder,
                  errorBorder: outlineBorder,
                  focusedBorder: outlineBorder,
                  focusedErrorBorder: outlineBorder,
                  border: outlineBorder,
                  contentPadding: MySpacing.all(16),
                  isCollapsed: true,
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
              DropdownButtonFormField<SingleButtonDropdowns>(
                initialValue: controller.largeButton2.value,
                onChanged: (SingleButtonDropdowns? value) {},
                focusColor: UiMixin.contentTheme.onPrimary,
                dropdownColor: UiMixin.contentTheme.background,
                itemHeight: 60,
                style: MyTextStyle.bodyMedium(),
                items: SingleButtonDropdowns.values
                    .map(
                      (SingleButtonDropdowns singleButton) =>
                          DropdownMenuItem<SingleButtonDropdowns>(onTap: () => controller.onSelectLargeButton2(singleButton), value: singleButton, child: MyText.bodyMedium(singleButton.name.capitalizeWords, fontWeight: 600)),
                    )
                    .toList(),
                decoration: InputDecoration(
                  labelText: 'Large Button',
                  labelStyle: MyTextStyle.bodyMedium(),
                  disabledBorder: outlineBorder,
                  enabledBorder: outlineBorder,
                  errorBorder: outlineBorder,
                  focusedBorder: outlineBorder,
                  focusedErrorBorder: outlineBorder,
                  border: outlineBorder,
                  contentPadding: MySpacing.all(16),
                  isCollapsed: true,
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
              DropdownButtonFormField<SingleButtonDropdowns>(
                initialValue: controller.smallButton1.value,
                onChanged: (SingleButtonDropdowns? value) {},
                focusColor: UiMixin.contentTheme.onPrimary,
                dropdownColor: UiMixin.contentTheme.background,
                style: MyTextStyle.bodySmall(),
                itemHeight: 48,
                menuMaxHeight: 160,
                items: SingleButtonDropdowns.values
                    .map(
                      (SingleButtonDropdowns singleButton) =>
                          DropdownMenuItem<SingleButtonDropdowns>(onTap: () => controller.onSelectSmallButton1(singleButton), value: singleButton, child: MyText.bodySmall(singleButton.name.capitalizeWords, fontWeight: 600)),
                    )
                    .toList(),
                decoration: InputDecoration(
                  labelText: 'Small Button',
                  labelStyle: MyTextStyle.bodySmall(),
                  disabledBorder: outlineBorder,
                  enabledBorder: outlineBorder,
                  errorBorder: outlineBorder,
                  focusedBorder: outlineBorder,
                  focusedErrorBorder: outlineBorder,
                  border: outlineBorder,
                  contentPadding: MySpacing.all(16),
                  isCollapsed: true,
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
              DropdownButtonFormField<SingleButtonDropdowns>(
                initialValue: controller.smallButton2.value,
                onChanged: (SingleButtonDropdowns? value) {},
                focusColor: UiMixin.contentTheme.onPrimary,
                dropdownColor: UiMixin.contentTheme.background,
                style: MyTextStyle.labelSmall(),
                items: SingleButtonDropdowns.values
                    .map(
                      (SingleButtonDropdowns singleButton) =>
                          DropdownMenuItem<SingleButtonDropdowns>(onTap: () => controller.onSelectSmallButton2(singleButton), value: singleButton, child: MyText.labelSmall(singleButton.name.capitalizeWords, fontWeight: 600)),
                    )
                    .toList(),
                decoration: InputDecoration(
                  labelText: 'Small Button',
                  labelStyle: MyTextStyle.labelSmall(),
                  disabledBorder: outlineBorder,
                  enabledBorder: outlineBorder,
                  errorBorder: outlineBorder,
                  focusedBorder: outlineBorder,
                  focusedErrorBorder: outlineBorder,
                  border: outlineBorder,
                  contentPadding: MySpacing.all(16),
                  isCollapsed: true,
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
