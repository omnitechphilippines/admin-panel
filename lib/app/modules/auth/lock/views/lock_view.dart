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
import '../controllers/lock_controller.dart';

class LockView extends GetView<LockController> {
  const LockView({super.key});
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
              height: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image.asset(Images.logoDarkFull, height: 32),
                  MySpacing.height(20),
                  MyText.titleMedium('Hi ! Omni', fontWeight: 700),
                  MySpacing.height(20),
                  MyText.bodyMedium('Enter your password to access the admin.', fontWeight: 600, textAlign: TextAlign.center, muted: true),
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
              MyText.bodyMedium('New here?'),
              MySpacing.width(8),
              InkWell(onTap: controller.goToSignUp, child: MyText.bodyMedium('Sign Up', fontWeight: 800, muted: true)),
            ],
          ),
        ],
      ),
    );
  }

  Widget emailTextField() {
    return TextFormField(
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
    );
  }

  Widget signInButton() {
    return MyContainer(
      onTap: controller.onSignIn,
      paddingAll: 12,
      width: double.infinity,
      color: UiMixin.contentTheme.primary,
      child: Center(child: MyText.bodyMedium('Sign In', fontWeight: 600, color: UiMixin.contentTheme.onPrimary)),
    );
  }
}
