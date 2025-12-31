import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

import 'package:get/get.dart';

import '../../../../../helper/utils/my_shadow.dart';
import '../../../../../helper/widgets/my_card.dart';
import '../../../../../helper/widgets/my_flex.dart';
import '../../../../../helper/widgets/my_flex_item.dart';
import '../../../../../helper/widgets/my_spacing.dart';
import '../../../../../helper/widgets/my_text.dart';
import '../../../../../helper/widgets/responsive.dart';
import '../../../../../views/layout/layout.dart';
import '../controllers/breadcrumb_controller.dart';

class BreadcrumbView extends GetView<BreadcrumbController> {
  const BreadcrumbView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: MySpacing.x(flexSpacing / 2),
        child: Center(
          child: MyFlex(
            children: <MyFlexItem>[
              MyFlexItem(sizes: 'lg-8', child: defaultExample()),
              MyFlexItem(sizes: 'lg-8', child: dividersBreadCrumb()),
            ],
          ),
        ),
      ),
    );
  }

  Widget defaultExample() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Default Example', fontWeight: 600),
          MySpacing.height(16),
          MyText.bodyMedium('Home', xMuted: true),
          MySpacing.height(20),
          Row(children: <Widget>[MyText.bodyMedium('Home', xMuted: true), MySpacing.width(4), const Icon(LucideIcons.chevron_right, size: 16), MySpacing.width(4), MyText.bodyMedium('Library', xMuted: true)]),
          MySpacing.height(20),
          Row(
            children: <Widget>[
              MyText.bodyMedium('Home', xMuted: true),
              MySpacing.width(4),
              const Icon(LucideIcons.chevron_right, size: 16),
              MySpacing.width(4),
              MyText.bodyMedium('Library', xMuted: true),
              MySpacing.width(4),
              const Icon(LucideIcons.chevron_right, size: 16),
              MySpacing.width(4),
              MyText.bodyMedium('Data', xMuted: true),
            ],
          ),
        ],
      ),
    );
  }

  Widget dividersBreadCrumb() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Dividers Breadcrumb', fontWeight: 600),
          MySpacing.height(16),
          const Text('Home', style: TextStyle(fontSize: 16)),
          MySpacing.height(16),
          Row(
            children: <Widget>[
              InkWell(onTap: () {}, child: MyText.bodyMedium('Home')),
              MySpacing.width(4),
              MyText.bodyMedium(' > '),
              MySpacing.width(4),
              MyText.bodyMedium('Library'),
            ],
          ),
          MySpacing.height(16),
          Row(
            children: <Widget>[
              InkWell(onTap: () {}, child: MyText.bodyMedium('Home')),
              MySpacing.width(4),
              MyText.bodyMedium(' > '),
              MySpacing.width(4),
              InkWell(onTap: () {}, child: MyText.bodyMedium('Library')),
              MySpacing.width(4),
              MyText.bodyMedium(' > '),
              MySpacing.width(4),
              MyText.bodyMedium('Data'),
            ],
          ),
        ],
      ),
    );
  }
}
