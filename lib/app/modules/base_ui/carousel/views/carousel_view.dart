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
import '../../../../../images.dart';
import '../../../../../themes/ui_mixin.dart';
import '../../../../../views/layout/layout.dart';
import '../controllers/carousel_controller.dart' as carousel;

class CarouselView extends GetView<carousel.CarouselController> {
  const CarouselView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Center(
        child: Padding(
          padding: MySpacing.x(flexSpacing / 2),
          child: MyFlex(
            children: <MyFlexItem>[
              MyFlexItem(sizes: 'lg-8', child: slidesOnly()),
              MyFlexItem(sizes: 'lg-8', child: withControls()),
              MyFlexItem(sizes: 'lg-8', child: withIndicators()),
              MyFlexItem(sizes: 'lg-8', child: withCaptions()),
              MyFlexItem(sizes: 'lg-8', child: crossFade()),
              MyFlexItem(sizes: 'lg-8', child: darkVariation()),
            ],
          ),
        ),
      ),
    );
  }

  Widget slidesOnly() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Slides Only', fontWeight: 600),
          MySpacing.height(16),
          SizedBox(
            height: 350,
            child: PageView(
              pageSnapping: true,
              scrollBehavior: const MaterialScrollBehavior(),
              controller: controller.simplePageController,
              onPageChanged: controller.onChangeSimpleCarousel,
              children: <Widget>[
                MyContainer(
                  borderRadiusAll: 8,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  paddingAll: 0,
                  child: Image.asset(Images.small[0], fit: BoxFit.cover),
                ),
                MyContainer(
                  borderRadiusAll: 8,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  paddingAll: 0,
                  child: Image.asset(Images.small[1], fit: BoxFit.cover),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget withControls() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('With Controls', fontWeight: 600),
          MySpacing.height(16),
          Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              SizedBox(
                height: 350,
                child: PageView(
                  pageSnapping: true,
                  scrollBehavior: const MaterialScrollBehavior(),
                  physics: const ClampingScrollPhysics(),
                  controller: controller.pageControls,
                  onPageChanged: controller.onChangeCarousel,
                  children: <Widget>[
                    MyContainer(
                      borderRadiusAll: 8,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      paddingAll: 0,
                      child: Image.asset(Images.small[0], fit: BoxFit.cover),
                    ),
                    MyContainer(
                      borderRadiusAll: 8,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      paddingAll: 0,
                      child: Image.asset(Images.small[1], fit: BoxFit.cover),
                    ),
                    MyContainer(
                      borderRadiusAll: 8,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      paddingAll: 0,
                      child: Image.asset(Images.small[2], fit: BoxFit.cover),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 12,
                child: InkWell(onTap: () => controller.onChangePreviewControls(), child: const Icon(LucideIcons.chevron_left)),
              ),
              Positioned(
                right: 12,
                child: InkWell(onTap: () => controller.onChangeNextControls(), child: const Icon(LucideIcons.chevron_right)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget withIndicators() {
    List<Widget> buildPageIndicatorStatic() {
      final List<Widget> list = <Widget>[];
      for (int i = 0; i < controller.withIndicatorsSize.value; i++) {
        list.add(i == controller.selectedWithIndicator.value ? indicator(true) : indicator(false));
      }
      return list;
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('With Indicators', fontWeight: 600),
          MySpacing.height(16),
          Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              SizedBox(
                height: 400,
                child: PageView(
                  pageSnapping: true,
                  scrollBehavior: const MaterialScrollBehavior(),
                  physics: const ClampingScrollPhysics(),
                  controller: controller.indicatorControl,
                  onPageChanged: controller.onChangeIndicatorCarousel,
                  children: <Widget>[
                    MyContainer(
                      borderRadiusAll: 8,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      paddingAll: 0,
                      child: Image.asset(Images.small[0], fit: BoxFit.cover),
                    ),
                    MyContainer(
                      borderRadiusAll: 8,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      paddingAll: 0,
                      child: Image.asset(Images.small[1], fit: BoxFit.cover),
                    ),
                    MyContainer(
                      borderRadiusAll: 8,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      paddingAll: 0,
                      child: Image.asset(Images.small[2], fit: BoxFit.cover),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 12,
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: buildPageIndicatorStatic()),
              ),
              Positioned(
                left: 12,
                child: InkWell(onTap: () => controller.onChangePreviewIndicatorControls(), child: const Icon(LucideIcons.chevron_left)),
              ),
              Positioned(
                right: 12,
                child: InkWell(onTap: () => controller.onChangeNextIndicatorControls(), child: const Icon(LucideIcons.chevron_right)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget withCaptions() {
    List<Widget> buildPageIndicatorStatic() {
      final List<Widget> list = <Widget>[];
      for (int i = 0; i < controller.withCaptionSize.value; i++) {
        list.add(i == controller.withCaptionCarousel.value ? indicator(true) : indicator(false));
      }
      return list;
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('With Captions', fontWeight: 600),
          MySpacing.height(16),
          Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              SizedBox(
                height: 400,
                child: PageView(
                  pageSnapping: true,
                  scrollBehavior: const MaterialScrollBehavior(),
                  physics: const ClampingScrollPhysics(),
                  controller: controller.captionCarousel,
                  onPageChanged: controller.onChangeCaptionCarousel,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        MyContainer(
                          paddingAll: 0,
                          borderRadiusAll: 8,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image.asset(Images.small[0], fit: BoxFit.cover, height: 400, width: double.infinity),
                        ),
                        MyContainer(
                          borderRadiusAll: 8,
                          paddingAll: 12,
                          color: UiMixin.contentTheme.dark.withAlpha(150),
                          height: 400,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Center(
                            child: MyText.bodySmall(controller.dummyTexts[4], maxLines: 2, overflow: TextOverflow.ellipsis, color: UiMixin.contentTheme.light, fontWeight: 600),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: <Widget>[
                        MyContainer(
                          paddingAll: 0,
                          borderRadiusAll: 8,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image.asset(Images.small[1], fit: BoxFit.cover, height: 400, width: double.infinity),
                        ),
                        MyContainer(
                          borderRadiusAll: 8,
                          paddingAll: 12,
                          color: UiMixin.contentTheme.dark.withAlpha(150),
                          height: 400,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Center(
                            child: MyText.bodySmall(controller.dummyTexts[5], maxLines: 2, overflow: TextOverflow.ellipsis, color: UiMixin.contentTheme.light, fontWeight: 600),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: <Widget>[
                        MyContainer(
                          paddingAll: 0,
                          borderRadiusAll: 8,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image.asset(Images.small[2], fit: BoxFit.cover, height: 400, width: double.infinity),
                        ),
                        MyContainer(
                          borderRadiusAll: 8,
                          paddingAll: 12,
                          color: UiMixin.contentTheme.dark.withAlpha(150),
                          height: 400,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Center(
                            child: MyText.bodySmall(controller.dummyTexts[6], maxLines: 2, overflow: TextOverflow.ellipsis, color: UiMixin.contentTheme.light, fontWeight: 600),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: buildPageIndicatorStatic()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget crossFade() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Cross Fade', fontWeight: 600),
          MySpacing.height(16),
          Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              SizedBox(
                height: 400,
                child: PageView(
                  pageSnapping: true,
                  scrollBehavior: const MaterialScrollBehavior(),
                  physics: const ClampingScrollPhysics(),
                  controller: controller.crossFade,
                  onPageChanged: controller.onChangeCrossFade,
                  children: <Widget>[
                    MyContainer(
                      borderRadiusAll: 8,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      paddingAll: 0,
                      child: Image.asset(Images.small[0], fit: BoxFit.cover),
                    ),
                    MyContainer(
                      borderRadiusAll: 8,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      paddingAll: 0,
                      child: Image.asset(Images.small[1], fit: BoxFit.cover),
                    ),
                    MyContainer(
                      borderRadiusAll: 8,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      paddingAll: 0,
                      child: Image.asset(Images.small[2], fit: BoxFit.cover),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 12,
                child: InkWell(onTap: () => controller.onChangePreviewCrossFadeControls(), child: const Icon(LucideIcons.chevron_left)),
              ),
              Positioned(
                right: 12,
                child: InkWell(onTap: () => controller.onChangeNextCrossFadeControls(), child: const Icon(LucideIcons.chevron_right)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget darkVariation() {
    List<Widget> buildPageIndicatorStatic() {
      final List<Widget> list = <Widget>[];
      for (int i = 0; i < controller.withDarkVariantSize.value; i++) {
        list.add(
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInToLinear,
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            height: 8.0,
            width: 8,
            decoration: BoxDecoration(color: i == controller.withDarkVariantSize.value ? Colors.black : Colors.black.withAlpha(140), borderRadius: const BorderRadius.all(Radius.circular(4))),
          ),
        );
      }
      return list;
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Dark Variation', fontWeight: 600),
          MySpacing.height(16),
          Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              SizedBox(
                height: 400,
                child: PageView(
                  pageSnapping: true,
                  scrollBehavior: const MaterialScrollBehavior(),
                  physics: const ClampingScrollPhysics(),
                  controller: controller.darkVariant,
                  onPageChanged: controller.onChangeDarkVariantCarousel,
                  children: <Widget>[
                    MyContainer(
                      borderRadiusAll: 8,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      paddingAll: 0,
                      child: Image.asset(Images.small[4], fit: BoxFit.fill),
                    ),
                    MyContainer(
                      borderRadiusAll: 8,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      paddingAll: 0,
                      child: Image.asset(Images.small[5], fit: BoxFit.fill),
                    ),
                    MyContainer(
                      borderRadiusAll: 8,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      paddingAll: 0,
                      child: Image.asset(Images.small[6], fit: BoxFit.fill),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: buildPageIndicatorStatic()),
              ),
              Positioned(
                left: 12,
                child: InkWell(
                  onTap: () => controller.onChangePreviewDarkVariant(),
                  child: const Icon(LucideIcons.chevron_left, color: Colors.black),
                ),
              ),
              Positioned(
                right: 12,
                child: InkWell(
                  onTap: () => controller.onChangeNextDarkVariant(),
                  child: const Icon(LucideIcons.chevron_right, color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInToLinear,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: 8,
      decoration: BoxDecoration(color: isActive ? Colors.white : Colors.white.withAlpha(140), borderRadius: const BorderRadius.all(Radius.circular(4))),
    );
  }
}
