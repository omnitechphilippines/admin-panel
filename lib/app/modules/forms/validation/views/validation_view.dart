import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

import 'package:get/get.dart';

import '../../../../../helper/utils/my_shadow.dart';
import '../../../../../helper/widgets/my_button.dart';
import '../../../../../helper/widgets/my_card.dart';
import '../../../../../helper/widgets/my_flex.dart';
import '../../../../../helper/widgets/my_flex_item.dart';
import '../../../../../helper/widgets/my_spacing.dart';
import '../../../../../helper/widgets/my_text.dart';
import '../../../../../helper/widgets/my_text_style.dart';
import '../../../../../helper/widgets/responsive.dart';
import '../../../../../themes/app_theme.dart';
import '../../../../../themes/ui_mixin.dart';
import '../../../../../views/layout/layout.dart';
import '../controllers/validation_controller.dart';

class ValidationView extends GetView<ValidationController> {
  const ValidationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder<ValidationController>(
        builder: (_) => Padding(
          padding: MySpacing.x(flexSpacing / 2),
          child: Center(
            child: MyFlex(
              children: <MyFlexItem>[MyFlexItem(sizes: 'lg-8', child: validation())],
            ),
          ),
        ),
      ),
    );
  }

  Widget validation() {
    final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(width: 1, strokeAlign: 0, color: theme.colorScheme.onSurface.withAlpha(80)),
    );
    final OutlineInputBorder focusedInputBorder = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(width: 1, color: theme.colorScheme.primary),
    );
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Form(
        key: controller.basicValidator.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyText.titleMedium('Validation', fontWeight: 600),
            MySpacing.height(16),
            MyText.labelMedium('Full Name'),
            MySpacing.height(8),
            CommonValidationForm(
              hintText: 'Benjamin Campbell',
              icon: LucideIcons.user,
              validator: controller.basicValidator.getValidation('full_name'),
              controller: controller.basicValidator.getController('full_name'),
              outlineInputBorder: outlineInputBorder,
            ),
            MySpacing.height(16),
            MyText.labelMedium('Email Address'),
            MySpacing.height(8),
            CommonValidationForm(
              icon: LucideIcons.mail,
              hintText: 'omnitechphilippines@gmail.com',
              validator: controller.basicValidator.getValidation('email'),
              controller: controller.basicValidator.getController('email'),
              outlineInputBorder: outlineInputBorder,
            ),
            MySpacing.height(16),
            MyText.labelMedium('Password'),
            MySpacing.height(8),
            CommonValidationForm(icon: LucideIcons.lock, hintText: '******', validator: controller.basicValidator.getValidation('password'), controller: controller.basicValidator.getController('password'), outlineInputBorder: outlineInputBorder),
            MySpacing.height(20),
            MyText.labelMedium('Gender'),
            MySpacing.height(8),
            DropdownButtonFormField<Gender>(
              dropdownColor: theme.colorScheme.surface,
              menuMaxHeight: 200,
              items: Gender.values.map((Gender gender) => DropdownMenuItem<Gender>(value: gender, child: MyText.labelMedium(gender.name.capitalize!))).toList(),
              icon: const Icon(LucideIcons.chevron_down, size: 20),
              decoration: InputDecoration(
                hintText: 'Select gender',
                hintStyle: MyTextStyle.bodySmall(xMuted: true),
                border: outlineInputBorder,
                enabledBorder: outlineInputBorder,
                focusedBorder: focusedInputBorder,
                isCollapsed: true,
                isDense: true,
                contentPadding: MySpacing.all(12),
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              onChanged: controller.basicValidator.onChanged<Object?>('gender'),
              validator: controller.basicValidator.getValidation<Gender?>('gender'),
            ),
            MySpacing.height(16),
            MyText.labelMedium('City'),
            MySpacing.height(8),
            CommonValidationForm(icon: LucideIcons.building, hintText: 'City', validator: controller.basicValidator.getValidation('city'), controller: controller.basicValidator.getController('city'), outlineInputBorder: outlineInputBorder),
            MySpacing.height(16),
            MyText.labelMedium('State'),
            MySpacing.height(8),
            CommonValidationForm(icon: LucideIcons.building_2, hintText: 'State', validator: controller.basicValidator.getValidation('state'), controller: controller.basicValidator.getController('state'), outlineInputBorder: outlineInputBorder),
            MySpacing.height(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                MyButton(
                  onPressed: controller.onResetBasicForm,
                  elevation: 0,
                  padding: MySpacing.xy(20, 16),
                  backgroundColor: UiMixin.contentTheme.secondary,
                  borderRadiusAll: 8,
                  child: MyText.bodySmall('Clear', color: UiMixin.contentTheme.onSecondary),
                ),
                MySpacing.width(16),
                MyButton(
                  onPressed: controller.onSubmitBasicForm,
                  elevation: 0,
                  padding: MySpacing.xy(20, 16),
                  backgroundColor: UiMixin.contentTheme.primary,
                  borderRadiusAll: 8,
                  child: MyText.bodySmall('Submit', color: UiMixin.contentTheme.onPrimary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CommonValidationForm extends StatelessWidget {
  const CommonValidationForm({super.key, required this.controller, required this.outlineInputBorder, this.validator, this.hintText, this.icon});

  final IconData? icon;
  final String? hintText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final OutlineInputBorder outlineInputBorder;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: MyTextStyle.bodySmall(xMuted: true),
        border: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        contentPadding: MySpacing.all(16),
        prefixIcon: icon == null ? const SizedBox() : Icon(icon, size: 20),
        isCollapsed: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
    );
  }
}
