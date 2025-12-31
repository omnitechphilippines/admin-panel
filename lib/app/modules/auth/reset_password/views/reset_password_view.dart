import 'package:flutter/material.dart';
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
import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: Column(
        children: <Widget>[
          Form(
            key: controller.basicValidator.formKey,
            child: MyCard(
              shadow: MyShadow(elevation: 0.2),
              paddingAll: 44,
              height: 400,
              child: Column(
                children: <Widget>[
                  Image.asset(Images.logoDarkFull, height: 32),
                  MySpacing.height(20),
                  MyText.titleMedium('Reset Password', fontWeight: 700),
                  MySpacing.height(20),
                  MyText.bodyMedium('Enter your email address and we\'ll send you an email with instructions to reset your password.', fontWeight: 600, textAlign: TextAlign.center, muted: true),
                  MySpacing.height(20),
                  emailTextField(),
                  MySpacing.height(20),
                  signInButton(),
                ],
              ),
            ),
          ),
          MySpacing.height(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MyText.bodyMedium('Back to'),
              MySpacing.width(8),
              InkWell(onTap: controller.gotoLogIn, child: MyText.bodyMedium('Sign In', fontWeight: 800, muted: true)),
            ],
          ),
        ],
      ),
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

  Widget signInButton() {
    return MyContainer(
      onTap: controller.onLogin,
      paddingAll: 12,
      width: double.infinity,
      color: UiMixin.contentTheme.primary,
      child: Center(child: MyText.bodyMedium('Reset Password', fontWeight: 600, color: UiMixin.contentTheme.onPrimary)),
    );
  }
}
