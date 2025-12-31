import 'package:flutter/material.dart';

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
import '../../../../../images.dart';
import '../../../../../themes/ui_mixin.dart';
import '../../../../../views/layout/layout.dart';
import '../controllers/card_controller.dart';

class CardView extends GetView<CardController> {
  const CardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: MySpacing.x(flexSpacing / 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyFlex(
              children: <MyFlexItem>[
                MyFlexItem(
                  sizes: 'lg-3 md-6 sm-6',
                  child: MyCard(
                    paddingAll: 0,
                    borderRadiusAll: 4,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shadow: MyShadow(elevation: 0.2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        MyContainer(
                          height: 250,
                          paddingAll: 0,
                          width: double.infinity,
                          child: Image.asset(Images.small[0], fit: BoxFit.cover),
                        ),
                        Padding(
                          padding: MySpacing.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              MyText.titleMedium('Card Title', fontWeight: 700),
                              MySpacing.height(20),
                              MyText.bodyMedium(controller.dummyTexts[0], muted: true, maxLines: 3),
                              MySpacing.height(20),
                              MyContainer(
                                onTap: () {},
                                color: UiMixin.contentTheme.primary,
                                paddingAll: 12,
                                child: MyText.labelMedium('Button', color: UiMixin.contentTheme.onPrimary),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                MyFlexItem(
                  sizes: 'lg-3 md-6 sm-6',
                  child: MyCard(
                    paddingAll: 0,
                    borderRadiusAll: 4,
                    shadow: MyShadow(elevation: 0.2),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        MyContainer(
                          height: 250,
                          paddingAll: 0,
                          width: double.infinity,
                          child: Image.asset(Images.small[1], fit: BoxFit.cover),
                        ),
                        MySpacing.height(16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(padding: MySpacing.x(20), child: MyText.titleMedium('Card Title', fontWeight: 700)),
                            MySpacing.height(20),
                            Padding(padding: MySpacing.x(20), child: MyText.bodyMedium('Some quick example text to build on the card..', maxLines: 1, xMuted: true)),
                            const Divider(height: 30),
                            Padding(padding: MySpacing.x(20), child: MyText.bodyMedium('Cras justo odi', xMuted: true)),
                            const Divider(height: 30),
                            Padding(
                              padding: MySpacing.x(20),
                              child: Wrap(
                                runSpacing: 20,
                                spacing: 20,
                                children: <Widget>[
                                  MyButton.text(
                                    onPressed: () {},
                                    padding: MySpacing.all(8),
                                    child: MyText.bodyMedium('Card Link', color: UiMixin.contentTheme.primary),
                                  ),
                                  MyButton.text(
                                    onPressed: () {},
                                    padding: MySpacing.all(8),
                                    child: MyText.bodyMedium('Another Link', color: UiMixin.contentTheme.primary),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                MyFlexItem(
                  sizes: 'lg-3 md-6 sm-6',
                  child: MyCard(
                    paddingAll: 0,
                    borderRadiusAll: 4,
                    shadow: MyShadow(elevation: 0.2),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        MyContainer(
                          height: 250,
                          paddingAll: 0,
                          width: double.infinity,
                          child: Image.asset(Images.small[3], fit: BoxFit.cover),
                        ),
                        Padding(
                          padding: MySpacing.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              MyText.bodyMedium(controller.dummyTexts[0], maxLines: 3, fontWeight: 600, muted: true),
                              MySpacing.height(20),
                              MyContainer(
                                onTap: () {},
                                color: UiMixin.contentTheme.primary,
                                paddingAll: 12,
                                child: MyText.bodyMedium('Button', color: UiMixin.contentTheme.onPrimary),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                MyFlexItem(
                  sizes: 'lg-3 md-6 sm-6',
                  child: MyCard(
                    paddingAll: 0,
                    borderRadiusAll: 4,
                    shadow: MyShadow(elevation: 0.2),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(padding: MySpacing.all(20), child: MyText.titleMedium('Card Title', fontWeight: 700, muted: true)),
                        MyContainer(
                          height: 200,
                          paddingAll: 0,
                          width: double.infinity,
                          child: Image.asset(Images.small[4], fit: BoxFit.cover),
                        ),
                        Padding(
                          padding: MySpacing.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              MyText.bodyMedium(controller.dummyTexts[0], maxLines: 1, muted: true),
                              MySpacing.height(20),
                              Wrap(
                                spacing: 20,
                                runSpacing: 20,
                                children: <Widget>[
                                  MyButton.text(
                                    onPressed: () {},
                                    padding: MySpacing.all(8),
                                    child: MyText.bodyMedium('Card Link', color: UiMixin.contentTheme.primary),
                                  ),
                                  MyButton.text(
                                    onPressed: () {},
                                    padding: MySpacing.all(8),
                                    child: MyText.bodyMedium('Another Link', color: UiMixin.contentTheme.primary),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                MyFlexItem(
                  sizes: 'lg-6 md-6 sm-6',
                  child: MyCard(
                    paddingAll: 20,
                    borderRadiusAll: 4,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shadow: MyShadow(elevation: 0.2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        MyText.titleMedium('Special title treatment', fontWeight: 700, muted: true),
                        MySpacing.height(8),
                        MyText.bodyMedium('Lorem ipsum dolor sit amet, consectetur adipiscing elit.', xMuted: true),
                        MySpacing.height(20),
                        MyButton.block(
                          onPressed: () {},
                          elevation: 0,
                          backgroundColor: UiMixin.contentTheme.primary,
                          child: MyText.labelMedium('Go Somewhere', color: UiMixin.contentTheme.onPrimary),
                        ),
                      ],
                    ),
                  ),
                ),
                MyFlexItem(
                  sizes: 'lg-6 md-6 sm-6',
                  child: MyCard(
                    paddingAll: 20,
                    borderRadiusAll: 4,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shadow: MyShadow(elevation: 0.2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        MyText.titleMedium('Special title treatment', fontWeight: 700, muted: true),
                        MySpacing.height(8),
                        MyText.bodyMedium('Lorem ipsum dolor sit amet, consectetur adipiscing elit.', xMuted: true),
                        MySpacing.height(20),
                        MyButton.block(
                          onPressed: () {},
                          elevation: 0,
                          backgroundColor: UiMixin.contentTheme.primary,
                          child: MyText.labelMedium('Go Somewhere', color: UiMixin.contentTheme.onPrimary),
                        ),
                      ],
                    ),
                  ),
                ),
                MyFlexItem(
                  sizes: 'lg-4 md-4 sm-6',
                  child: MyCard(
                    paddingAll: 0,
                    borderRadiusAll: 4,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shadow: MyShadow(elevation: 0.2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(padding: MySpacing.all(16), child: MyText.titleMedium('Featured', fontWeight: 600, muted: true)),
                        const Divider(height: 0),
                        Padding(
                          padding: MySpacing.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              MyText.bodyMedium('Special title treatment', fontWeight: 600, muted: true),
                              MySpacing.height(20),
                              MyText.bodySmall('With supporting text below as a natural lead-in to additional content.', muted: true),
                              MySpacing.height(20),
                              MyContainer(
                                onTap: () {},
                                color: UiMixin.contentTheme.primary,
                                paddingAll: 12,
                                child: MyText.labelMedium('Go somewhere', color: UiMixin.contentTheme.onPrimary),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                MyFlexItem(
                  sizes: 'lg-4 md-4 sm-6',
                  child: MyCard(
                    paddingAll: 0,
                    borderRadiusAll: 4,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shadow: MyShadow(elevation: 0.2),
                    child: SizedBox(
                      height: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(padding: MySpacing.all(16), child: MyText.titleMedium('Quote')),
                          const Divider(height: 0),
                          Padding(
                            padding: MySpacing.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                MyText.bodyMedium(controller.dummyTexts[0], maxLines: 2, muted: true, overflow: TextOverflow.ellipsis),
                                MySpacing.height(20),
                                MyText.bodySmall('Someone famous in Source Title', overflow: TextOverflow.ellipsis),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                MyFlexItem(
                  sizes: 'lg-4 md-4',
                  child: MyCard(
                    paddingAll: 0,
                    borderRadiusAll: 4,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shadow: MyShadow(elevation: 0.2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(padding: MySpacing.all(16), child: MyText.titleMedium('Featured')),
                        const Divider(height: 0),
                        Padding(
                          padding: MySpacing.all(16),
                          child: MyContainer(
                            paddingAll: 12,
                            onTap: () {},
                            color: UiMixin.contentTheme.primary,
                            child: MyText.bodyMedium('Go Somewhere', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
                          ),
                        ),
                        const Divider(height: 0),
                        Padding(padding: MySpacing.all(16), child: MyText.bodySmall('2 days ago', fontWeight: 600, xMuted: true)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            MySpacing.height(flexSpacing),
            Padding(padding: MySpacing.x(flexSpacing / 2), child: MyText.titleMedium('Card Colored', fontWeight: 700, muted: true)),
            MySpacing.height(flexSpacing),
            MyFlex(
              children: <MyFlexItem>[
                MyFlexItem(
                  sizes: 'lg-4 md-4 sm-6',
                  child: MyContainer(
                    color: UiMixin.contentTheme.primary,
                    paddingAll: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        MyText.titleMedium('Special title treatment', fontWeight: 600, color: UiMixin.contentTheme.onSecondary),
                        MySpacing.height(20),
                        MyText.bodyMedium('With supporting text below as a natural lead-in to additional content.', muted: true, color: UiMixin.contentTheme.onSecondary),
                        MySpacing.height(20),
                        MyContainer(onTap: () {}, paddingAll: 12, child: MyText.bodyMedium('Button', fontWeight: 600)),
                      ],
                    ),
                  ),
                ),
                MyFlexItem(sizes: 'lg-4 md-4 sm-6', child: cardColor(controller.dummyTexts[0], 'Someone famous in Source Title', UiMixin.contentTheme.secondary)),
                MyFlexItem(sizes: 'lg-4 md-4 sm-6', child: cardColor(controller.dummyTexts[1], 'Someone famous in Source Title', UiMixin.contentTheme.success)),
                MyFlexItem(sizes: 'lg-4 md-4 sm-6', child: cardColor(controller.dummyTexts[2], 'Someone famous in Source Title', UiMixin.contentTheme.info)),
                MyFlexItem(sizes: 'lg-4 md-4 sm-6', child: cardColor(controller.dummyTexts[3], 'Someone famous in Source Title', UiMixin.contentTheme.warning)),
                MyFlexItem(sizes: 'lg-4 md-4 sm-6', child: cardColor(controller.dummyTexts[4], 'Someone famous in Source Title', UiMixin.contentTheme.danger)),
              ],
            ),
            MySpacing.height(flexSpacing),
            Padding(padding: MySpacing.x(flexSpacing / 2), child: MyText.titleMedium('Card Border', fontWeight: 600)),
            MySpacing.height(flexSpacing),
            MyFlex(
              children: <MyFlexItem>[
                MyFlexItem(sizes: 'lg-4 md-4 sm-6', child: cardBorder('Special title treatment', 'With supporting text below as a natural lead-in to additional content.', UiMixin.contentTheme.primary)),
                MyFlexItem(sizes: 'lg-4 md-4 sm-6', child: cardBorder('Special title treatment', 'With supporting text below as a natural lead-in to additional content.', UiMixin.contentTheme.secondary)),
                MyFlexItem(sizes: 'lg-4 md-4 sm-6', child: cardBorder('Special title treatment', 'With supporting text below as a natural lead-in to additional content.', UiMixin.contentTheme.success)),
              ],
            ),
            MySpacing.height(flexSpacing),
            Padding(padding: MySpacing.x(flexSpacing / 2), child: MyText.titleMedium('Horizontal Card', fontWeight: 600)),
            MySpacing.height(flexSpacing),
            MyFlex(
              children: <MyFlexItem>[
                MyFlexItem(
                  sizes: 'lg-6',
                  child: MyContainer(
                    paddingAll: 0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        MyContainer(height: 150, width: 250, paddingAll: 0, child: Image.asset(Images.small[0], fit: BoxFit.cover)),
                        MySpacing.width(20),
                        Expanded(
                          child: SizedBox(
                            height: 150,
                            child: Padding(
                              padding: MySpacing.nLeft(20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[MyText.bodyMedium('Card Title', fontWeight: 700), MyText.bodyMedium(controller.dummyTexts[0], maxLines: 2, muted: true), MyText.bodySmall('Last updated 3 min ago', xMuted: true)],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                MyFlexItem(
                  sizes: 'lg-6',
                  child: MyContainer(
                    paddingAll: 0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                            height: 150,
                            child: Padding(
                              padding: MySpacing.all(20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[MyText.bodyMedium('Card Title', fontWeight: 700), MyText.bodyMedium(controller.dummyTexts[0], maxLines: 2, muted: true), MyText.bodySmall('Last updated 3 min ago', fontWeight: 600, xMuted: true)],
                              ),
                            ),
                          ),
                        ),
                        MySpacing.width(20),
                        MyContainer(height: 150, width: 250, paddingAll: 0, child: Image.asset(Images.small[1], fit: BoxFit.cover)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            MySpacing.height(flexSpacing),
            Padding(padding: MySpacing.x(flexSpacing / 2), child: MyText.titleMedium('Stretched link', fontWeight: 600)),
            MySpacing.height(flexSpacing),
            MyFlex(
              children: <MyFlexItem>[
                MyFlexItem(
                  sizes: 'lg-3 md-3',
                  child: MyContainer(
                    paddingAll: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        MyContainer(
                          height: 200,
                          borderRadiusAll: 0,
                          width: double.infinity,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          paddingAll: 0,
                          child: Image.asset(Images.small[1], fit: BoxFit.cover),
                        ),
                        Padding(
                          padding: MySpacing.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              MyText.bodyMedium('Card with stretched link', fontWeight: 700),
                              MySpacing.height(20),
                              MyContainer(
                                child: MyContainer(
                                  color: UiMixin.contentTheme.primary,
                                  paddingAll: 12,
                                  child: MyText.bodyMedium('Go somewhere', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                MyFlexItem(
                  sizes: 'lg-3 md-3',
                  child: MyContainer(
                    onTap: () {},
                    paddingAll: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        MyContainer(
                          height: 200,
                          borderRadiusAll: 0,
                          width: double.infinity,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          paddingAll: 0,
                          child: Image.asset(Images.small[2], fit: BoxFit.cover),
                        ),
                        Padding(
                          padding: MySpacing.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              MyText.bodyMedium('Card with stretched link', fontWeight: 700, color: UiMixin.contentTheme.primary),
                              MySpacing.height(20),
                              MyText.bodyMedium(controller.dummyTexts[0], muted: true, maxLines: 2),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                MyFlexItem(
                  sizes: 'lg-3 md-3',
                  child: MyContainer(
                    onTap: () {},
                    paddingAll: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        MyContainer(
                          height: 200,
                          borderRadiusAll: 0,
                          width: double.infinity,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          paddingAll: 0,
                          child: Image.asset(Images.small[3], fit: BoxFit.cover),
                        ),
                        Padding(
                          padding: MySpacing.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              MyText.bodyMedium('Card with stretched link', fontWeight: 700),
                              MySpacing.height(20),
                              MyContainer(
                                color: UiMixin.contentTheme.primary,
                                paddingAll: 12,
                                child: MyText.bodyMedium('Go somewhere', fontWeight: 600, color: UiMixin.contentTheme.onInfo),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                MyFlexItem(
                  sizes: 'lg-3 md-3',
                  child: MyContainer(
                    onTap: () {},
                    paddingAll: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        MyContainer(
                          height: 200,
                          width: double.infinity,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          paddingAll: 0,
                          borderRadiusAll: 0,
                          child: Image.asset(Images.small[0], fit: BoxFit.cover),
                        ),
                        Padding(
                          padding: MySpacing.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              MyText.bodyMedium('Card with stretched link', fontWeight: 700, color: UiMixin.contentTheme.secondary),
                              MySpacing.height(20),
                              MyText.bodyMedium(controller.dummyTexts[0], muted: true, maxLines: 2),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            MySpacing.height(flexSpacing),
            Padding(padding: MySpacing.x(flexSpacing / 2), child: MyText.titleMedium('Card group', fontWeight: 600)),
            MySpacing.height(flexSpacing),
            Padding(
              padding: MySpacing.x(flexSpacing / 2),
              child: MyFlex(
                spacing: 0,
                children: <MyFlexItem>[
                  MyFlexItem(
                    sizes: 'lg-4 md-4',
                    child: MyContainer(
                      paddingAll: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          MyContainer(
                            height: 300,
                            width: double.infinity,
                            borderRadiusAll: 0,
                            paddingAll: 0,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.asset(Images.small[0], fit: BoxFit.cover),
                          ),
                          Padding(
                            padding: MySpacing.all(20),
                            child: SizedBox(
                              height: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[MyText.bodyMedium('Card title', fontWeight: 600), MyText.bodySmall(controller.dummyTexts[0], maxLines: 2, muted: true), MyText.bodySmall('Last updated 3 mins ago', fontWeight: 600, xMuted: true)],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  MyFlexItem(
                    sizes: 'lg-4 md-4',
                    child: MyContainer(
                      paddingAll: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          MyContainer(
                            height: 300,
                            width: double.infinity,
                            paddingAll: 0,
                            borderRadiusAll: 0,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.asset(Images.small[1], fit: BoxFit.cover),
                          ),
                          Padding(
                            padding: MySpacing.all(20),
                            child: SizedBox(
                              height: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[MyText.bodyMedium('Card title', fontWeight: 600), MyText.bodySmall(controller.dummyTexts[0], maxLines: 1), MyText.bodySmall('Last updated 3 mins ago', fontWeight: 600, xMuted: true)],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  MyFlexItem(
                    sizes: 'lg-4 md-4',
                    child: MyContainer(
                      paddingAll: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          MyContainer(
                            height: 300,
                            width: double.infinity,
                            paddingAll: 0,
                            borderRadiusAll: 0,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.asset(Images.small[2], fit: BoxFit.cover),
                          ),
                          Padding(
                            padding: MySpacing.all(20),
                            child: SizedBox(
                              height: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[MyText.bodyMedium('Card title', fontWeight: 600), MyText.bodySmall(controller.dummyTexts[0], maxLines: 2), MyText.bodySmall('Last updated 3 mins ago', fontWeight: 600, xMuted: true)],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardColor(String title, String subTitle, Color color) {
    return MyContainer(
      height: 147,
      color: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.bodySmall(title, maxLines: 2, color: UiMixin.contentTheme.onPrimary),
          MySpacing.height(30),
          MyText.bodySmall(subTitle, muted: true, color: UiMixin.contentTheme.onPrimary),
        ],
      ),
    );
  }

  Widget cardBorder(String title, String subTitle, Color color) {
    return MyContainer.bordered(
      borderColor: color,
      paddingAll: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium(title, maxLines: 2, fontWeight: 600, color: color),
          MySpacing.height(12),
          MyText.bodyMedium(subTitle, muted: true),
          MySpacing.height(12),
          MyContainer(
            color: color,
            paddingAll: 8,
            onTap: () {},
            child: MyText.bodyMedium('Button', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
          ),
        ],
      ),
    );
  }
}
