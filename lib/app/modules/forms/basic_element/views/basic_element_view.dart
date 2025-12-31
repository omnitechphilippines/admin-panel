import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

import 'package:get/get.dart';

import '../../../../../helper/utils/my_shadow.dart';
import '../../../../../helper/widgets/my_card.dart';
import '../../../../../helper/widgets/my_container.dart';
import '../../../../../helper/widgets/my_flex.dart';
import '../../../../../helper/widgets/my_flex_item.dart';
import '../../../../../helper/widgets/my_spacing.dart';
import '../../../../../helper/widgets/my_text.dart';
import '../../../../../helper/widgets/my_text_style.dart';
import '../../../../../helper/widgets/responsive.dart';
import '../../../../../themes/ui_mixin.dart';
import '../../../../../views/layout/layout.dart';
import '../controllers/basic_element_controller.dart';

class BasicElementView extends GetView<BasicElementController> {
  const BasicElementView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Center(
        child: Padding(
          padding: MySpacing.x(flexSpacing / 2),
          child: MyFlex(
            children: <MyFlexItem>[
              MyFlexItem(sizes: 'lg-8', child: basicExample()),
              MyFlexItem(sizes: 'lg-8', child: inputSizing()),
              MyFlexItem(sizes: 'lg-8', child: disabledInput()),
              MyFlexItem(sizes: 'lg-8', child: readOnly()),
              MyFlexItem(sizes: 'lg-8', child: select()),
            ],
          ),
        ),
      ),
    );
  }

  Widget basicExample() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Basic Example', fontWeight: 600),
          MySpacing.height(16),
          MyText.labelMedium('Text', muted: true, fontWeight: 600),
          MySpacing.height(8),
          TextField(
            decoration: InputDecoration(border: const OutlineInputBorder(), isDense: true, isCollapsed: true, contentPadding: MySpacing.all(12)),
          ),
          MySpacing.height(20),
          MyText.labelMedium('Email', muted: true, fontWeight: 600),
          MySpacing.height(8),
          TextField(
            style: MyTextStyle.bodySmall(),
            decoration: InputDecoration(border: const OutlineInputBorder(), isDense: true, isCollapsed: true, hintText: 'Email', hintStyle: MyTextStyle.bodySmall(), contentPadding: MySpacing.all(12)),
          ),
          MySpacing.height(20),
          MyText.labelMedium('Password', muted: true, fontWeight: 600),
          MySpacing.height(8),
          TextField(
            style: MyTextStyle.bodySmall(),
            controller: TextEditingController(text: 'Password'),
            obscureText: true,
            decoration: InputDecoration(border: const OutlineInputBorder(), isDense: true, isCollapsed: true, hintText: 'Password', hintStyle: MyTextStyle.bodySmall(), contentPadding: MySpacing.all(12)),
          ),
          MySpacing.height(20),
          MyText.labelMedium('Show/Hide Password', muted: true, fontWeight: 600),
          MySpacing.height(8),
          TextField(
            style: MyTextStyle.bodySmall(),
            controller: TextEditingController(text: 'Password'),
            obscureText: controller.isShowPassword.value,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              isDense: true,
              isCollapsed: true,
              hintText: 'Password',
              hintStyle: MyTextStyle.bodySmall(),
              suffixIcon: InkWell(onTap: () => controller.passwordToggle(), child: Icon(controller.isShowPassword.value ? LucideIcons.eye : LucideIcons.eye_off)),
              contentPadding: MySpacing.all(16),
            ),
          ),
          MySpacing.height(20),
          MyText.labelMedium('Placeholder', muted: true, fontWeight: 600),
          MySpacing.height(8),
          TextField(
            style: MyTextStyle.bodySmall(),
            decoration: InputDecoration(border: const OutlineInputBorder(), isDense: true, isCollapsed: true, hintText: 'Placeholder', hintStyle: MyTextStyle.bodySmall(), contentPadding: MySpacing.all(12)),
          ),
          MySpacing.height(20),
          MyText.labelMedium('TextArea', muted: true, fontWeight: 600),
          MySpacing.height(8),
          TextField(
            maxLines: 4,
            minLines: 4,
            style: MyTextStyle.bodySmall(),
            decoration: InputDecoration(border: const OutlineInputBorder(), isDense: true, isCollapsed: true, hintText: 'Text Area', hintStyle: MyTextStyle.bodySmall(), contentPadding: MySpacing.all(12)),
          ),
          MySpacing.height(20),
          MyText.labelMedium('Read Only', muted: true, fontWeight: 600),
          MySpacing.height(8),
          TextField(
            readOnly: true,
            style: MyTextStyle.bodySmall(),
            decoration: InputDecoration(border: const OutlineInputBorder(), isDense: true, isCollapsed: true, hintText: 'Read Only', hintStyle: MyTextStyle.bodySmall(), contentPadding: MySpacing.all(12)),
          ),
          MySpacing.height(20),
          MyText.labelMedium('Disable', muted: true, fontWeight: 600),
          MySpacing.height(8),
          TextField(
            enabled: false,
            style: MyTextStyle.bodySmall(),
            decoration: InputDecoration(border: const OutlineInputBorder(), isDense: true, isCollapsed: true, hintText: 'Disable Value', hintStyle: MyTextStyle.bodySmall(), contentPadding: MySpacing.all(12)),
          ),
          MySpacing.height(20),
          MyText.labelMedium('Disable', muted: true, fontWeight: 600),
          MySpacing.height(8),
          TextField(
            decoration: InputDecoration(hintText: 'Helping text', hintStyle: MyTextStyle.bodySmall(), border: const OutlineInputBorder(), isDense: true, isCollapsed: true, contentPadding: MySpacing.all(12)),
          ),
          MySpacing.height(8),
          MyText.bodySmall('A block of help text that breaks onto a new line and may extend beyond one line.', fontWeight: 600),
        ],
      ),
    );
  }

  Widget inputSizing() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Input Sizing', fontWeight: 600),
          MySpacing.height(16),
          MyText.bodyMedium('Small', fontWeight: 600),
          MySpacing.height(8),
          TextField(
            decoration: InputDecoration(hintText: '.input-sm', border: const OutlineInputBorder(), contentPadding: MySpacing.all(8), isDense: true, isCollapsed: true),
            style: MyTextStyle.bodySmall(),
          ),
          MySpacing.height(16),
          MyText.bodyMedium('Normal', fontWeight: 600),
          MySpacing.height(8),
          TextField(
            style: MyTextStyle.bodyLarge(),
            decoration: InputDecoration(hintText: 'Normal', border: const OutlineInputBorder(), contentPadding: MySpacing.all(12), isDense: true, isCollapsed: true),
          ),
          MySpacing.height(16),
          MyText.bodyMedium('Large', fontWeight: 600),
          MySpacing.height(8),
          TextField(
            style: MyTextStyle.titleMedium(),
            decoration: InputDecoration(hintText: '.input-lg', border: const OutlineInputBorder(), contentPadding: MySpacing.all(16), isDense: true, isCollapsed: true),
          ),
          MySpacing.height(16),
          MyText.bodyMedium('Grid Sizes', fontWeight: 600),
          MySpacing.height(8),
          TextField(
            style: MyTextStyle.titleLarge(),
            decoration: const InputDecoration(hintText: '.col-sm-4', border: OutlineInputBorder()),
          ),
        ],
      ),
    );
  }

  Widget disabledInput() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Disabled Input', fontWeight: 600),
          MySpacing.height(16),
          MyText.labelMedium('Disable', muted: true, fontWeight: 600),
          MySpacing.height(8),
          TextField(
            enabled: false,
            style: MyTextStyle.bodySmall(),
            decoration: InputDecoration(border: const OutlineInputBorder(), isDense: true, isCollapsed: true, hintText: 'Disable Value', hintStyle: MyTextStyle.bodySmall(), contentPadding: MySpacing.all(12)),
          ),
          MySpacing.height(20),
          TextField(
            enabled: false,
            style: MyTextStyle.bodySmall(),
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              isDense: true,
              isCollapsed: true,
              hintText: 'Disable Value',
              hintStyle: MyTextStyle.bodySmall(),
              filled: true,
              fillColor: UiMixin.contentTheme.secondary.withValues(alpha: 0.2),
              contentPadding: MySpacing.all(16),
            ),
          ),
        ],
      ),
    );
  }

  Widget readOnly() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Read Only', fontWeight: 600),
          MySpacing.height(16),
          TextField(
            readOnly: true,
            style: MyTextStyle.bodySmall(),
            decoration: InputDecoration(border: const OutlineInputBorder(), isDense: true, isCollapsed: true, hintText: 'Read Only', hintStyle: MyTextStyle.bodySmall(), contentPadding: MySpacing.all(12)),
          ),
        ],
      ),
    );
  }

  Widget select() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Select', fontWeight: 600),
          MySpacing.height(16),
          MyText.bodyMedium('Input Select', fontWeight: 600),
          MySpacing.height(8),
          DropdownButtonFormField<String>(
            initialValue: controller.selectedValue.value,
            dropdownColor: UiMixin.contentTheme.onPrimary,
            hint: MyText.bodyMedium('Select an option', fontWeight: 600),
            isExpanded: true,
            items: <String>['1', '2', '3', '4', '5'].map((String value) => DropdownMenuItem<String>(value: value, child: MyText.bodyMedium(value, fontWeight: 600))).toList(),
            onChanged: (String? newValue) => controller.onSelectValue(newValue),
            borderRadius: BorderRadius.circular(12),
            decoration: InputDecoration(isDense: true, isCollapsed: true, border: const OutlineInputBorder(), contentPadding: MySpacing.all(12)),
          ),
          MySpacing.height(20),
          MyText.labelMedium('Multiple Select', fontWeight: 600),
          MySpacing.height(8),
          MyContainer.bordered(
            height: 100,
            paddingAll: 0,
            child: ListView(
              children: controller.options.map((String option) {
                return CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  dense: true,
                  fillColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) => !states.contains(WidgetState.selected) ? Colors.white : null),
                  visualDensity: VisualDensity.compact,
                  title: MyText.bodyMedium(option, fontWeight: 600),
                  value: controller.selectedOptions.contains(option),
                  onChanged: (bool? value) => controller.toggleSelection(option),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
