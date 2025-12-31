import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

import 'package:get/get.dart';

import '../../../../../helper/utils/my_shadow.dart';
import '../../../../../helper/widgets/my_card.dart';
import '../../../../../helper/widgets/my_container.dart';
import '../../../../../helper/widgets/my_spacing.dart';
import '../../../../../helper/widgets/my_text.dart';
import '../../../../../helper/widgets/my_text_style.dart';
import '../../../../../images.dart';
import '../../../../../themes/app_theme.dart';
import '../../../../../themes/ui_mixin.dart';
import '../../../../../views/layout/auth_layout.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: GetBuilder<SignUpController>(
        init: controller,
        builder: (SignUpController controller) {
          return Column(
            children: <Widget>[
              Form(
                key: controller.basicValidator.formKey,
                child: MyCard(
                  shadow: MyShadow(elevation: 0.2),
                  paddingAll: 44,
                  height: 700,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Image.asset(Images.logoDarkFull, height: 32),
                      MySpacing.height(20),
                      MyText.titleMedium('Sign Up', fontWeight: 700),
                      MySpacing.height(20),
                      MyText.bodyMedium('New to our platform? Sign up now! It only takes a minute.', fontWeight: 600, textAlign: TextAlign.center, muted: true),
                      MySpacing.height(20),
                      nameTextField(),
                      MySpacing.height(20),
                      emailTextField(),
                      MySpacing.height(20),
                      passwordField(),
                      MySpacing.height(12),
                      Obx(() => remember()),
                      MySpacing.height(12),
                      signInButton(),
                      MySpacing.height(20),
                      Row(
                        children: <Widget>[
                          const Expanded(child: Divider()),
                          MySpacing.width(8),
                          MyText.bodyMedium('OR sign with', fontWeight: 700, muted: true),
                          MySpacing.width(8),
                          const Expanded(child: Divider()),
                        ],
                      ),
                      MySpacing.height(20),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          MyContainer(onTap: () {}, padding: MySpacing.xy(20, 8), color: UiMixin.contentTheme.light, child: const Icon(Boxicons.bxl_google, size: 20)),
                          MySpacing.width(8),
                          MyContainer(onTap: () {}, padding: MySpacing.xy(20, 8), color: UiMixin.contentTheme.light, child: const Icon(Boxicons.bxl_facebook, size: 20)),
                          MySpacing.width(8),
                          MyContainer(onTap: () {}, padding: MySpacing.xy(20, 8), color: UiMixin.contentTheme.light, child: const Icon(Boxicons.bxl_github, size: 20)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              MySpacing.height(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MyText.bodyMedium('I already have an account'),
                  MySpacing.width(8),
                  InkWell(onTap: controller.gotoLogin, child: MyText.bodyMedium('Sign In', fontWeight: 800, muted: true)),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget nameTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MyText.bodyMedium('Name', fontWeight: 600, muted: true),
        MySpacing.height(12),
        TextFormField(
          controller: controller.basicValidator.getController('name'),
          validator: controller.basicValidator.getValidation('name'),
          style: MyTextStyle.bodyMedium(xMuted: true),
          cursorWidth: 1,
          cursorColor: theme.colorScheme.onSurface.withAlpha(120),
          decoration: InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide(width: 1, strokeAlign: 0, color: theme.colorScheme.onSurface.withAlpha(80))),
            disabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, strokeAlign: 0, color: theme.colorScheme.onSurface.withAlpha(80))),
            errorBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, strokeAlign: 0, color: UiMixin.contentTheme.danger)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, strokeAlign: 0, color: theme.colorScheme.onSurface.withAlpha(80))),
            focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, strokeAlign: 0, color: UiMixin.contentTheme.danger)),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, strokeAlign: 0, color: theme.colorScheme.onSurface.withAlpha(80))),
            hintText: 'Enter your name',
            hintStyle: MyTextStyle.bodyMedium(xMuted: true),
            isCollapsed: true,
            isDense: true,
            contentPadding: MySpacing.all(15),
          ),
        ),
      ],
    );
  }

  Widget emailTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MyText.bodyMedium('Email', fontWeight: 600, muted: true),
        MySpacing.height(12),
        TextFormField(
          controller: controller.basicValidator.getController('email'),
          validator: controller.basicValidator.getValidation('email'),
          style: MyTextStyle.bodyMedium(xMuted: true),
          cursorWidth: 1,
          cursorColor: theme.colorScheme.onSurface.withAlpha(120),
          decoration: InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide(width: 1, strokeAlign: 0, color: theme.colorScheme.onSurface.withAlpha(80))),
            disabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, strokeAlign: 0, color: theme.colorScheme.onSurface.withAlpha(80))),
            errorBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, strokeAlign: 0, color: UiMixin.contentTheme.danger)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, strokeAlign: 0, color: theme.colorScheme.onSurface.withAlpha(80))),
            focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, strokeAlign: 0, color: UiMixin.contentTheme.danger)),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, strokeAlign: 0, color: theme.colorScheme.onSurface.withAlpha(80))),
            hintText: 'Enter your email',
            hintStyle: MyTextStyle.bodyMedium(xMuted: true),
            isCollapsed: true,
            isDense: true,
            contentPadding: MySpacing.all(15),
          ),
        ),
      ],
    );
  }

  Widget passwordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MyText.bodyMedium('Password', fontWeight: 600, muted: true),
        MySpacing.height(12),
        TextFormField(
          controller: controller.basicValidator.getController('password'),
          validator: controller.basicValidator.getValidation('password'),
          style: MyTextStyle.bodyMedium(xMuted: true),
          cursorWidth: 1,
          cursorColor: theme.colorScheme.onSurface.withAlpha(120),
          decoration: InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide(width: 1, strokeAlign: 0, color: theme.colorScheme.onSurface.withAlpha(80))),
            disabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, strokeAlign: 0, color: theme.colorScheme.onSurface.withAlpha(80))),
            errorBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, strokeAlign: 0, color: UiMixin.contentTheme.danger)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, strokeAlign: 0, color: theme.colorScheme.onSurface.withAlpha(80))),
            focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, strokeAlign: 0, color: UiMixin.contentTheme.danger)),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, strokeAlign: 0, color: theme.colorScheme.onSurface.withAlpha(80))),
            hintText: 'Enter your password',
            hintStyle: MyTextStyle.bodyMedium(xMuted: true),
            isCollapsed: true,
            isDense: true,
            contentPadding: MySpacing.all(15),
          ),
        ),
      ],
    );
  }

  Widget remember() {
    return Theme(
      data: ThemeData(),
      child: CheckboxListTile(
        value: controller.termAndConditions.value,
        onChanged: (bool? value) => controller.termAndConditionsToggle(),
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: MySpacing.zero,
        activeColor: UiMixin.contentTheme.primary,
        dense: true,
        side: BorderSide(color: UiMixin.contentTheme.secondary),
        title: MyText.bodyMedium('I accept Terms and Condition', fontWeight: 600, color: UiMixin.contentTheme.secondary),
      ),
    );
  }

  Widget signInButton() {
    return MyContainer(
      onTap: controller.onLogin,
      paddingAll: 10,
      width: double.infinity,
      color: UiMixin.contentTheme.primary,
      child: Center(child: MyText.bodyMedium('Sign In', color: UiMixin.contentTheme.onPrimary)),
    );
  }
}
