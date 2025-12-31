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
import '../../../../../themes/app_theme.dart';
import '../../../../../themes/ui_mixin.dart';
import '../../../../../views/layout/layout.dart';
import '../controllers/faqs_controller.dart';

class FaqsView extends GetView<FaqsController> {
  const FaqsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: MySpacing.x(flexSpacing),
        child: MyCard(
          shadow: MyShadow(elevation: 0.3, position: MyShadowPosition.center),
          child: Obx(
            () => Column(
              children: <Widget>[
                MyFlex(
                  children: <MyFlexItem>[
                    MyFlexItem(
                      sizes: 'lg-6',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          MyText.titleMedium('General', fontWeight: 600),
                          MySpacing.height(16),
                          ExpansionPanelList(
                            elevation: 1,
                            expandedHeaderPadding: const EdgeInsets.all(0),
                            materialGapSize: 0.4,
                            expansionCallback: (int index, bool isExpanded) => controller.dataExpansionPanel1[index] = isExpanded,
                            animationDuration: const Duration(milliseconds: 500),
                            children: <ExpansionPanel>[
                              ExpansionPanel(
                                canTapOnHeader: true,
                                headerBuilder: (BuildContext context, bool isExpanded) => title(isExpanded, 'Can I use Dummy FAQs for my website or project?'),
                                body: Padding(padding: MySpacing.all(20), child: MyText.bodyMedium(controller.dummyTexts[1], muted: true, fontWeight: 600, fontSize: 13)),
                                isExpanded: controller.dataExpansionPanel1[0],
                              ),
                              ExpansionPanel(
                                canTapOnHeader: true,
                                headerBuilder: (BuildContext context, bool isExpanded) => title(isExpanded, 'Are Dummy FAQs suitable for customer support purposes?'),
                                body: Padding(padding: MySpacing.all(20), child: MyText.bodyMedium(controller.dummyTexts[1], muted: true, fontWeight: 600, fontSize: 13)),
                                isExpanded: controller.dataExpansionPanel1[1],
                              ),
                              ExpansionPanel(
                                canTapOnHeader: true,
                                headerBuilder: (BuildContext context, bool isExpanded) => title(isExpanded, 'Do Dummy FAQs require attribution?'),
                                body: Padding(padding: MySpacing.all(20), child: MyText.bodyMedium(controller.dummyTexts[1], muted: true, fontWeight: 600, fontSize: 13)),
                                isExpanded: controller.dataExpansionPanel1[2],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    MyFlexItem(
                      sizes: 'lg-6',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          MyText.titleMedium('Payments', fontWeight: 600),
                          MySpacing.height(16),
                          ExpansionPanelList(
                            elevation: 1,
                            materialGapSize: 0.4,
                            expandedHeaderPadding: const EdgeInsets.all(0),
                            expansionCallback: (int index, bool isExpanded) => controller.dataExpansionPanel2[index] = isExpanded,
                            animationDuration: const Duration(milliseconds: 500),
                            children: <ExpansionPanel>[
                              ExpansionPanel(
                                canTapOnHeader: true,
                                headerBuilder: (BuildContext context, bool isExpanded) => title(isExpanded, 'Can I test my website/app with Dummy Payments?'),
                                body: Padding(padding: MySpacing.all(20), child: MyText.bodyMedium(controller.dummyTexts[1], muted: true, fontWeight: 600, fontSize: 13)),
                                isExpanded: controller.dataExpansionPanel2[0],
                              ),
                              ExpansionPanel(
                                canTapOnHeader: true,
                                headerBuilder: (BuildContext context, bool isExpanded) => title(isExpanded, 'Are Dummy Payments secure?'),
                                body: Padding(padding: MySpacing.all(20), child: MyText.bodyMedium(controller.dummyTexts[1], muted: true, fontWeight: 600, fontSize: 13)),
                                isExpanded: controller.dataExpansionPanel2[1],
                              ),
                              ExpansionPanel(
                                canTapOnHeader: true,
                                headerBuilder: (BuildContext context, bool isExpanded) => title(isExpanded, 'How can I differentiate between a Dummy Payment and a real one?'),
                                body: Padding(padding: MySpacing.all(20), child: MyText.bodyMedium(controller.dummyTexts[1], muted: true, fontWeight: 600, fontSize: 13)),
                                isExpanded: controller.dataExpansionPanel2[2],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    MyFlexItem(
                      sizes: 'lg-6',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          MyText.titleMedium('Refunds', fontWeight: 600),
                          MySpacing.height(16),
                          ExpansionPanelList(
                            elevation: 1,
                            materialGapSize: 0.4,
                            expandedHeaderPadding: const EdgeInsets.all(0),
                            expansionCallback: (int index, bool isExpanded) => controller.dataExpansionPanel3[index] = isExpanded,
                            animationDuration: const Duration(milliseconds: 500),
                            children: <ExpansionPanel>[
                              ExpansionPanel(
                                canTapOnHeader: true,
                                headerBuilder: (BuildContext context, bool isExpanded) => title(isExpanded, 'How do I request a refund?'),
                                body: Padding(padding: MySpacing.all(20), child: MyText.bodyMedium(controller.dummyTexts[1], muted: true, fontWeight: 600, fontSize: 13)),
                                isExpanded: controller.dataExpansionPanel3[0],
                              ),
                              ExpansionPanel(
                                canTapOnHeader: true,
                                headerBuilder: (BuildContext context, bool isExpanded) => title(isExpanded, 'What is the refund policy?'),
                                body: Padding(padding: MySpacing.all(20), child: MyText.bodyMedium(controller.dummyTexts[1], muted: true, fontWeight: 600, fontSize: 13)),
                                isExpanded: controller.dataExpansionPanel3[1],
                              ),
                              ExpansionPanel(
                                canTapOnHeader: true,
                                headerBuilder: (BuildContext context, bool isExpanded) => title(isExpanded, 'How long does it take to process a refund?'),
                                body: Padding(padding: MySpacing.all(20), child: MyText.bodyMedium(controller.dummyTexts[1], muted: true, fontWeight: 600, fontSize: 13)),
                                isExpanded: controller.dataExpansionPanel3[2],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    MyFlexItem(
                      sizes: 'lg-6',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          MyText.titleMedium('Support', fontWeight: 600),
                          MySpacing.height(16),
                          ExpansionPanelList(
                            elevation: 1,
                            materialGapSize: 0.4,
                            expandedHeaderPadding: const EdgeInsets.all(0),
                            expansionCallback: (int index, bool isExpanded) => controller.dataExpansionPanel4[index] = isExpanded,
                            animationDuration: const Duration(milliseconds: 1200),
                            children: <ExpansionPanel>[
                              ExpansionPanel(
                                canTapOnHeader: true,
                                headerBuilder: (BuildContext context, bool isExpanded) => title(isExpanded, 'How do I contact customer support?'),
                                body: Padding(padding: MySpacing.all(20), child: MyText.bodyMedium(controller.dummyTexts[1], muted: true, fontWeight: 600, fontSize: 13)),
                                isExpanded: controller.dataExpansionPanel4[0],
                              ),
                              ExpansionPanel(
                                canTapOnHeader: true,
                                headerBuilder: (BuildContext context, bool isExpanded) => title(isExpanded, 'Is customer support available 24/7?'),
                                body: Padding(padding: MySpacing.all(20), child: MyText.bodyMedium(controller.dummyTexts[1], muted: true, fontWeight: 600, fontSize: 13)),
                                isExpanded: controller.dataExpansionPanel4[1],
                              ),
                              ExpansionPanel(
                                canTapOnHeader: true,
                                headerBuilder: (BuildContext context, bool isExpanded) => title(isExpanded, 'How long does it take to receive a response from customer support?'),
                                body: Padding(padding: MySpacing.all(20), child: MyText.bodyMedium(controller.dummyTexts[2], muted: true, fontWeight: 600, fontSize: 13)),
                                isExpanded: controller.dataExpansionPanel4[2],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                MySpacing.height(MediaQuery.of(context).size.height / 12),
                MyText.titleMedium("Can't find a questions?", fontWeight: 600, fontSize: 18),
                MySpacing.height(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MyContainer(
                      onTap: () {},
                      color: UiMixin.contentTheme.success,
                      paddingAll: 12,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(LucideIcons.mail, size: 16, color: UiMixin.contentTheme.onSuccess),
                          MySpacing.width(8),
                          MyText.labelMedium('Email us your question', fontWeight: 600, color: UiMixin.contentTheme.onSuccess),
                        ],
                      ),
                    ),
                    MySpacing.width(12),
                    MyContainer(
                      onTap: () {},
                      color: UiMixin.contentTheme.info,
                      paddingAll: 12,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(LucideIcons.twitter, size: 16, color: UiMixin.contentTheme.onSuccess),
                          MySpacing.width(8),
                          MyText.labelMedium('Send us a tweet', fontWeight: 600, color: UiMixin.contentTheme.onSuccess),
                        ],
                      ),
                    ),
                  ],
                ),
                MySpacing.height(MediaQuery.of(context).size.height / 12),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget title(bool isExpanded, String title) {
    return Padding(
      padding: MySpacing.all(14),
      child: MyText.titleSmall(title, color: isExpanded ? theme.colorScheme.primary : theme.colorScheme.onSurface, fontWeight: isExpanded ? 600 : 500),
    );
  }
}
