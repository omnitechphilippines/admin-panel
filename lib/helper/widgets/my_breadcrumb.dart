import 'package:flutter/material.dart';
import '../../themes/app_theme.dart';
import 'my_breadcrumb_item.dart';
import 'my_constant.dart';
import 'my_responsiv.dart';
import 'my_router.dart';
import 'my_screen_media_type.dart';
import 'my_spacing.dart';
import 'my_text.dart';

class MyBreadcrumb extends StatelessWidget {
  final List<MyBreadcrumbItem> children;
  final bool hideOnMobile;

  MyBreadcrumb({super.key, required this.children, this.hideOnMobile = true}) {
    if (MyConstant.constant.defaultBreadCrumbItem != null) {
      children.insert(0, MyConstant.constant.defaultBreadCrumbItem!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> list = <Widget>[];
    for (int i = 0; i < children.length; i++) {
      final MyBreadcrumbItem item = children[i];
      if (item.active || item.route == null) {
        list.add(MyText.labelMedium(children[i].name, fontWeight: 500, fontSize: 13, letterSpacing: 0));
      } else {
        list.add(
          InkWell(
            onTap: () => <Future<Object?>>{if (item.route != null) MyRouter.pushReplacementNamed(context, item.route!)},
            child: MyText.labelMedium(children[i].name, fontWeight: 500, fontSize: 13, letterSpacing: 0, color: theme.colorScheme.primary),
          ),
        );
      }
      if (i < children.length - 1) {
        list.add(MySpacing.width(10));
        list.add(MyText('>'));
        list.add(MySpacing.width(10));
      }
    }
    return MyResponsive(
      builder: (_, _, MyScreenMediaType type) {
        return type.isMobile && hideOnMobile ? const SizedBox() : Row(mainAxisSize: MainAxisSize.min, children: list);
      },
    );
  }
}
