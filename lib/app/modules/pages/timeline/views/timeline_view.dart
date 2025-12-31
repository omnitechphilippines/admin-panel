import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:timelines_plus/timelines_plus.dart';

import '../../../../../helper/utils/my_shadow.dart';
import '../../../../../helper/widgets/my_card.dart';
import '../../../../../helper/widgets/my_spacing.dart';
import '../../../../../helper/widgets/my_text.dart';
import '../../../../../helper/widgets/responsive.dart';
import '../../../../../views/layout/layout.dart';
import '../controllers/timeline_controller.dart';

class TimelineView extends GetView<TimelineController> {
  const TimelineView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: MySpacing.x(flexSpacing),
        child: Obx(
          () => Expanded(
            child: Timeline.tileBuilder(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shrinkWrap: true,
              builder: TimelineTileBuilder.fromStyle(
                itemCount: controller.timeLineData.length,
                contentsAlign: ContentsAlign.alternating,
                connectorStyle: ConnectorStyle.dashedLine,
                endConnectorStyle: ConnectorStyle.dashedLine,
                contentsBuilder: (BuildContext context, int index) {
                  final Map<String, Object> timeLine = controller.timeLineData[index];
                  return MyCard(
                    marginAll: 20,
                    shadow: MyShadow(elevation: 0.2),
                    paddingAll: 24,
                    child: Column(
                      crossAxisAlignment: index % 2 == 0 ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                      children: <Widget>[
                        MyText.titleMedium(timeLine['title'] as String, fontWeight: 600, overflow: TextOverflow.ellipsis),
                        MySpacing.height(12),
                        MyText.bodyMedium(timeLine['description'] as String, fontWeight: 600, xMuted: true, textAlign: index % 2 == 0 ? TextAlign.start : TextAlign.end),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
