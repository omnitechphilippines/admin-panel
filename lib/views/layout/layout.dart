import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:get/get.dart';
import '../../controller/layout/layout_controller.dart';
import '../../helper/theme/admin_theme.dart';
import '../../helper/theme/app_style.dart';
import '../../helper/theme/theme_customizer.dart';
import '../../helper/widgets/my_button.dart';
import '../../helper/widgets/my_container.dart';
import '../../helper/widgets/my_dashed_divider.dart';
import '../../helper/widgets/my_responsiv.dart';
import '../../helper/widgets/my_spacing.dart';
import '../../helper/widgets/my_text.dart';
import '../../helper/widgets/responsive.dart';
import '../../images.dart';
import '../../themes/app_theme.dart';
import 'left_bar.dart';
import 'right_bar.dart';
import 'top_bar.dart';
import '../../widgets/custom_pop_menu.dart';

class Layout extends StatelessWidget {
  final Widget? child;

  final LayoutController controller = LayoutController();
  final TopBarTheme topBarTheme = AdminTheme.theme.topBarTheme;
  final ContentTheme contentTheme = AdminTheme.theme.contentTheme;

  Layout({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return MyResponsive(
      builder: (BuildContext context, _, MyScreenMediaType screenMT) {
        return GetBuilder<LayoutController>(
          init: controller,
          builder: (LayoutController controller) {
            if (screenMT.isMobile || screenMT.isTablet) {
              return mobileScreen();
            } else {
              return largeScreen();
            }
          },
        );
      },
    );
  }

  Widget mobileScreen() {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
          InkWell(
            onTap: () {
              ThemeCustomizer.setTheme(ThemeCustomizer.instance.theme == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark);
            },
            child: Icon(ThemeCustomizer.instance.theme == ThemeMode.dark ? LucideIcons.sun : LucideIcons.moon, size: 18, color: topBarTheme.onBackground),
          ),
          MySpacing.width(8),
          CustomPopupMenu(
            backdrop: true,
            onChange: (_) {},
            offsetX: -180,
            menu: Padding(
              padding: MySpacing.xy(8, 8),
              child: const Center(child: Icon(LucideIcons.bell, size: 18)),
            ),
            menuBuilder: (_) => buildNotifications(),
          ),
          MySpacing.width(8),
          CustomPopupMenu(
            backdrop: true,
            onChange: (_) {},
            offsetX: -90,
            offsetY: 4,
            menu: Padding(
              padding: MySpacing.xy(8, 8),
              child: MyContainer.rounded(paddingAll: 0, child: Image.asset(Images.avatars[0], height: 28, width: 28, fit: BoxFit.cover)),
            ),
            menuBuilder: (_) => buildAccountMenu(),
          ),
          MySpacing.width(20),
        ],
      ),
      drawer: const LeftBar(),
      body: SingleChildScrollView(
        key: controller.scrollKey,
        child: Padding(padding: MySpacing.top(flexSpacing), child: child),
      ),
    );
  }

  Widget largeScreen() {
    return Scaffold(
      key: controller.scaffoldKey,
      // backgroundColor: ThemeCustomizer.instance.theme == ThemeMode.dark ? contentTheme.dark : contentTheme.background,
      // backgroundColor: Color(0xff23282e),
      endDrawer: const RightBar(),
      body: Row(
        children: <Widget>[
          LeftBar(isCondensed: ThemeCustomizer.instance.leftBarCondensed),
          Expanded(
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: SingleChildScrollView(padding: MySpacing.fromLTRB(0, 70 + flexSpacing, 0, flexSpacing), key: controller.scrollKey, child: child),
                ),
                const Positioned(top: 0, left: 0, right: 0, child: TopBar()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNotifications() {
    Widget buildNotification(String title, String description) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[MyText.labelLarge(title), MySpacing.height(4), MyText.bodySmall(description)]);
    }

    return MyContainer.bordered(
      paddingAll: 0,
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: MySpacing.xy(16, 12), child: MyText.titleMedium('Notification', fontWeight: 600)),
          MyDashedDivider(height: 1, color: theme.dividerColor, dashSpace: 4, dashWidth: 6),
          Padding(
            padding: MySpacing.xy(16, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[buildNotification('Your order is received', 'Order #1232 is ready to deliver'), MySpacing.height(12), buildNotification('Account Security ', 'Your account password changed 1 hour ago')],
            ),
          ),
          MyDashedDivider(height: 1, color: theme.dividerColor, dashSpace: 4, dashWidth: 6),
          Padding(
            padding: MySpacing.xy(16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MyButton.text(
                  onPressed: () {},
                  splashColor: contentTheme.primary.withAlpha(28),
                  child: MyText.labelSmall('View All', color: contentTheme.primary),
                ),
                MyButton.text(
                  onPressed: () {},
                  splashColor: contentTheme.danger.withAlpha(28),
                  child: MyText.labelSmall('Clear', color: contentTheme.danger),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAccountMenu() {
    return MyContainer.bordered(
      paddingAll: 0,
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: MySpacing.xy(8, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MyButton(
                  onPressed: () => <dynamic, dynamic>{},
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  borderRadiusAll: AppStyle.buttonRadius.medium,
                  padding: MySpacing.xy(8, 4),
                  splashColor: theme.colorScheme.onSurface.withAlpha(20),
                  backgroundColor: Colors.transparent,
                  child: Row(
                    children: <Widget>[
                      Icon(LucideIcons.user, size: 14, color: contentTheme.onBackground),
                      MySpacing.width(8),
                      MyText.labelMedium('My Account', fontWeight: 600),
                    ],
                  ),
                ),
                MySpacing.height(4),
                MyButton(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onPressed: () => <dynamic, dynamic>{},
                  borderRadiusAll: AppStyle.buttonRadius.medium,
                  padding: MySpacing.xy(8, 4),
                  splashColor: theme.colorScheme.onSurface.withAlpha(20),
                  backgroundColor: Colors.transparent,
                  child: Row(
                    children: <Widget>[
                      Icon(LucideIcons.settings, size: 14, color: contentTheme.onBackground),
                      MySpacing.width(8),
                      MyText.labelMedium('Settings', fontWeight: 600),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1),
          Padding(
            padding: MySpacing.xy(8, 8),
            child: MyButton(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: () => <dynamic, dynamic>{},
              borderRadiusAll: AppStyle.buttonRadius.medium,
              padding: MySpacing.xy(8, 4),
              splashColor: contentTheme.danger.withAlpha(28),
              backgroundColor: Colors.transparent,
              child: Row(
                children: <Widget>[
                  Icon(LucideIcons.log_out, size: 14, color: contentTheme.danger),
                  MySpacing.width(8),
                  MyText.labelMedium('Log out', fontWeight: 600, color: contentTheme.danger),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
