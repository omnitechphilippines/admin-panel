import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

import 'package:get/get.dart';

import '../../../../../helper/theme/admin_theme.dart';
import '../../../../../helper/utils/my_shadow.dart';
import '../../../../../helper/widgets/my_button.dart';
import '../../../../../helper/widgets/my_card.dart';
import '../../../../../helper/widgets/my_container.dart';
import '../../../../../helper/widgets/my_flex.dart';
import '../../../../../helper/widgets/my_flex_item.dart';
import '../../../../../helper/widgets/my_spacing.dart';
import '../../../../../helper/widgets/my_text.dart';
import '../../../../../helper/widgets/my_text_style.dart';
import '../../../../../helper/widgets/responsive.dart';
import '../../../../../images.dart';
import '../../../../../themes/app_theme.dart';
import '../../../../../themes/ui_mixin.dart';
import '../../../../../views/layout/layout.dart';
import '../controllers/toast_controller.dart';

class ToastView extends GetView<ToastController> {
  const ToastView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: MySpacing.x(flexSpacing / 2),
        child: Obx(
          () => Center(
            child: MyFlex(
              children: <MyFlexItem>[
                MyFlexItem(sizes: 'lg-8', child: basicExamples()),
                MyFlexItem(sizes: 'lg-8', child: customContent()),
                MyFlexItem(sizes: 'lg-8', child: toastCustomize()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget basicExamples() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[MyText.titleMedium('Basic Examples', fontWeight: 600), MySpacing.height(16), const CustomNotificationContentTwo()]),
    );
  }

  Widget customContent() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Custom Content', fontWeight: 600),
          MySpacing.height(16),
          CustomNotificationContentOne(color: UiMixin.contentTheme.secondary),
          CustomNotificationContentOne(color: UiMixin.contentTheme.primary),
        ],
      ),
    );
  }

  Widget toastCustomize() {
    final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(width: 1, strokeAlign: 0, color: theme.colorScheme.onSurface.withAlpha(80)),
    );
    return MyCard(
      shadow: MyShadow(elevation: .5),
      paddingAll: 0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: MySpacing.only(left: 23, top: 20, bottom: 8, right: 23), child: MyText.titleMedium("${controller.showBanner.value ? 'Banner' : "Toast"} Customizer", fontWeight: 600)),
          const Divider(height: 24),
          Padding(
            padding: MySpacing.only(left: 23, top: 8, bottom: 23, right: 23),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Wrap(clipBehavior: Clip.antiAliasWithSaveLayer, spacing: 16, runSpacing: 16, children: <Widget>[buildMessageType(), buildColorVariation(), if (!controller.showBanner.value) buildFloatingType()]),
                MySpacing.height(12),
                MyText.bodyMedium('Title Text', fontWeight: 600),
                MySpacing.height(8),
                TextFormField(
                  controller: controller.toastTitleController,
                  decoration: InputDecoration(
                    labelText: 'Toast Text',
                    filled: true,
                    contentPadding: MySpacing.all(16),
                    border: outlineInputBorder,
                    disabledBorder: outlineInputBorder,
                    enabledBorder: outlineInputBorder,
                    focusedBorder: outlineInputBorder,
                    isCollapsed: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
                MySpacing.height(12),
                buildAction(),
                MySpacing.height(12),
                buildTimeOut(),
                Center(
                  child: MyButton(
                    onPressed: controller.show,
                    elevation: 0,
                    padding: MySpacing.xy(20, 16),
                    backgroundColor: UiMixin.contentTheme.primary,
                    borderRadiusAll: 8,
                    child: MyText.bodySmall('Show', color: UiMixin.contentTheme.onPrimary),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTimeOut() {
    const VisualDensity getCompactDensity = VisualDensity(horizontal: -4, vertical: -4);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MyText.bodyMedium('Timeout', fontWeight: 600),
        SwitchListTile(
          value: controller.sticky.value,
          onChanged: controller.onChangeSticky,
          controlAffinity: ListTileControlAffinity.leading,
          visualDensity: getCompactDensity,
          contentPadding: MySpacing.zero,
          dense: true,
          title: MyText.bodyMedium("${"Infinite"} (∞)", fontWeight: 600),
        ),
      ],
    );
  }

  Widget buildAction() {
    const VisualDensity getCompactDensity = VisualDensity(horizontal: -4, vertical: -4);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MyText.bodyMedium('Actions', fontWeight: 600),
        MySpacing.height(8),
        Theme(
          data: ThemeData(unselectedWidgetColor: UiMixin.contentTheme.light),
          child: CheckboxListTile(
            value: controller.showCloseIcon.value,
            onChanged: controller.onChangeShowCloseIcon,
            controlAffinity: ListTileControlAffinity.leading,
            visualDensity: getCompactDensity,
            contentPadding: MySpacing.zero,
            activeColor: UiMixin.contentTheme.primary,
            dense: true,
            title: MyText.bodyMedium('Show Close Icon', fontWeight: 600),
          ),
        ),
        Theme(
          data: ThemeData(unselectedWidgetColor: UiMixin.contentTheme.light),
          child: CheckboxListTile(
            value: controller.showBanner.value ? controller.showLeadingIcon.value : controller.showOkAction.value,
            onChanged: controller.onAction,
            activeColor: UiMixin.contentTheme.primary,
            controlAffinity: ListTileControlAffinity.leading,
            visualDensity: getCompactDensity,
            contentPadding: MySpacing.zero,
            dense: true,
            title: MyText.bodyMedium(controller.showBanner.value ? 'Show Leading Icon' : 'Show ok Action', fontWeight: 600),
          ),
        ),
      ],
    );
  }

  Widget buildFloatingType() {
    final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(width: 1, strokeAlign: 0, color: theme.colorScheme.onSurface.withAlpha(80)),
    );
    return SizedBox(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.bodyMedium('Floating Type', fontWeight: 600),
          MySpacing.height(12),
          DropdownButtonFormField<SnackBarBehavior>(
            initialValue: controller.selectedBehavior,
            decoration: InputDecoration(
              hintText: 'Select Type',
              hintStyle: MyTextStyle.bodyMedium(),
              border: outlineInputBorder,
              disabledBorder: outlineInputBorder,
              enabledBorder: outlineInputBorder,
              focusedBorder: outlineInputBorder,
              contentPadding: MySpacing.all(12),
              isCollapsed: true,
              filled: true,
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
            dropdownColor: UiMixin.contentTheme.background,
            onChanged: (SnackBarBehavior? newValue) => newValue != null ? controller.onChangeBehavior(newValue) : null,
            items: SnackBarBehavior.values.map<DropdownMenuItem<SnackBarBehavior>>((SnackBarBehavior behavior) {
              return DropdownMenuItem<SnackBarBehavior>(
                value: behavior,
                child: InkWell(onTap: () => controller.onChangeBehavior(behavior), child: MyText.labelMedium(behavior.name.capitalize!)),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget buildColorVariation() {
    final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(width: 1, strokeAlign: 0, color: theme.colorScheme.onSurface.withAlpha(80)),
    );
    return SizedBox(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.bodyMedium('Color variation', fontWeight: 600),
          MySpacing.height(12),
          DropdownButtonFormField<ContentThemeColor>(
            dropdownColor: UiMixin.contentTheme.background,
            initialValue: controller.selectedColor,
            onChanged: controller.onChangeColor,
            decoration: InputDecoration(
              hintText: 'Select Type',
              hintStyle: MyTextStyle.bodyMedium(),
              border: outlineInputBorder,
              disabledBorder: outlineInputBorder,
              enabledBorder: outlineInputBorder,
              focusedBorder: outlineInputBorder,
              contentPadding: MySpacing.all(12),
              isCollapsed: true,
              filled: true,
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
            items: ContentThemeColor.values.map((ContentThemeColor color) {
              return DropdownMenuItem<ContentThemeColor>(
                value: color,
                child: InkWell(onTap: () => controller.onChangeColor(color), child: MyText.labelMedium(color.name.capitalize!, fontWeight: 600)),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget buildMessageType() {
    final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(width: 1, strokeAlign: 0, color: theme.colorScheme.onSurface.withAlpha(80)),
    );
    return SizedBox(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.bodyMedium('Message Type', fontWeight: 600),
          MySpacing.height(12),
          DropdownButtonFormField<bool>(
            initialValue: controller.showBanner.value,
            decoration: InputDecoration(
              hintText: 'Select Type',
              hintStyle: MyTextStyle.bodyMedium(),
              border: outlineInputBorder,
              disabledBorder: outlineInputBorder,
              enabledBorder: outlineInputBorder,
              focusedBorder: outlineInputBorder,
              contentPadding: MySpacing.all(12),
              isCollapsed: true,
              filled: true,
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
            dropdownColor: UiMixin.contentTheme.background,
            onChanged: (bool? newValue) => controller.setBannerType(newValue!),
            items: <DropdownMenuItem<bool>>[
              DropdownMenuItem<bool>(
                value: false,
                child: InkWell(onTap: () => controller.setBannerType(false), child: MyText.labelMedium('Toast')),
              ),
              DropdownMenuItem<bool>(
                value: true,
                child: InkWell(onTap: () => controller.setBannerType(true), child: MyText.labelMedium('Banner')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomNotificationContentOne extends StatefulWidget {
  final Color? color;

  const CustomNotificationContentOne({super.key, this.color});

  @override
  State<CustomNotificationContentOne> createState() => _CustomNotificationContentOneState();
}

class _CustomNotificationContentOneState extends State<CustomNotificationContentOne> {
  bool isShowNotification = false;

  void onShowBasicNotification() {
    isShowNotification = !isShowNotification;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return isShowNotification
        ? const SizedBox()
        : MyContainer(
            margin: MySpacing.bottom(20),
            paddingAll: 0,
            color: widget.color,
            child: Padding(
              padding: MySpacing.xy(12, 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MyText.bodySmall('Hello, world! This is a toast message.', fontWeight: 600, muted: true, color: UiMixin.contentTheme.onPrimary),
                  IconButton(
                    onPressed: onShowBasicNotification,
                    visualDensity: VisualDensity.compact,
                    icon: Icon(LucideIcons.x, size: 12, color: UiMixin.contentTheme.onPrimary),
                  ),
                ],
              ),
            ),
          );
  }
}

class CustomNotificationContentTwo extends StatefulWidget {
  final Color? color;

  const CustomNotificationContentTwo({super.key, this.color});

  @override
  State<CustomNotificationContentTwo> createState() => _CustomNotificationContentTwoState();
}

class _CustomNotificationContentTwoState extends State<CustomNotificationContentTwo> {
  bool isShowNotification = false;

  void onShowBasicNotification() {
    isShowNotification = !isShowNotification;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (isShowNotification) {
      return const SizedBox();
    } else {
      return MyCard(
        color: widget.color,
        margin: MySpacing.bottom(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(Images.logoDark, height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    MyText.labelSmall('11 min ago'),
                    MySpacing.width(12),
                    InkWell(onTap: onShowBasicNotification, child: const Icon(LucideIcons.x, size: 20)),
                  ],
                ),
              ],
            ),
            const Divider(height: 28),
            MyContainer(paddingAll: 8, child: MyText.bodySmall('Hello, world! This is a toast message.', fontWeight: 600, color: widget.color == null ? UiMixin.contentTheme.dark : UiMixin.contentTheme.onPrimary)),
          ],
        ),
      );
    }
  }
}
