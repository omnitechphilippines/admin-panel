import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:get/get.dart';

import '../../../../../helper/extensions/string.dart';
import '../../../../../helper/theme/admin_theme.dart';
import '../../../../../helper/widgets/my_button.dart';
import '../../../../../helper/widgets/my_spacing.dart';
import '../../../../../helper/widgets/my_text.dart';

class ToastController extends GetxController with GetTickerProviderStateMixin {
  final RxBool showBanner = false.obs, showLeadingIcon = true.obs, showOkAction = true.obs, showCloseIcon = true.obs, sticky = false.obs;
  late final TickerProvider ticker;
  late final AnimationController animationController = AnimationController(vsync: ticker, duration: const Duration(seconds: 20));
  SnackBarBehavior selectedBehavior = SnackBarBehavior.floating;
  final TextEditingController toastTitleController = TextEditingController(text: 'Omni is awesome');
  ContentThemeColor selectedColor = ContentThemeColor.primary;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    ticker = this;
  }

  void setBannerType(bool value) => showBanner.value = value;

  void onAction(bool? value) => value != null ? (showBanner.value ? showLeadingIcon.value = value : showOkAction.value = value) : null;

  void show() => showBanner.value ? showMaterialBanner() : showSnackBar();

  void onChangeColor(ContentThemeColor? value) => value != null ? selectedColor = value : null;

  void onChangeBehavior(SnackBarBehavior? value) => value != null ? selectedBehavior = value : null;

  void onChangeShowCloseIcon(bool? value) => value != null ? showCloseIcon.value = value : null;

  void onChangeSticky(bool? value) => value != null ? sticky.value = value : null;

  void showMaterialBanner() {
    final String text = toastTitleController.value.text.nullIfEmpty ?? 'Please set title';
    final Color backgroundColor = selectedColor.color;
    final Color color = selectedColor.onColor;

    final List<Widget> actions = <Widget>[];
    if (showCloseIcon.value) {
      actions.add(
        MyButton.text(
          onPressed: () => ScaffoldMessenger.of(Get.context!).hideCurrentMaterialBanner(),
          padding: MySpacing.x(8),
          splashColor: color.withValues(alpha: 0.1),
          child: MyText.labelMedium('Dismiss', color: color),
        ),
      );
    } else {
      actions.add(MySpacing.empty());
    }

    Widget? leadingIcon;
    if (showLeadingIcon.value) {
      leadingIcon = Icon(LucideIcons.info, color: color, size: 20);
    }

    final MaterialBanner banner = MaterialBanner(
      content: MyText.labelMedium(text, color: color),
      padding: MySpacing.x(24),
      leading: leadingIcon,
      actions: actions,
      overflowAlignment: OverflowBarAlignment.center,
      forceActionsBelow: false,
      backgroundColor: backgroundColor,
    );

    ScaffoldMessenger.of(Get.context!).hideCurrentMaterialBanner();
    ScaffoldMessenger.of(Get.context!).showMaterialBanner(banner);

    _timer?.cancel();
    if (!sticky.value) {
      _timer = Timer(const Duration(seconds: 3), () {
        ScaffoldMessenger.of(Get.context!).hideCurrentMaterialBanner();
      });
    }
  }

  void showSnackBar() {
    final String text = toastTitleController.value.text.nullIfEmpty ?? 'Please set title';
    final Color backgroundColor = selectedColor.color;
    final Color color = selectedColor.onColor;
    final double? width = selectedBehavior == SnackBarBehavior.fixed ? null : 300;
    final Duration duration = Duration(seconds: sticky.value ? 10000 : 3);

    SnackBarAction? action;
    if (showOkAction.value) {
      action = SnackBarAction(label: 'Ok', onPressed: () => ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar(), textColor: color);
    }

    final SnackBar snackBar = SnackBar(
      width: width,
      behavior: selectedBehavior,
      duration: duration,
      showCloseIcon: showCloseIcon.value,
      closeIconColor: color,
      action: action,
      animation: Tween<double>(begin: 0, end: 300).animate(animationController),
      content: MyText.labelLarge(text, color: color),
      backgroundColor: backgroundColor,
    );
    ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }

  @override
  void onClose() {
    toastTitleController.dispose();
    super.onClose();
  }
}
