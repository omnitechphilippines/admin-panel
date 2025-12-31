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
import '../controllers/slider_controller.dart';

class SliderView extends GetView<SliderController> {
  const SliderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: MySpacing.x(flexSpacing / 2),
        child: Center(
          child: GetBuilder<SliderController>(
            builder: (_) => MyFlex(
              children: <MyFlexItem>[
                MyFlexItem(sizes: 'lg-8', child: basicRangeSlider()),
                MyFlexItem(sizes: 'lg-8', child: verticalRangeSlider()),
                MyFlexItem(sizes: 'lg-8', child: multiElementsRange()),
                MyFlexItem(sizes: 'lg-8', child: colorPicker()),
                MyFlexItem(sizes: 'lg-8', child: valueRangeSlider()),
                MyFlexItem(sizes: 'lg-8', child: lockingSlidersTogether()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget basicRangeSlider() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Basic Range Slider', fontWeight: 600),
          MySpacing.height(16),
          MyText.labelMedium('Value: ${controller.sliderValue.value.toInt()}', fontWeight: 600),
          MySpacing.height(8),
          Slider(
            padding: MySpacing.zero,
            value: controller.sliderValue.value,
            min: controller.minValue.value,
            max: controller.maxValue.value,
            divisions: (controller.maxValue.value - controller.minValue.value).toInt(),
            onChanged: (double value) => controller.updateSlider(value),
          ),
        ],
      ),
    );
  }

  Widget verticalRangeSlider() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Vertical Range Slider', fontWeight: 600),
          MySpacing.height(16),
          Text('Start Value: ${controller.startValue.value.toInt()}'),
          Text('End Value: ${controller.endValue.value.toInt()}'),
          SizedBox(
            height: 200,
            width: 50,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: RangeSlider(values: RangeValues(controller.startValue.value, controller.endValue.value), min: 0, max: 100, onChanged: (RangeValues values) => controller.updateVerticalSlider(values)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget multiElementsRange() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Multi Elements Range', fontWeight: 600),
          MySpacing.height(16),
          RangeSlider(
            values: controller.multiElementValues,
            min: 0,
            max: 100,
            divisions: 100,
            onChanged: (RangeValues values) {
              controller.updateRangeValue(values);
              controller.update();
            },
          ),
        ],
      ),
    );
  }

  Widget colorPicker() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Color Picker', fontWeight: 600),
          MySpacing.height(16),
          MyContainer.bordered(
            width: 200,
            height: 150,
            color: controller.currentColor,
            borderColor: UiMixin.contentTheme.dark,
            child: Center(
              child: Text('rgb(${controller.red.toInt()}, ${controller.green.toInt()}, ${controller.blue.toInt()})', style: TextStyle(color: controller.currentColor.computeLuminance() > 0.5 ? Colors.black : Colors.white, fontSize: 16)),
            ),
          ),
          MySpacing.height(16),
          Slider(value: controller.red.value, min: 0, max: 255, onChanged: (double value) => controller.updateRedColor(value)),
          MyText.labelMedium('Red: ${controller.red.value.toInt()}', fontWeight: 600),
          Slider(value: controller.green.value, min: 0, max: 255, onChanged: (double value) => controller.updateGreenColor(value)),
          MyText.labelMedium('Green: ${controller.green.value.toInt()}', fontWeight: 600),
          Slider(value: controller.blue.value, min: 0, max: 255, onChanged: (double value) => controller.updateBlueColor(value)),
          MyText.labelMedium('Blue: ${controller.blue.value.toInt()}', fontWeight: 600),
        ],
      ),
    );
  }

  Widget valueRangeSlider() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Value Range Slider', fontWeight: 600),
          MySpacing.height(16),
          SizedBox(
            width: 300,
            child: RangeSlider(values: controller.currentRangeValues, min: 0, max: 1, divisions: 100, onChanged: (RangeValues values) => controller.updateValueRange(values)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MyText.labelMedium('Lower Value: ${controller.lowerValueText.value} (${controller.lowerPositionText.value})', fontWeight: 600),
              MyText.labelMedium('Upper Value: ${controller.upperValueText.value} (${controller.upperPositionText.value})', fontWeight: 600),
            ],
          ),
        ],
      ),
    );
  }

  Widget lockingSlidersTogether() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Locking Sliders Together', fontWeight: 600),
          MySpacing.height(16),
          Slider(value: controller.slider1Value.value, min: 50, max: 100, onChanged: (double value) => controller.updateLockingSliders1(value)),
          MyText.labelMedium('Slider 1 Value: ${controller.slider1Value.value.toStringAsFixed(0)}', fontWeight: 600),
          MySpacing.height(16),
          Slider(value: controller.slider2Value.value, min: 50, max: 100, onChanged: (double value) => controller.updateLockingSliders2(value)),
          MyText.labelMedium('Slider 2 Value: ${controller.slider2Value.value.toStringAsFixed(0)}', fontWeight: 600),
          MySpacing.height(16),
          MyContainer(
            onTap: controller.toggleLock,
            paddingAll: 12,
            color: UiMixin.contentTheme.primary,
            child: MyText.labelMedium(controller.lockedState.value ? 'Unlock' : 'Lock', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
          ),
        ],
      ),
    );
  }
}
