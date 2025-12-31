import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../helper/utils/my_shadow.dart';
import '../../../../../helper/widgets/my_card.dart';
import '../../../../../helper/widgets/my_flex.dart';
import '../../../../../helper/widgets/my_flex_item.dart';
import '../../../../../helper/widgets/my_spacing.dart';
import '../../../../../helper/widgets/my_text.dart';
import '../../../../../helper/widgets/responsive.dart';
import '../../../../../themes/app_theme.dart';
import '../../../../../views/layout/layout.dart';
import '../controllers/accordion_controller.dart';

class AccordionView extends GetView<AccordionController> {
  const AccordionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: MySpacing.x(flexSpacing / 2),
        child: Center(
          child: MyFlex(
            children: <MyFlexItem>[
              MyFlexItem(sizes: 'lg-8', child: basicExample()),
              MyFlexItem(sizes: 'lg-8', child: flushAccordion()),
              MyFlexItem(sizes: 'lg-8', child: alwaysOpenAccordion()),
            ],
          ),
        ),
      ),
    );
  }

  Widget basicExample() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Basic Example', fontWeight: 600),
          MySpacing.height(16),
          Obx(
            () => ExpansionPanelList(
              expandedHeaderPadding: const EdgeInsets.all(0),
              expansionCallback: (int index, bool isExpanded) => controller.defaultAccordions[index] = isExpanded,
              animationDuration: const Duration(milliseconds: 500),
              children: <ExpansionPanel>[
                ExpansionPanel(
                  canTapOnHeader: true,
                  headerBuilder: (BuildContext context, bool isExpanded) => title(isExpanded, 'Accordions Item #1'),
                  body: Padding(padding: MySpacing.all(20), child: MyText.bodyMedium(controller.dummyTexts[1], xMuted: true)),
                  isExpanded: controller.defaultAccordions[0],
                ),
                ExpansionPanel(
                  canTapOnHeader: true,
                  headerBuilder: (BuildContext context, bool isExpanded) => title(isExpanded, 'Accordions Item #2'),
                  body: Padding(padding: MySpacing.all(20), child: MyText.bodyMedium(controller.dummyTexts[1], xMuted: true)),
                  isExpanded: controller.defaultAccordions[1],
                ),
                ExpansionPanel(
                  canTapOnHeader: true,
                  headerBuilder: (BuildContext context, bool isExpanded) => title(isExpanded, 'Accordions Item #3'),
                  body: Padding(padding: MySpacing.all(20), child: MyText.bodyMedium(controller.dummyTexts[1], xMuted: true)),
                  isExpanded: controller.defaultAccordions[2],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget flushAccordion() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Flush Accordion', fontWeight: 600),
          MySpacing.height(16),
          Obx(
            () => ExpansionPanelList(
              expandedHeaderPadding: const EdgeInsets.all(0),
              expansionCallback: (int index, bool isExpanded) => controller.flushAccordions[index] = isExpanded,
              animationDuration: const Duration(milliseconds: 500),
              children: <ExpansionPanel>[
                ExpansionPanel(
                  canTapOnHeader: true,
                  headerBuilder: (BuildContext context, bool isExpanded) => title(isExpanded, 'Accordions Item #1'),
                  body: Padding(padding: MySpacing.all(20), child: MyText.bodyMedium(controller.dummyTexts[1], xMuted: true)),
                  isExpanded: controller.flushAccordions[0],
                ),
                ExpansionPanel(
                  canTapOnHeader: true,
                  headerBuilder: (BuildContext context, bool isExpanded) => title(isExpanded, 'Accordions Item #2'),
                  body: Padding(padding: MySpacing.all(20), child: MyText.bodyMedium(controller.dummyTexts[1], xMuted: true)),
                  isExpanded: controller.flushAccordions[1],
                ),
                ExpansionPanel(
                  canTapOnHeader: true,
                  headerBuilder: (BuildContext context, bool isExpanded) => title(isExpanded, 'Accordions Item #3'),
                  body: Padding(padding: MySpacing.all(20), child: MyText.bodyMedium(controller.dummyTexts[1], xMuted: true)),
                  isExpanded: controller.flushAccordions[2],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget alwaysOpenAccordion() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Always Open Accordion', fontWeight: 600),
          MySpacing.height(16),
          Obx(
            () => ExpansionPanelList(
              expandedHeaderPadding: const EdgeInsets.all(0),
              expansionCallback: (int index, bool isExpanded) => controller.alwaysOpenAccordions[index] = isExpanded,
              animationDuration: const Duration(milliseconds: 500),
              children: <ExpansionPanel>[
                ExpansionPanel(
                  canTapOnHeader: true,
                  headerBuilder: (BuildContext context, bool isExpanded) => title(isExpanded, 'Accordions Item #1'),
                  body: Padding(padding: MySpacing.all(20), child: MyText.bodyMedium(controller.dummyTexts[1], xMuted: true)),
                  isExpanded: controller.alwaysOpenAccordions[0],
                ),
                ExpansionPanel(
                  canTapOnHeader: true,
                  headerBuilder: (BuildContext context, bool isExpanded) => title(isExpanded, 'Accordions Item #2'),
                  body: Padding(padding: MySpacing.all(20), child: MyText.bodyMedium(controller.dummyTexts[1], xMuted: true)),
                  isExpanded: controller.alwaysOpenAccordions[1],
                ),
                ExpansionPanel(
                  canTapOnHeader: true,
                  headerBuilder: (BuildContext context, bool isExpanded) => title(isExpanded, 'Accordions Item #3'),
                  body: Padding(padding: MySpacing.all(20), child: MyText.bodyMedium(controller.dummyTexts[1], xMuted: true)),
                  isExpanded: controller.alwaysOpenAccordions[2],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget title(bool isExpanded, String title) => ListTile(
    title: MyText.bodyMedium(title, color: isExpanded ? theme.colorScheme.primary : theme.colorScheme.onSurface, fontWeight: isExpanded ? 600 : 500),
  );
}
