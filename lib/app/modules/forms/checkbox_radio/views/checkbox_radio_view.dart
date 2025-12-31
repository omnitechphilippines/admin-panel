import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../helper/utils/my_shadow.dart';
import '../../../../../helper/widgets/my_card.dart';
import '../../../../../helper/widgets/my_flex.dart';
import '../../../../../helper/widgets/my_flex_item.dart';
import '../../../../../helper/widgets/my_spacing.dart';
import '../../../../../helper/widgets/my_text.dart';
import '../../../../../helper/widgets/responsive.dart';
import '../../../../../views/layout/layout.dart';
import '../controllers/checkbox_radio_controller.dart';

class CheckboxRadioView extends GetView<CheckboxRadioController> {
  const CheckboxRadioView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: MySpacing.x(flexSpacing / 2),
        child: Center(
          child: GetBuilder<CheckboxRadioController>(
            builder: (_) => MyFlex(
              children: <MyFlexItem>[
                MyFlexItem(sizes: 'lg-8', child: checkbox()),
                MyFlexItem(sizes: 'lg-8', child: inlineCheckbox()),
                MyFlexItem(sizes: 'lg-8', child: disabledCheckbox()),
                MyFlexItem(sizes: 'lg-8', child: colorsCheckbox()),
                MyFlexItem(sizes: 'lg-8', child: radio()),
                MyFlexItem(sizes: 'lg-8', child: inlineRadio()),
                MyFlexItem(sizes: 'lg-8', child: disabledRadio()),
                MyFlexItem(sizes: 'lg-8', child: colorsRadio()),
                MyFlexItem(sizes: 'lg-8', child: defaultSwitch()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget checkbox() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Checkbox', fontWeight: 600),
          MySpacing.height(16),
          Row(
            children: <Widget>[
              Checkbox(
                value: controller.isChecked1.value,
                fillColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
                  if (!states.contains(WidgetState.selected)) {
                    return Colors.white;
                  }
                  return null;
                }),
                overlayColor: const WidgetStatePropertyAll<Color>(Colors.white),
                onChanged: (bool? value) => controller.onCheckbox1(),
              ),
              MyText.bodyMedium('Check this custom checkbox', muted: true, fontWeight: 600),
            ],
          ),
          Row(
            children: <Widget>[
              Checkbox(
                value: controller.isChecked2.value,
                fillColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
                  if (!states.contains(WidgetState.selected)) {
                    return Colors.white;
                  }
                  return null;
                }),
                overlayColor: const WidgetStatePropertyAll<Color>(Colors.white),
                onChanged: (bool? value) => controller.onCheckbox2(),
              ),
              MyText.bodyMedium('Check this custom checkbox', muted: true, fontWeight: 600),
            ],
          ),
        ],
      ),
    );
  }

  Widget inlineCheckbox() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Inline Checkbox', fontWeight: 600),
          MySpacing.height(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: CheckboxListTile(
                  visualDensity: VisualDensity.compact,
                  value: controller.isChecked3.value,
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: MySpacing.all(0),
                  fillColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
                    if (!states.contains(WidgetState.selected)) {
                      return Colors.white;
                    }
                    return null;
                  }),
                  overlayColor: const WidgetStatePropertyAll<Color>(Colors.white),
                  dense: true,
                  onChanged: (bool? value) => controller.onCheckbox3(),
                  title: MyText.bodyMedium('Check this custom checkbox', muted: true, fontWeight: 600),
                ),
              ),
              MySpacing.width(20),
              Expanded(
                child: CheckboxListTile(
                  visualDensity: VisualDensity.compact,
                  value: controller.isChecked4.value,
                  onChanged: (bool? value) => controller.onCheckbox4(),
                  controlAffinity: ListTileControlAffinity.leading,
                  fillColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
                    if (!states.contains(WidgetState.selected)) {
                      return Colors.white;
                    }
                    return null;
                  }),
                  overlayColor: const WidgetStatePropertyAll<Color>(Colors.white),
                  contentPadding: MySpacing.all(0),
                  dense: true,
                  title: MyText.bodyMedium('Check this custom checkbox', muted: true, fontWeight: 600),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget disabledCheckbox() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Disabled Checkbox', fontWeight: 600),
          MySpacing.height(16),
          Wrap(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Checkbox(
                    value: true,
                    onChanged: null,
                    fillColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
                      if (!states.contains(WidgetState.selected)) {
                        return Colors.white;
                      }
                      return null;
                    }),
                    overlayColor: const WidgetStatePropertyAll<Color>(Colors.white),
                  ),
                  MyText.bodyMedium('Check this custom checkbox', fontWeight: 600, xMuted: true),
                ],
              ),
              MySpacing.width(20),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: false,
                    onChanged: null,
                    fillColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
                      if (!states.contains(WidgetState.selected)) {
                        return Colors.white;
                      }
                      return null;
                    }),
                    overlayColor: const WidgetStatePropertyAll<Color>(Colors.white),
                  ),
                  MyText.bodyMedium('Check this custom checkbox', fontWeight: 600, xMuted: true),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget colorsCheckbox() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Colors Checkbox', fontWeight: 600),
          MySpacing.height(16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              for (final MapEntry<int, Map<String, dynamic>> item in controller.checkboxData.asMap().entries)
                Row(
                  children: <Widget>[
                    Checkbox(
                      onChanged: (bool? value) {
                        controller.onColorCheckbox(item.key, value);
                      },
                      activeColor: item.value['color'],
                      visualDensity: VisualDensity.compact,
                      fillColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) => !states.contains(WidgetState.selected) ? Colors.white : null),
                      overlayColor: const WidgetStatePropertyAll<Color>(Colors.white),
                      value: item.value['isChecked'],
                    ),
                    MyText.bodyMedium(item.value['label'], muted: true, fontWeight: 600),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget radio() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Radio', fontWeight: 600),
          MySpacing.height(16),
          RadioGroup<int>(
            groupValue: controller.selectedRadioValue.value,
            onChanged: (int? value) => controller.onSelectRadio(value),
            child: Column(
              children: <Widget>[
                ListTile(visualDensity: VisualDensity.compact, contentPadding: MySpacing.zero, title: MyText.bodyMedium('Default radio', fontWeight: 600), leading: const Radio<int>(value: 1)),
                ListTile(visualDensity: VisualDensity.compact, contentPadding: MySpacing.zero, title: MyText.bodyMedium('Default checked radio', fontWeight: 600), leading: const Radio<int>(value: 2)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget inlineRadio() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Inline Radio', fontWeight: 600),
          MySpacing.height(16),
          RadioGroup<int>(
            groupValue: controller.selectedInlineValue.value,
            onChanged: (int? value) => controller.onSelectInlineRadio(value),
            child: Wrap(
              children: <Widget>[
                Row(mainAxisSize: MainAxisSize.min, children: <Widget>[const Radio<int>(value: 1), MyText.bodyMedium('Check this custom checkbox', fontWeight: 600)]),
                MySpacing.width(20),
                Row(mainAxisSize: MainAxisSize.min, children: <Widget>[const Radio<int>(value: 2), MyText.bodyMedium('Check this custom checkbox', fontWeight: 600)]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget disabledRadio() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Disabled Radio', fontWeight: 600),
          MySpacing.height(16),
          RadioGroup<int>(
            groupValue: controller.selectedDisableRadioValue.value,
            onChanged: (_) {},
            child: Wrap(
              children: <Widget>[
                Row(mainAxisSize: MainAxisSize.min, children: <Widget>[const Radio<int>(value: 1, enabled: false), MyText.bodyMedium('Toggle this custom radio', fontWeight: 600)]),
                MySpacing.width(20),
                Row(mainAxisSize: MainAxisSize.min, children: <Widget>[const Radio<int>(value: 2, enabled: false), MyText.bodyMedium('Or toggle this other custom radio', fontWeight: 600)]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget colorsRadio() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Colors Radio', fontWeight: 600),
          MySpacing.height(16),
          buildRadio(1, 'Default Radio', Colors.grey),
          buildRadio(2, 'Success Radio', Colors.green),
          buildRadio(3, 'Info Radio', Colors.blue),
          buildRadio(4, 'Secondary Radio', Colors.orange),
          buildRadio(5, 'Warning Radio', Colors.amber),
          buildRadio(6, 'Danger Radio', Colors.red),
          buildRadio(7, 'Dark Radio', Colors.black),
        ],
      ),
    );
  }

  Widget buildRadio(int value, String label, Color color) {
    return Row(
      children: <Widget>[
        RadioGroup<int>(
          groupValue: controller.selectedRadioColorValue.value,
          onChanged: (int? newValue) => controller.onSelectColorRadio(newValue),
          child: Radio<int>(value: value, activeColor: color),
        ),
        MyText.bodyMedium(label, fontWeight: 600),
      ],
    );
  }

  Widget defaultSwitch() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Switch', fontWeight: 600),
          MySpacing.height(16),
          InkWell(
            onTap: controller.onSwitch1,
            child: Row(
              children: <Widget>[
                Switch(value: controller.isSwitch1.value, padding: MySpacing.zero, onChanged: (bool value) => controller.onSwitch1()),
                MyText.bodyMedium('Default switch checkbox input', fontWeight: 600),
              ],
            ),
          ),
          InkWell(
            onTap: controller.onSwitch2,
            child: Row(
              children: <Widget>[
                Switch(value: controller.isSwitch2.value, padding: MySpacing.zero, onChanged: (bool value) => controller.onSwitch2()),
                MyText.bodyMedium('Checked switch checkbox input', fontWeight: 600),
              ],
            ),
          ),
          SwitchListTile(value: controller.isChecked3.value, controlAffinity: ListTileControlAffinity.leading, contentPadding: MySpacing.zero, dense: true, onChanged: null, title: const Text('Disabled switch checkbox input')),
          SwitchListTile(value: controller.isChecked4.value, controlAffinity: ListTileControlAffinity.leading, contentPadding: MySpacing.zero, dense: true, onChanged: null, title: const Text('Disabled checked switch checkbox input')),
        ],
      ),
    );
  }
}
