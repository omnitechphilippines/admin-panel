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
import '../../../../../themes/ui_mixin.dart';
import '../../../../../views/layout/layout.dart';
import '../controllers/pricing_controller.dart';

class PricingView extends GetView<PricingController> {
  const PricingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Column(
        children: <Widget>[
          Padding(
            padding: MySpacing.x(flexSpacing),
            child: Column(
              children: <Widget>[MyText.titleLarge('Simple Pricing Plans', fontWeight: 600), MySpacing.height(16), MyText.bodyMedium("Get the power and control you need to manage your organization's technical documentation", fontWeight: 600)],
            ),
          ),
          MySpacing.height(24),
          MyFlex(
            children: <MyFlexItem>[
              MyFlexItem(sizes: 'lg-2.5 md-6 sm-6', child: freePack()),
              MyFlexItem(sizes: 'lg-2.5 md-6 sm-6', child: professionalPack()),
              MyFlexItem(sizes: 'lg-2.5 md-6 sm-6', child: businessPack()),
              MyFlexItem(sizes: 'lg-2.5 md-6 sm-6', child: enterPricePack()),
            ],
          ),
        ],
      ),
    );
  }

  Widget feature(String title) {
    return Row(
      children: <Widget>[
        Icon(LucideIcons.circle_check, size: 16, color: UiMixin.contentTheme.primary),
        MySpacing.width(8),
        Expanded(child: MyText.bodyMedium(title, fontWeight: 600, muted: true, maxLines: 1)),
      ],
    );
  }

  Widget packCard({required String title, required String price, required List<String> features, bool isPopular = false, String buttonText = 'Get Started'}) {
    return MyCard(
      shadow: MyShadow(elevation: 0.3, position: MyShadowPosition.center),
      paddingAll: 20,
      height: 470,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(child: MyText.bodyMedium(title, fontWeight: 700)),
              if (isPopular)
                MyContainer(
                  color: UiMixin.contentTheme.primary,
                  paddingAll: 4,
                  child: MyText.bodySmall('Popular', color: UiMixin.contentTheme.onPrimary),
                ),
            ],
          ),
          MySpacing.height(20),
          Row(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[MyText.displaySmall(price, fontWeight: 700), MySpacing.width(8), MyText.bodyMedium('/ Month', fontWeight: 600, xMuted: true)]),
          MySpacing.height(20),
          const Divider(height: 0, thickness: 1),
          MySpacing.height(20),
          Wrap(spacing: 20, runSpacing: 20, children: features.map((String fe) => feature(fe)).toList()),
          const Spacer(),
          MyContainer(
            onTap: () {},
            color: UiMixin.contentTheme.primary,
            paddingAll: 12,
            child: Center(child: MyText.bodyMedium(buttonText, fontWeight: 600, color: UiMixin.contentTheme.onPrimary)),
          ),
        ],
      ),
    );
  }

  Widget freePack() {
    return packCard(title: 'FREE PACK', price: '\$0', features: <String>['5 GB Storage', '100 GB Bandwidth', '1 Domain', 'No Support', '24x7 Support', '1 User']);
  }

  Widget professionalPack() {
    return packCard(title: 'PROFESSIONAL PACK', price: '\$12', features: <String>['50 GB Storage', '900 GB Bandwidth', '1 Domain', 'Email Support', '24x7 Support', '5 User'], isPopular: true);
  }

  Widget businessPack() {
    return packCard(title: 'BUSINESS PACK', price: '\$29', features: <String>['500 GB Storage', '2.5 TB Bandwidth', '5 Domain', 'Email Support', '24x7 Support', '10 User'], isPopular: false);
  }

  Widget enterPricePack() {
    return packCard(title: 'ENTERPRISE PACK', price: '\$29', features: <String>['2 TB Storage', 'Unlimited Bandwidth', '50 Domain', 'Email Support', '24x7 Support', '10 User'], isPopular: false);
  }
}
