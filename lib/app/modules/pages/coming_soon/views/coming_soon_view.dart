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
import '../../../../../views/layout/layout.dart';
import '../controllers/coming_soon_controller.dart';

class ComingSoonView extends GetView<ComingSoonController> {
  const ComingSoonView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: MySpacing.x(flexSpacing),
        child: GetBuilder<ComingSoonController>(
          builder: (ComingSoonController controller) {
            String formatDuration(int value) => value.toString().padLeft(2, '0');
            final String days = formatDuration(controller.myDuration.inDays);
            final String hours = formatDuration(controller.myDuration.inHours.remainder(24));
            final String minutes = formatDuration(controller.myDuration.inMinutes.remainder(60));
            final String seconds = formatDuration(controller.myDuration.inSeconds.remainder(60));
            return Center(
              child: MyFlex(
                children: <MyFlexItem>[
                  MyFlexItem(
                    sizes: 'lg-6',
                    child: MyCard(
                      paddingAll: 44,
                      shadow: MyShadow(elevation: 0.3, position: MyShadowPosition.center),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Image.asset(Images.logoDarkFull, height: 32),
                          MySpacing.height(52),
                          Column(
                            children: <Widget>[
                              MyText.titleLarge('WE ARE LAUNCHING SOON...', textAlign: TextAlign.center, fontWeight: 800, fontSize: 28),
                              MySpacing.height(32),
                              Padding(
                                padding: MySpacing.x(MediaQuery.of(context).size.width * 0.06),
                                child: MyText.bodyLarge("Exciting news is on the horizon! We're thrilled to announce that something incredible is coming your way very soon.", textAlign: TextAlign.center, muted: true, height: 1.5),
                              ),
                            ],
                          ),
                          MySpacing.height(52),
                          Wrap(
                            runAlignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            alignment: WrapAlignment.center,
                            children: <Widget>[_timerContainer(days, 'Days'), _timerContainer(hours, 'Hours'), _timerContainer(minutes, 'Minutes'), _timerContainer(seconds, 'Seconds')],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _timerContainer(String timing, String timeName) {
    return MyContainer(
      height: 100,
      width: 100,
      paddingAll: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MyText.titleLarge(timing, fontSize: 48, key: ValueKey<String>(timing), fontWeight: 700),
          MySpacing.height(12),
          MyText.bodyLarge(timeName, fontWeight: 700, muted: true),
        ],
      ),
    );
  }
}
