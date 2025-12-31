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
import '../../../../../helper/widgets/responsive.dart';
import '../../../../../themes/ui_mixin.dart';
import '../../../../../views/layout/layout.dart';
import '../controllers/sweet_alert_controller.dart';

class SweetAlertView extends GetView<SweetAlertController> {
  const SweetAlertView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: MySpacing.x(flexSpacing / 2),
        child: Center(
          child: MyFlex(
            children: <MyFlexItem>[
              MyFlexItem(sizes: 'lg-8', child: basic(context)),
              MyFlexItem(sizes: 'lg-8', child: aTitleWithATextUnder(context)),
              MyFlexItem(sizes: 'lg-8', child: message(context)),
              MyFlexItem(sizes: 'lg-8', child: longContentImagesMessage(context)),
              MyFlexItem(sizes: 'lg-8', child: parameter(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget basic(BuildContext context) {
    void showSweetAlert() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: MyText.titleMedium('Any fool can use a computer', fontWeight: 600),
            actions: <Widget>[
              Center(
                child: MyContainer(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  color: UiMixin.contentTheme.primary,
                  paddingAll: 12,
                  child: MyText.labelMedium('OK', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
                ),
              ),
            ],
            actionsPadding: MySpacing.bottom(16),
            contentPadding: const EdgeInsets.all(16.0),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
          );
        },
      );
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Basic', fontWeight: 600),
          MySpacing.height(16),
          MyContainer(
            onTap: () => showSweetAlert(),
            color: UiMixin.contentTheme.primary,
            paddingAll: 12,
            child: MyText.bodyMedium('Click Me', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
          ),
        ],
      ),
    );
  }

  Widget aTitleWithATextUnder(BuildContext context) {
    void showSweetAlert() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Icon(Icons.help_outline, color: Colors.blue, size: 52),
                MySpacing.height(12),
                MyText.titleLarge('The Internet?', fontWeight: 600),
                MySpacing.height(12),
                MyText.titleMedium('That thing is still around?', fontWeight: 600),
              ],
            ),
            actions: <Widget>[
              Center(
                child: MyContainer(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  color: UiMixin.contentTheme.primary,
                  paddingAll: 12,
                  child: MyText.labelMedium('OK', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
                ),
              ),
            ],
            actionsPadding: MySpacing.bottom(16),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
            contentPadding: const EdgeInsets.all(16.0),
          );
        },
      );
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('A Title with a Text Under', fontWeight: 600),
          MySpacing.height(16),
          MyContainer(
            onTap: () => showSweetAlert(),
            color: UiMixin.contentTheme.primary,
            paddingAll: 12,
            child: MyText.bodyMedium('Click Me', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
          ),
        ],
      ),
    );
  }

  Widget message(BuildContext context) {
    void showSuccessAlert() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(LucideIcons.circle_check, color: UiMixin.contentTheme.success, size: 52),
                MySpacing.height(12),
                MyText.titleLarge('Good job!', fontWeight: 600),
                MySpacing.height(12),
                MyText.titleMedium('You clicked the button!', fontWeight: 600),
              ],
            ),
            actionsPadding: MySpacing.bottom(20),
            actionsAlignment: MainAxisAlignment.center,
            actions: <Widget>[
              MyContainer(
                onTap: () {
                  Navigator.of(context).pop();
                },
                color: UiMixin.contentTheme.primary,
                paddingAll: 12,
                child: MyText.labelMedium('OK', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
              ),
              MyContainer(
                onTap: () {
                  Navigator.of(context).pop();
                },
                color: UiMixin.contentTheme.danger,
                paddingAll: 12,
                child: MyText.labelMedium('Cancel', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
              ),
            ],
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
          );
        },
      );
    }

    void showWarningAlert() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(LucideIcons.triangle_alert, color: UiMixin.contentTheme.warning, size: 52),
                MySpacing.height(12),
                MyText.titleLarge('Oops...', fontWeight: 600),
                MyText.titleMedium('Something went wrong!', fontWeight: 600),
              ],
            ),
            actions: <Widget>[
              Center(
                child: MyContainer(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  color: UiMixin.contentTheme.primary,
                  paddingAll: 12,
                  child: MyText.labelMedium('OK', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
                ),
              ),
            ],
            actionsPadding: MySpacing.bottom(16),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
            contentPadding: const EdgeInsets.all(16.0),
          );
        },
      );
    }

    void showInfoAlert() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(LucideIcons.info, color: UiMixin.contentTheme.info, size: 52),
                MySpacing.height(12),
                MyText.titleLarge('Oops...', fontWeight: 600),
                MyText.titleMedium('Something went wrong!', fontWeight: 600),
              ],
            ),
            actions: <Widget>[
              Center(
                child: MyContainer(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  color: UiMixin.contentTheme.primary,
                  paddingAll: 12,
                  child: MyText.labelMedium('OK', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
                ),
              ),
            ],
            actionsPadding: MySpacing.bottom(16),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
            contentPadding: const EdgeInsets.all(16.0),
          );
        },
      );
    }

    void showErrorAlert() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(LucideIcons.x, color: UiMixin.contentTheme.danger, size: 52),
                MySpacing.height(12),
                MyText.titleLarge('Oops...', fontWeight: 600),
                MyText.titleMedium('Something went wrong!', fontWeight: 600),
              ],
            ),
            actions: <Widget>[
              Center(
                child: MyContainer(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  color: UiMixin.contentTheme.primary,
                  paddingAll: 12,
                  child: MyText.labelMedium('OK', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
                ),
              ),
            ],
            actionsPadding: MySpacing.bottom(16),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
            contentPadding: const EdgeInsets.all(16.0),
          );
        },
      );
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Message', fontWeight: 600),
          MySpacing.height(16),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: <Widget>[
              MyContainer(
                onTap: () => showSuccessAlert(),
                color: UiMixin.contentTheme.success,
                paddingAll: 12,
                child: MyText.bodyMedium('Success', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
              ),
              MyContainer(
                onTap: () => showWarningAlert(),
                color: UiMixin.contentTheme.warning,
                paddingAll: 12,
                child: MyText.bodyMedium('Warning', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
              ),
              MyContainer(
                onTap: () => showInfoAlert(),
                color: UiMixin.contentTheme.info,
                paddingAll: 12,
                child: MyText.bodyMedium('Info', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
              ),
              MyContainer(
                onTap: () => showErrorAlert(),
                color: UiMixin.contentTheme.danger,
                paddingAll: 12,
                child: MyText.bodyMedium('Error', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget longContentImagesMessage(BuildContext context) {
    void showCustomDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: SizedBox(
              height: 1600,
              width: 300,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 1500,
                    width: double.infinity,
                    child: Center(child: MyText.titleLarge('Scroll Down', fontWeight: 600)),
                  ),
                  Padding(
                    padding: MySpacing.all(16),
                    child: Center(
                      child: MyContainer(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        color: UiMixin.contentTheme.primary,
                        paddingAll: 12,
                        child: MyText.labelMedium('OK', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Long content Images Message', fontWeight: 600),
          MySpacing.height(16),
          MyContainer(
            onTap: () => showCustomDialog(),
            color: UiMixin.contentTheme.primary,
            paddingAll: 12,
            child: MyText.bodyMedium('Click Me', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
          ),
        ],
      ),
    );
  }

  Widget parameter(BuildContext context) {
    void showDeletedDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(LucideIcons.circle_check, size: 52, color: UiMixin.contentTheme.success),
                MySpacing.height(12),
                MyText.titleLarge('Deleted!', fontWeight: 600),
                MySpacing.height(12),
                MyText.titleMedium('Your file has been deleted.', fontWeight: 600),
              ],
            ),
            actions: <Widget>[
              Center(
                child: MyContainer(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  color: UiMixin.contentTheme.primary,
                  paddingAll: 12,
                  child: MyText.bodyMedium('OK', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
                ),
              ),
            ],
            actionsPadding: MySpacing.bottom(16),
          );
        },
      );
    }

    void showCancelledDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(LucideIcons.circle_x, size: 52, color: UiMixin.contentTheme.danger),
                MySpacing.height(16),
                MyText.titleLarge('Cancelled', fontWeight: 600),
                MySpacing.height(16),
                MyText.titleMedium('Your imaginary file is safe :)', fontWeight: 600),
              ],
            ),
            actions: <Widget>[
              Center(
                child: MyContainer(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  color: UiMixin.contentTheme.primary,
                  paddingAll: 12,
                  child: MyText.bodyMedium('OK', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
                ),
              ),
            ],
            actionsPadding: MySpacing.bottom(16),
          );
        },
      );
    }

    void showConfirmationDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(LucideIcons.info, size: 52, color: UiMixin.contentTheme.warning),
                MySpacing.height(16),
                MyText.titleLarge('Are you sure?', fontWeight: 600),
                MySpacing.height(16),
                MyText.titleMedium("You won't be able to revert this!", fontWeight: 600),
              ],
            ),
            actions: <Widget>[
              MyContainer(
                onTap: () {
                  Navigator.of(context).pop();
                  showCancelledDialog();
                },
                color: UiMixin.contentTheme.danger,
                paddingAll: 12,
                child: MyText.bodyMedium('No, cancel!', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
              ),
              MyContainer(
                onTap: () {
                  Navigator.of(context).pop();
                  showDeletedDialog();
                },
                color: UiMixin.contentTheme.primary,
                paddingAll: 12,
                child: MyText.bodyMedium('Yes, delete it!', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
              ),
            ],
            actionsPadding: MySpacing.all(16),
          );
        },
      );
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Parameter', fontWeight: 600),
          MySpacing.height(16),
          MyContainer(
            onTap: () => showConfirmationDialog(),
            color: UiMixin.contentTheme.primary,
            paddingAll: 12,
            child: MyText.bodyMedium('Click Me', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
          ),
        ],
      ),
    );
  }
}
