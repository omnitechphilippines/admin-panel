import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

import 'package:get/get.dart';

import '../../../../../helper/utils/my_shadow.dart';
import '../../../../../helper/widgets/my_button.dart';
import '../../../../../helper/widgets/my_card.dart';
import '../../../../../helper/widgets/my_container.dart';
import '../../../../../helper/widgets/my_flex.dart';
import '../../../../../helper/widgets/my_flex_item.dart';
import '../../../../../helper/widgets/my_spacing.dart';
import '../../../../../helper/widgets/my_text.dart';
import '../../../../../helper/widgets/responsive.dart';
import '../../../../../themes/app_theme.dart';
import '../../../../../themes/ui_mixin.dart';
import '../../../../../views/layout/layout.dart';
import '../controllers/modal_controller.dart';

class ModalView extends GetView<ModalController> {
  const ModalView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: MySpacing.x(flexSpacing / 2),
        child: Center(
          child: MyFlex(
            children: <MyFlexItem>[
              MyFlexItem(sizes: 'lg-8', child: defaultModals(context)),
              MyFlexItem(sizes: 'lg-8', child: staticBackdrop(context)),
              MyFlexItem(sizes: 'lg-8', child: scrollingLongContent(context)),
              MyFlexItem(sizes: 'lg-8', child: modalPosition(context)),
              MyFlexItem(sizes: 'lg-8', child: toggleBetweenModals(context)),
              MyFlexItem(sizes: 'lg-8', child: optionalSizes(context)),
              MyFlexItem(sizes: 'lg-8', child: modalBasedAlerts(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget defaultModals(BuildContext context) {
    void showModal() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: MySpacing.zero,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: MySpacing.all(20),
                  child: Row(
                    children: <Widget>[
                      Expanded(child: MyText.titleMedium('Modal Title', fontWeight: 600)),
                      InkWell(onTap: () => Get.back(), child: const Icon(LucideIcons.x)),
                    ],
                  ),
                ),
                const Divider(height: 0),
                Padding(padding: MySpacing.all(20), child: MyText.bodyMedium("Woo-hoo, you're reading this text in a modal!")),
                const Divider(height: 0),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Get.back(),
                child: MyText.bodyMedium('Close', fontWeight: 600, color: UiMixin.contentTheme.primary),
              ),
              TextButton(
                onPressed: () => Get.back(),
                child: MyText.bodyMedium('Save changes', fontWeight: 600, color: UiMixin.contentTheme.primary),
              ),
            ],
          );
        },
      );
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Default Modals', fontWeight: 600),
          MySpacing.height(16),
          MyContainer(
            onTap: () => showModal(),
            color: UiMixin.contentTheme.primary,
            paddingAll: 12,
            child: MyText.bodyMedium('Launch demo modal', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
          ),
        ],
      ),
    );
  }

  Widget staticBackdrop(BuildContext context) {
    Dialog staticModal() {
      return Dialog(
        child: SizedBox(
          width: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: MySpacing.all(16),
                child: Row(
                  children: <Widget>[
                    Expanded(child: MyText.labelLarge('Static Modal')),
                    InkWell(
                      onTap: () => Get.back(),
                      child: Icon(LucideIcons.x, size: 20, color: theme.colorScheme.onSurface.withValues(alpha: 0.5)),
                    ),
                  ],
                ),
              ),
              const Divider(height: 0, thickness: 1),
              Padding(padding: MySpacing.all(16), child: MyText.bodySmall(controller.dummyTexts[0])),
              const Divider(height: 0, thickness: 1),
              Padding(
                padding: MySpacing.xy(12, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    MyButton.rounded(
                      onPressed: () => Get.back(),
                      elevation: 0,
                      padding: MySpacing.all(12),
                      backgroundColor: UiMixin.contentTheme.secondary,
                      child: MyText.bodyMedium('Close', color: UiMixin.contentTheme.onSecondary),
                    ),
                    MySpacing.width(16),
                    MyButton.rounded(
                      onPressed: () => Get.back(),
                      elevation: 0,
                      padding: MySpacing.all(12),
                      backgroundColor: UiMixin.contentTheme.primary,
                      child: MyText.bodyMedium('Understood', color: UiMixin.contentTheme.onPrimary),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.bodyMedium('Static Backdrop', fontWeight: 600),
          MySpacing.height(16),
          MyContainer(
            onTap: () => showDialog(context: context, barrierDismissible: false, builder: (BuildContext context) => staticModal()),
            color: UiMixin.contentTheme.primary,
            paddingAll: 12,
            child: MyText.bodyMedium('Launch static background modal', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
          ),
        ],
      ),
    );
  }

  Widget scrollingLongContent(BuildContext context) {
    Dialog launchScrollableModal() {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 450, minWidth: 250),
          child: Column(
            children: <Widget>[
              modalHeading('Modal Title'),
              const SizedBox(height: 20),
              const Divider(height: 0),
              Expanded(
                child: Padding(
                  padding: MySpacing.all(20),
                  child: ListView(
                    children: <Widget>[
                      MyText.bodySmall(controller.dummyTexts[0], fontWeight: 600, muted: true),
                      MySpacing.height(20),
                      MyText.bodySmall(controller.dummyTexts[1], fontWeight: 600, muted: true),
                      MySpacing.height(500),
                      MyText.bodySmall(controller.dummyTexts[1], fontWeight: 600, muted: true),
                    ],
                  ),
                ),
              ),
              const Divider(height: 0),
              Padding(
                padding: MySpacing.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    MyContainer(
                      onTap: () => Get.back(),
                      color: UiMixin.contentTheme.secondary.withAlpha(36),
                      padding: MySpacing.xy(12, 8),
                      child: MyText.bodySmall('Close', fontWeight: 600, color: UiMixin.contentTheme.secondary),
                    ),
                    MySpacing.width(12),
                    MyContainer(
                      onTap: () => Get.back(),
                      color: UiMixin.contentTheme.primary,
                      padding: MySpacing.xy(12, 8),
                      child: MyText.bodySmall('Save Changes', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Scrolling Long Content', fontWeight: 600),
          MySpacing.height(16),
          MyContainer(
            onTap: () => showDialog(context: context, builder: (BuildContext context) => launchScrollableModal()),
            // onTap: () => showDialog(context: context, builder: (BuildContext context) => launchScrollableModal()),
            color: UiMixin.contentTheme.primary,
            paddingAll: 12,
            child: MyText.bodyMedium('Launch static background modal', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
          ),
        ],
      ),
    );
  }

  Widget modalPosition(BuildContext context) {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Modal Position', fontWeight: 600),
          MySpacing.height(16),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: <Widget>[
              MyContainer(
                onTap: () => showDialog(context: context, builder: (BuildContext context) => topModal()),
                color: UiMixin.contentTheme.primary,
                paddingAll: 12,
                child: MyText.bodyMedium('Top Modal', color: UiMixin.contentTheme.onPrimary, fontWeight: 600),
              ),
              MyContainer(
                onTap: () => showDialog(context: context, builder: (BuildContext context) => bottomModal()),
                color: UiMixin.contentTheme.primary,
                paddingAll: 12,
                child: MyText.bodyMedium('Bottom Modal', color: UiMixin.contentTheme.onPrimary, fontWeight: 600),
              ),
              MyContainer(
                onTap: () => showDialog(context: context, builder: (BuildContext context) => centerModal()),
                color: UiMixin.contentTheme.primary,
                paddingAll: 12,
                child: MyText.bodyMedium('Center Modal', color: UiMixin.contentTheme.onPrimary, fontWeight: 600),
              ),
              MyContainer(
                onTap: () => showDialog(context: context, builder: (BuildContext context) => rightModal(context)),
                color: UiMixin.contentTheme.primary,
                paddingAll: 12,
                child: MyText.bodyMedium('Right Modal', color: UiMixin.contentTheme.onPrimary, fontWeight: 600),
              ),
              MyContainer(
                onTap: () => showDialog(context: context, builder: (BuildContext context) => leftModal(context)),
                color: UiMixin.contentTheme.primary,
                paddingAll: 12,
                child: MyText.bodyMedium('Left Modal', color: UiMixin.contentTheme.onPrimary, fontWeight: 600),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Dialog topModal() {
    return Dialog(
      insetPadding: MySpacing.fromLTRB(0, 0, 0, Get.mediaQuery.size.height - 350),
      child: SizedBox(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(padding: MySpacing.all(16), child: MyText.labelLarge('Top Modal')),
            const Divider(height: 0, thickness: 1),
            Padding(
              padding: MySpacing.all(12),
              child: MyText.bodySmall(controller.dummyTexts[4], maxLines: 6, overflow: TextOverflow.ellipsis),
            ),
            const Divider(height: 0),
            Padding(
              padding: MySpacing.xy(16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  MyButton.rounded(
                    onPressed: () => Get.back(),
                    elevation: 0,
                    padding: MySpacing.xy(12, 8),
                    backgroundColor: theme.colorScheme.secondary.withAlpha(36),
                    child: MyText.bodySmall('Close', color: theme.colorScheme.secondary),
                  ),
                  MySpacing.width(16),
                  MyButton.rounded(
                    onPressed: () => Get.back(),
                    elevation: 0,
                    padding: MySpacing.xy(12, 8),
                    backgroundColor: theme.colorScheme.primary,
                    child: MyText.bodySmall('Save', color: theme.colorScheme.onPrimary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Dialog bottomModal() {
    return Dialog(
      insetPadding: MySpacing.fromLTRB(0, Get.mediaQuery.size.height - 350, 0, 0),
      child: SizedBox(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(padding: MySpacing.all(16), child: MyText.labelLarge('Bottom Modal')),
            const Divider(height: 0, thickness: 1),
            Padding(
              padding: MySpacing.all(16),
              child: MyText.bodySmall(controller.dummyTexts[3], maxLines: 6, overflow: TextOverflow.ellipsis),
            ),
            const Divider(height: 0),
            Padding(
              padding: MySpacing.xy(16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  MyButton.rounded(
                    onPressed: () => Get.back(),
                    elevation: 0,
                    padding: MySpacing.xy(12, 8),
                    backgroundColor: UiMixin.contentTheme.secondary.withAlpha(36),
                    child: MyText.bodySmall('Close', color: UiMixin.contentTheme.secondary),
                  ),
                  MySpacing.width(16),
                  MyButton.rounded(
                    onPressed: () => Get.back(),
                    elevation: 0,
                    padding: MySpacing.xy(12, 8),
                    backgroundColor: theme.colorScheme.primary,
                    child: MyText.bodySmall('Save', color: theme.colorScheme.onPrimary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Dialog centerModal() {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 450, minWidth: 250),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            modalHeading('Center Modal'),
            const Divider(height: 40),
            Padding(
              padding: MySpacing.nTop(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MyText.titleMedium('Text in Modal', fontWeight: 600),
                  MySpacing.height(20),
                  MyText.bodyMedium('Duis mollis, est non commodo luctus, nisi erat porttitor ligula.', fontWeight: 600, muted: true),
                  const Divider(height: 40),
                  MyText.bodyMedium('Overflowing text to show scroll behavior', fontWeight: 600),
                  MySpacing.height(12),
                  MyText.bodyMedium(controller.dummyTexts[0], maxLines: 3, fontWeight: 600, xMuted: true),
                  MySpacing.height(12),
                  MyText.bodyMedium(controller.dummyTexts[0], maxLines: 4, fontWeight: 600, xMuted: true),
                  MySpacing.height(12),
                  MyText.bodyMedium(controller.dummyTexts[0], maxLines: 4, fontWeight: 600, xMuted: true),
                ],
              ),
            ),
            const Divider(height: 0),
            Padding(
              padding: MySpacing.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  MyContainer(
                    onTap: () => Get.back(),
                    color: UiMixin.contentTheme.secondary.withAlpha(36),
                    padding: MySpacing.xy(12, 8),
                    child: MyText.bodySmall('Close', fontWeight: 600, color: UiMixin.contentTheme.secondary),
                  ),
                  MySpacing.width(12),
                  MyContainer(
                    onTap: () => Get.back(),
                    color: UiMixin.contentTheme.primary,
                    padding: MySpacing.xy(12, 8),
                    child: MyText.bodySmall('Save Changes', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Dialog rightModal(BuildContext context) {
    return Dialog(
      insetPadding: MySpacing.fromLTRB(Get.mediaQuery.size.width - 350, 0, 0, 0),
      child: SizedBox(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(padding: MySpacing.all(16), child: MyText.labelLarge('Right Modal')),
            const Divider(height: 0, thickness: 1),
            Padding(
              padding: MySpacing.all(16),
              child: MyText.bodySmall(controller.dummyTexts[2], maxLines: 6, overflow: TextOverflow.ellipsis),
            ),
            const Divider(height: 0, thickness: 1),
            Padding(
              padding: MySpacing.xy(16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  MyButton.rounded(
                    onPressed: () => Get.back(),
                    elevation: 0,
                    padding: MySpacing.xy(12, 8),
                    backgroundColor: UiMixin.contentTheme.secondary.withAlpha(36),
                    child: MyText.bodySmall('Close', color: UiMixin.contentTheme.secondary),
                  ),
                  MySpacing.width(16),
                  MyButton.rounded(
                    onPressed: () => Get.back(),
                    elevation: 0,
                    padding: MySpacing.xy(12, 8),
                    backgroundColor: UiMixin.contentTheme.primary,
                    child: MyText.bodySmall('Save', color: UiMixin.contentTheme.onPrimary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Dialog leftModal(BuildContext context) {
    return Dialog(
      insetPadding: MySpacing.fromLTRB(0, 0, Get.mediaQuery.size.width - 350, 0),
      child: SizedBox(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(padding: MySpacing.all(16), child: MyText.labelLarge('Left Modal')),
            const Divider(height: 0, thickness: 1),
            Padding(
              padding: MySpacing.all(16),
              child: MyText.bodySmall(controller.dummyTexts[5], maxLines: 6, overflow: TextOverflow.ellipsis),
            ),
            const Divider(height: 0, thickness: 1),
            Padding(
              padding: MySpacing.xy(16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  MyButton.rounded(
                    onPressed: () => Get.back(),
                    elevation: 0,
                    padding: MySpacing.xy(12, 8),
                    backgroundColor: UiMixin.contentTheme.secondary.withAlpha(36),
                    child: MyText.bodySmall('Close', color: UiMixin.contentTheme.secondary),
                  ),
                  MySpacing.width(16),
                  MyButton.rounded(
                    onPressed: () => Get.back(),
                    elevation: 0,
                    padding: MySpacing.xy(12, 8),
                    backgroundColor: UiMixin.contentTheme.primary,
                    child: MyText.bodySmall('Save', color: UiMixin.contentTheme.onPrimary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget toggleBetweenModals(BuildContext context) {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Toggle Between Modals', fontWeight: 600),
          MySpacing.height(16),
          MyContainer(
            onTap: () => showDialog(context: context, builder: (BuildContext context) => openFirstModal(context)),
            color: UiMixin.contentTheme.primary,
            paddingAll: 12,
            child: MyText.bodyMedium('Open first Modal', color: UiMixin.contentTheme.onPrimary, fontWeight: 600),
          ),
        ],
      ),
    );
  }

  Widget openSecondModal(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 500,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: MySpacing.all(16),
              child: Row(
                children: <Widget>[
                  const Expanded(
                    child: Text('Modal 2', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  InkWell(onTap: () => Get.back(), child: const Icon(Icons.close, size: 20)),
                ],
              ),
            ),
            const Divider(height: 0, thickness: 1),
            Padding(padding: MySpacing.all(20), child: const Text('Hide this modal and show the first with the button below.')),
            const Divider(height: 0, thickness: 1),
            Padding(
              padding: MySpacing.xy(12, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  MyContainer(
                    onTap: () => Get.back(),
                    color: UiMixin.contentTheme.secondary,
                    paddingAll: 8,
                    child: MyText.bodyMedium('Close', color: UiMixin.contentTheme.onPrimary, fontWeight: 600),
                  ),
                  MySpacing.width(16),
                  MyContainer(
                    onTap: () {
                      Get.back();
                      showDialog(context: context, builder: (BuildContext context) => openFirstModal(context));
                    },
                    paddingAll: 8,
                    color: UiMixin.contentTheme.primary,
                    child: MyText.bodyMedium('Open first modal', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget openFirstModal(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 500,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: MySpacing.all(16),
              child: Row(
                children: <Widget>[
                  Expanded(child: MyText.titleMedium('Modal 1', fontWeight: 600)),
                  InkWell(onTap: () => Get.back(), child: const Icon(Icons.close, size: 20)),
                ],
              ),
            ),
            const Divider(height: 0, thickness: 1),
            Padding(padding: MySpacing.all(20), child: const Text('Show a second modal and hide this one with the button below.')),
            const Divider(height: 0, thickness: 1),
            Padding(
              padding: MySpacing.xy(12, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  MyContainer(
                    onTap: () {
                      Get.back();
                      showDialog(context: context, builder: (BuildContext context) => openSecondModal(context));
                    },
                    paddingAll: 8,
                    color: UiMixin.contentTheme.primary,
                    child: MyText.bodyMedium('Open second modal', color: UiMixin.contentTheme.onPrimary, fontWeight: 600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget optionalSizes(BuildContext context) {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Optional Sizes', fontWeight: 600),
          MySpacing.height(16),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: <Widget>[
              MyContainer(
                onTap: () => showDialog(context: context, builder: (BuildContext context) => extraLargeModal()),
                color: UiMixin.contentTheme.primary,
                paddingAll: 12,
                child: MyText.bodyMedium('Extra large Modal', color: UiMixin.contentTheme.onPrimary, fontWeight: 600),
              ),
              MyContainer(
                onTap: () => showDialog(context: context, builder: (BuildContext context) => largeModal()),
                color: UiMixin.contentTheme.primary,
                paddingAll: 12,
                child: MyText.bodyMedium('Large Modal', color: UiMixin.contentTheme.onPrimary, fontWeight: 600),
              ),
              MyContainer(
                onTap: () => showDialog(context: context, builder: (BuildContext context) => smallModal()),
                color: UiMixin.contentTheme.primary,
                paddingAll: 12,
                child: MyText.bodyMedium('Small Modal', color: UiMixin.contentTheme.onPrimary, fontWeight: 600),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Dialog extraLargeModal() {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200, minWidth: 250),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            modalHeading('Extra Large Modal'),
            const Divider(),
            Padding(padding: MySpacing.nTop(20), child: MyText.bodyMedium('...')),
          ],
        ),
      ),
    );
  }

  Dialog largeModal() {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 700, minWidth: 250),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            modalHeading('Large Modal'),
            const Divider(),
            Padding(padding: MySpacing.nTop(20), child: MyText.bodyMedium('...')),
          ],
        ),
      ),
    );
  }

  Dialog smallModal() {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400, minWidth: 250),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            modalHeading('Small Modal'),
            const Divider(),
            Padding(padding: MySpacing.nTop(20), child: MyText.bodyMedium('...')),
          ],
        ),
      ),
    );
  }

  Widget modalBasedAlerts(BuildContext context) {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Modal Based Alerts', fontWeight: 600),
          MySpacing.height(16),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: <Widget>[
              MyContainer(
                onTap: () => showDialog(context: context, builder: (BuildContext context) => successModal()),
                color: UiMixin.contentTheme.success,
                paddingAll: 12,
                child: MyText.bodySmall('Success Alert', color: UiMixin.contentTheme.onPrimary, fontWeight: 600),
              ),
              MyContainer(
                onTap: () => showDialog(context: context, builder: (BuildContext context) => infoModal()),
                color: UiMixin.contentTheme.info,
                paddingAll: 12,
                child: MyText.bodySmall('Info Alert', color: UiMixin.contentTheme.onPrimary, fontWeight: 600),
              ),
              MyContainer(
                onTap: () => showDialog(context: context, builder: (BuildContext context) => warningModal()),
                color: UiMixin.contentTheme.warning,
                paddingAll: 12,
                child: MyText.bodySmall('Warning Alert', color: UiMixin.contentTheme.onPrimary, fontWeight: 600),
              ),
              MyContainer(
                onTap: () => showDialog(context: context, builder: (BuildContext context) => dangerModal()),
                color: UiMixin.contentTheme.danger,
                paddingAll: 12,
                child: MyText.bodySmall('Danger Alert', color: UiMixin.contentTheme.onPrimary, fontWeight: 600),
              ),
              MyContainer(
                onTap: () => showDialog(context: context, builder: (BuildContext context) => pinkModal()),
                color: UiMixin.contentTheme.pink,
                paddingAll: 12,
                child: MyText.bodySmall('Pink Alert', color: UiMixin.contentTheme.onPrimary, fontWeight: 600),
              ),
              MyContainer(
                onTap: () => showDialog(context: context, builder: (BuildContext context) => purpleModal()),
                color: UiMixin.contentTheme.purple,
                paddingAll: 12,
                child: MyText.bodySmall('Purple Alert', color: UiMixin.contentTheme.onPrimary, fontWeight: 600),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Dialog successModal() {
    return Dialog(
      backgroundColor: UiMixin.contentTheme.success,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 450, minWidth: 250),
        child: Padding(
          padding: MySpacing.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(LucideIcons.check_check, color: UiMixin.contentTheme.onSuccess, size: 44),
              MySpacing.height(20),
              MyText.bodyMedium('Well Done!', fontWeight: 600, color: UiMixin.contentTheme.onSuccess),
              MySpacing.height(20),
              MyText.bodySmall(controller.dummyTexts[1], maxLines: 4, fontWeight: 600, color: UiMixin.contentTheme.onSuccess),
              MySpacing.height(20),
              MyContainer(padding: MySpacing.xy(12, 8), onTap: () => Get.back(), child: MyText.bodySmall('Continue', fontWeight: 600)),
            ],
          ),
        ),
      ),
    );
  }

  Dialog infoModal() {
    return Dialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 450, minWidth: 250),
        child: Padding(
          padding: MySpacing.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(LucideIcons.circle_alert, color: UiMixin.contentTheme.info, size: 44),
              MySpacing.height(20),
              MyText.bodyMedium('Heads Up!', fontWeight: 600),
              MySpacing.height(20),
              MyText.bodySmall(controller.dummyTexts[1], maxLines: 4, fontWeight: 600, textAlign: TextAlign.center),
              MySpacing.height(20),
              MyContainer(
                onTap: () => Get.back(),
                padding: MySpacing.xy(12, 8),
                color: UiMixin.contentTheme.info,
                child: MyText.bodySmall('Continue', fontWeight: 600, color: UiMixin.contentTheme.onInfo),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Dialog warningModal() {
    return Dialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 450, minWidth: 250),
        child: Padding(
          padding: MySpacing.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(LucideIcons.triangle_alert, color: UiMixin.contentTheme.warning, size: 44),
              MySpacing.height(20),
              MyText.bodyMedium('Incorrect Information', fontWeight: 600),
              MySpacing.height(20),
              MyText.bodySmall(controller.dummyTexts[1], maxLines: 4, fontWeight: 600, textAlign: TextAlign.center),
              MySpacing.height(20),
              MyContainer(
                onTap: () => Get.back(),
                padding: MySpacing.xy(12, 8),
                color: UiMixin.contentTheme.warning,
                child: MyText.bodySmall('Continue', fontWeight: 600, color: UiMixin.contentTheme.onWarning),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Dialog dangerModal() {
    return Dialog(
      backgroundColor: UiMixin.contentTheme.danger,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 450, minWidth: 250),
        child: Padding(
          padding: MySpacing.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(LucideIcons.circle_x, color: UiMixin.contentTheme.onDanger, size: 44),
              MySpacing.height(20),
              MyText.bodyMedium('Oh Snap!', fontWeight: 600, color: UiMixin.contentTheme.onDanger),
              MySpacing.height(20),
              MyText.bodySmall(controller.dummyTexts[1], maxLines: 4, fontWeight: 600, color: UiMixin.contentTheme.onDanger),
              MySpacing.height(20),
              MyContainer(padding: MySpacing.xy(12, 8), onTap: () => Get.back(), child: MyText.bodySmall('Continue', fontWeight: 600)),
            ],
          ),
        ),
      ),
    );
  }

  Dialog pinkModal() {
    return Dialog(
      backgroundColor: UiMixin.contentTheme.pink,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 450, minWidth: 250),
        child: Padding(
          padding: MySpacing.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(LucideIcons.circle_x, color: UiMixin.contentTheme.onPink, size: 44),
              MySpacing.height(20),
              MyText.bodyMedium('Oh Snap!', fontWeight: 600, color: UiMixin.contentTheme.onPink),
              MySpacing.height(20),
              MyText.bodySmall(controller.dummyTexts[1], maxLines: 4, fontWeight: 600, color: UiMixin.contentTheme.onPink),
              MySpacing.height(20),
              MyContainer(padding: MySpacing.xy(12, 8), onTap: () => Get.back(), child: MyText.bodySmall('Continue', fontWeight: 600)),
            ],
          ),
        ),
      ),
    );
  }

  Dialog purpleModal() {
    return Dialog(
      backgroundColor: UiMixin.contentTheme.purple,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 450, minWidth: 250),
        child: Padding(
          padding: MySpacing.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(LucideIcons.circle_x, color: UiMixin.contentTheme.onPurple, size: 44),
              MySpacing.height(20),
              MyText.bodyMedium('Oh Snap!', fontWeight: 600, color: UiMixin.contentTheme.onPurple),
              MySpacing.height(20),
              MyText.bodySmall(controller.dummyTexts[1], maxLines: 4, fontWeight: 600, color: UiMixin.contentTheme.onPurple),
              MySpacing.height(20),
              MyContainer(padding: MySpacing.xy(12, 8), onTap: () => Get.back(), child: MyText.bodySmall('Continue', fontWeight: 600)),
            ],
          ),
        ),
      ),
    );
  }

  Widget modalHeading(String title) {
    return Padding(
      padding: MySpacing.nBottom(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          MyText.titleMedium(title, fontWeight: 600),
          InkWell(onTap: () => Get.back(), child: const Icon(LucideIcons.x)),
        ],
      ),
    );
  }
}
