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
import '../../../../../themes/ui_mixin.dart';
import '../../../../../views/layout/layout.dart';
import '../controllers/pagination_controller.dart';

class PaginationView extends GetView<PaginationController> {
  const PaginationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Layout(
        child: Padding(
          padding: MySpacing.x(flexSpacing / 2),
          child: Center(
            child: MyFlex(
              children: <MyFlexItem>[
                MyFlexItem(sizes: 'lg-8', child: defaultButtons()),
                MyFlexItem(sizes: 'lg-8', child: roundedPagination()),
                MyFlexItem(sizes: 'lg-8', child: sizing()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget defaultButtons() {
    Widget buildPageButton(int pageNumber) {
      return MyContainer.bordered(
        onTap: () => controller.currentPage.value = pageNumber,
        borderRadiusAll: 0,
        paddingAll: 12,
        border: Border(
          right: BorderSide(color: Colors.black.withValues(alpha: 0.2)),
          left: BorderSide(color: Colors.black.withValues(alpha: 0.2)),
        ),
        color: controller.currentPage.value == pageNumber ? UiMixin.contentTheme.primary : null,
        child: MyText.bodyMedium('$pageNumber', fontWeight: controller.currentPage.value == pageNumber ? 600 : 500, color: controller.currentPage.value == pageNumber ? UiMixin.contentTheme.onPrimary : null),
      );
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Default Buttons', fontWeight: 600),
          MySpacing.height(16),
          MyContainer.bordered(
            paddingAll: 0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: MySpacing.x(12),
                  child: InkWell(onTap: controller.goToPreviousPage, child: MyText.labelMedium('Previous', fontWeight: 600)),
                ),
                buildPageButton(1),
                buildPageButton(2),
                buildPageButton(3),
                Padding(
                  padding: MySpacing.x(12),
                  child: InkWell(onTap: controller.goToNextPage, child: MyText.labelMedium('Next', fontWeight: 600)),
                ),
              ],
            ),
          ),
          MySpacing.height(16),
          MyContainer.bordered(
            paddingAll: 0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(icon: const Icon(Icons.arrow_left), onPressed: controller.goToPreviousPage, tooltip: 'Previous'),
                buildPageButton(1),
                buildPageButton(2),
                buildPageButton(3),
                IconButton(icon: const Icon(Icons.arrow_right), onPressed: controller.goToNextPage, tooltip: 'Next'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget roundedPagination() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          MyText.titleMedium('Rounded Pagination', fontWeight: 600),
          MySpacing.height(16),
          Wrap(
            children: <Widget>[
              IconButton(icon: const Icon(LucideIcons.chevrons_left, size: 18), onPressed: () => controller.roundedPagination > 1 ? controller.goToRoundPagination(controller.roundedPagination.value - 1) : null),
              for (int i = 1; i <= 5; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: MyContainer(
                    height: 32,
                    width: 32,
                    paddingAll: 0,
                    color: i == controller.roundedPagination.value ? UiMixin.contentTheme.primary : null,
                    borderRadiusAll: 100,
                    onTap: () => controller.goToRoundPagination(i),
                    child: Center(child: MyText.bodySmall('$i', muted: true, color: i == controller.roundedPagination.value ? UiMixin.contentTheme.onPrimary : null)),
                  ),
                ),
              IconButton(
                icon: const Icon(LucideIcons.chevrons_right, size: 18),
                onPressed: () {
                  controller.roundedPagination.value < 5 ? controller.goToRoundPagination(controller.roundedPagination.value + 1) : null;
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget sizing() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Sizing', fontWeight: 600),
          MySpacing.height(16),
          MyContainer.bordered(
            paddingAll: 12,
            child: Wrap(
              children: <Widget>[
                IconButton(icon: const Icon(LucideIcons.chevrons_left, size: 18), onPressed: () {}),
                for (int i = 1; i <= 5; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: MyButton(
                      backgroundColor: i == 2 ? UiMixin.contentTheme.primary : UiMixin.contentTheme.secondary.withAlpha(36),
                      elevation: 0,
                      padding: MySpacing.all(20),
                      borderRadiusAll: 4,
                      onPressed: () {},
                      child: MyText.bodyMedium('$i', fontWeight: 600, color: i == 2 ? UiMixin.contentTheme.onPrimary : null),
                    ),
                  ),
                IconButton(icon: const Icon(LucideIcons.chevrons_right, size: 18), onPressed: () {}),
              ],
            ),
          ),
          MySpacing.height(20),
          MyContainer.bordered(
            paddingAll: 4,
            child: Wrap(
              children: <Widget>[
                IconButton(icon: const Icon(LucideIcons.chevrons_left, size: 18), onPressed: () {}),
                for (int i = 1; i <= 5; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: MyButton(
                      backgroundColor: i == 2 ? UiMixin.contentTheme.primary : UiMixin.contentTheme.secondary.withAlpha(36),
                      elevation: 0,
                      padding: MySpacing.all(4),
                      borderRadiusAll: 4,
                      onPressed: () {},
                      child: MyText.bodySmall('$i', fontWeight: 600, color: i == 2 ? UiMixin.contentTheme.onPrimary : null),
                    ),
                  ),
                IconButton(icon: const Icon(LucideIcons.chevrons_right, size: 18), onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
