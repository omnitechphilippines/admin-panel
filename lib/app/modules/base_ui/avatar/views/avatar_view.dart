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
import '../../../../../images.dart';
import '../../../../../themes/ui_mixin.dart';
import '../../../../../views/layout/layout.dart';
import '../controllers/avatar_controller.dart';

class AvatarView extends GetView<AvatarController> {
  const AvatarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: MySpacing.x(flexSpacing / 2),
        child: Center(
          child: MyFlex(
            children: <MyFlexItem>[
              MyFlexItem(sizes: 'lg-8', child: basicExample()),
              MyFlexItem(sizes: 'lg-8', child: roundedCircle()),
              MyFlexItem(sizes: 'lg-8', child: imagesShapes()),
            ],
          ),
        ),
      ),
    );
  }

  Widget basicExample() {
    Widget imageWidget(double size, String image, String imageSizeName) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyContainer(
            height: size,
            width: size,
            borderRadiusAll: 4,
            paddingAll: 0,
            clipBehavior: Clip.antiAlias,
            child: Image.asset(image, fit: BoxFit.cover),
          ),
          MySpacing.height(4),
          MyText.bodySmall(imageSizeName, muted: true, color: UiMixin.contentTheme.pink),
        ],
      );
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Basic Example', fontWeight: 600),
          MySpacing.height(16),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            children: <Widget>[
              imageWidget(32, Images.avatars[1], '.avatar.xs'),
              imageWidget(48, Images.avatars[2], '.avatar.sm'),
              imageWidget(68, Images.avatars[3], '.avatar.md'),
              imageWidget(88, Images.avatars[4], '.avatar.lg'),
              imageWidget(110, Images.avatars[5], '.avatar.xl'),
            ],
          ),
        ],
      ),
    );
  }

  Widget roundedCircle() {
    Widget roundedWidget(double size, String image, String imageSizeName) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyContainer.rounded(
            height: size,
            width: size,
            paddingAll: 0,
            clipBehavior: Clip.antiAlias,
            child: Image.asset(image, fit: BoxFit.cover),
          ),
          MySpacing.height(4),
          MyText.bodySmall(imageSizeName, muted: true, color: UiMixin.contentTheme.pink),
        ],
      );
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Rounded Circle', fontWeight: 600),
          MySpacing.height(16),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            children: <Widget>[roundedWidget(68, Images.avatars[6], '.avatar-md .rounded-circle'), roundedWidget(88, Images.avatars[7], '.avatar-lg .rounded-circle'), roundedWidget(110, Images.avatars[8], '.avatar-xl .rounded-circle')],
          ),
        ],
      ),
    );
  }

  Widget imagesShapes() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Images Shapes', fontWeight: 600),
          MySpacing.height(16),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MyContainer(
                    height: 100,
                    width: 200,
                    paddingAll: 0,
                    borderRadiusAll: 4,
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(Images.small[1], fit: BoxFit.cover),
                  ),
                  MySpacing.height(4),
                  MyText.bodySmall('.rounded', muted: true, color: UiMixin.contentTheme.pink),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MyContainer(
                    height: 100,
                    width: 100,
                    paddingAll: 0,
                    borderRadiusAll: 4,
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(Images.avatars[5], fit: BoxFit.cover),
                  ),
                  MySpacing.height(4),
                  MyText.bodySmall('.rounded', muted: true, color: UiMixin.contentTheme.pink),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MyContainer.rounded(
                    height: 100,
                    width: 100,
                    paddingAll: 0,
                    borderRadiusAll: 4,
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(Images.avatars[6], fit: BoxFit.cover),
                  ),
                  MySpacing.height(4),
                  MyText.bodySmall('.rounded-circle', muted: true, color: UiMixin.contentTheme.pink),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MyContainer.bordered(
                    paddingAll: 4,
                    borderRadiusAll: 4,
                    child: MyContainer(
                      height: 100,
                      width: 200,
                      paddingAll: 0,
                      borderRadiusAll: 4,
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(Images.small[3], fit: BoxFit.cover),
                    ),
                  ),
                  MySpacing.height(4),
                  MyText.bodySmall('.img-thumbnail', muted: true, color: UiMixin.contentTheme.pink),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MyContainer.roundBordered(
                    paddingAll: 4,
                    borderRadiusAll: 4,
                    child: MyContainer.rounded(
                      height: 100,
                      width: 100,
                      paddingAll: 0,
                      borderRadiusAll: 4,
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(Images.avatars[7], fit: BoxFit.fill),
                    ),
                  ),
                  MySpacing.height(4),
                  MyText.bodySmall('.rounded-circle .img-thumbnail', muted: true, color: UiMixin.contentTheme.pink),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
