import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../helper/utils/my_shadow.dart';
import '../../../../../helper/widgets/my_card.dart';
import '../../../../../helper/widgets/my_spacing.dart';
import '../../../../../helper/widgets/my_text.dart';
import '../../../../../helper/widgets/responsive.dart';
import '../../../../../views/layout/layout.dart';
import '../../../../data/models/integration_model.dart';
import '../controllers/integration_controller.dart';

class IntegrationView extends GetView<IntegrationController> {
  const IntegrationView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<IntegrationController>(
      builder: (IntegrationController controller) => Layout(
        child: Padding(
          padding: MySpacing.x(flexSpacing),
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 400, crossAxisSpacing: 16, mainAxisSpacing: 16, mainAxisExtent: 160),
            itemCount: controller.calendarIntegration.length,
            itemBuilder: (BuildContext context, int index) {
              final CalendarIntegrationModel integration = controller.calendarIntegration[index];
              return MyCard(
                shadow: MyShadow(elevation: 0.3, position: MyShadowPosition.center),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Image.asset(integration.imageUrl, height: 44, width: 44),
                        Switch(
                          value: integration.isChecked,
                          onChanged: (bool value) {
                            integration.onToggleSwitch(integration);
                            controller.update();
                          },
                        ),
                      ],
                    ),
                    MyText.titleMedium(integration.title, fontWeight: 600),
                    MyText.bodyMedium(integration.description, fontWeight: 600, xMuted: true),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
