import 'package:flutter/material.dart';

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
import '../controllers/rating_controller.dart';

class RatingView extends GetView<RatingController> {
  const RatingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Center(
        child: Padding(
          padding: MySpacing.x(flexSpacing / 2),
          child: MyFlex(
            children: <MyFlexItem>[
              MyFlexItem(sizes: 'lg-8', child: basicRaterExample()),
              MyFlexItem(sizes: 'lg-8', child: raterWithStepExample()),
              MyFlexItem(sizes: 'lg-8', child: customMessagesExample()),
              MyFlexItem(sizes: 'lg-8', child: readOnlyExample()),
              MyFlexItem(sizes: 'lg-8', child: clearAndResetRaterExample()),
            ],
          ),
        ),
      ),
    );
  }

  Widget basicRaterExample() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Basic Rater Example', fontWeight: 600),
          MySpacing.height(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List<Widget>.generate(controller.starCount.value, (int index) {
              return Obx(
                () => MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => controller.updateRating(index + 1.0),
                    child: Icon(index < controller.rating.value ? Icons.star : Icons.star_border, size: 24, color: Colors.amber),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget raterWithStepExample() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Rater with Step Example', fontWeight: 600),
          MySpacing.height(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List<Widget>.generate(controller.raterWithStepExampleStarCount.value, (int index) {
              return Obx(
                () => GestureDetector(
                  onTap: () => controller.onRaterWithStep(index),
                  child: Icon(
                    index < controller.raterWithStepExampleRating.value.floor()
                        ? Icons.star
                        : index < controller.raterWithStepExampleRating.value
                        ? Icons.star_half
                        : Icons.star_border,
                    color: Colors.amber,
                    size: 24,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget customMessagesExample() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyText.titleMedium('Custom Messages Example', fontWeight: 600),
            MySpacing.height(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List<Widget>.generate(controller.totalStars.value, (int index) {
                return GestureDetector(
                  onTap: () => controller.handleRatingChange((index + 1).toDouble()),
                  child: Icon(
                    index < controller.currentRating.value.floor()
                        ? Icons.star
                        : index < controller.currentRating.value
                        ? Icons.star_half
                        : Icons.star_border,
                    color: Colors.amber,
                    size: 24,
                  ),
                );
              }),
            ),
            MySpacing.height(16),
            if (controller.statusMessage.value.isNotEmpty) MyText.bodySmall(controller.statusMessage.value, color: UiMixin.contentTheme.primary),
            if (controller.statusMessage.value.isNotEmpty) MySpacing.height(16),
            MyText.titleMedium('Current Rating: ${controller.currentRating.toStringAsFixed(1)}', fontWeight: 600),
          ],
        ),
      ),
    );
  }

  Widget readOnlyExample() {
    final int fullStarsCount = controller.ratingValue.toInt();
    final bool isHalfStarPresent = controller.ratingValue - fullStarsCount >= 0.5;
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('ReadOnly Example', fontWeight: 600),
          MySpacing.height(16),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List<Widget>.generate(controller.totalStarCount.value, (int index) {
              if (index < fullStarsCount) {
                return const Icon(Icons.star, color: Colors.amber, size: 22);
              } else if (index == fullStarsCount && isHalfStarPresent) {
                return const Icon(Icons.star_half, color: Colors.amber, size: 22);
              } else {
                return const Icon(Icons.star_border, color: Colors.amber, size: 22);
              }
            }),
          ),
        ],
      ),
    );
  }

  Widget clearAndResetRaterExample() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyText.titleMedium('Clear/Reset Rater Example', fontWeight: 600),
            MySpacing.height(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List<Widget>.generate(controller.totalStars.value, (int index) {
                return GestureDetector(
                  onTap: () => controller.handleStarTap(index),
                  child: Icon(Icons.star, color: index < controller.userRating.value ? Colors.amber : Colors.grey, size: 24),
                );
              }),
            ),
            MySpacing.height(16),
            MyText.bodyMedium('Rating: ${controller.userRating.toStringAsFixed(1)}', fontWeight: 600, color: UiMixin.contentTheme.primary),
            MySpacing.height(16),
            MyContainer(
              onTap: controller.resetUserRating,
              color: UiMixin.contentTheme.primary,
              paddingAll: 12,
              child: MyText.labelMedium('Reset Rating', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
            ),
          ],
        ),
      ),
    );
  }
}
