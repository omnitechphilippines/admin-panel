// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/tabler.dart';
import '../../app/routes/app_pages.dart';
import '../../helper/services/url_service.dart';
import '../../helper/theme/theme_customizer.dart';
import '../../helper/utils/my_shadow.dart';
import '../../helper/utils/ui_mixins.dart';
import '../../helper/widgets/my_card.dart';
import '../../helper/widgets/my_container.dart';
import '../../helper/widgets/my_spacing.dart';
import '../../helper/widgets/my_text.dart';
import '../../helper/widgets/responsive.dart';
import '../../images.dart';
import '../../themes/app_theme.dart';
import '../../widgets/custom_pop_menu.dart';

typedef LeftbarMenuFunction = void Function(String key);

class LeftbarObserver {
  static Map<String, LeftbarMenuFunction> observers = <String, LeftbarMenuFunction>{};

  static void attachListener(String key, LeftbarMenuFunction fn) {
    observers[key] = fn;
  }

  static void detachListener(String key) {
    observers.remove(key);
  }

  static void notifyAll(String key) {
    for (final LeftbarMenuFunction fn in observers.values) {
      fn(key);
    }
  }
}

class LeftBar extends StatefulWidget {
  final bool isCondensed;

  const LeftBar({super.key, this.isCondensed = false});

  @override
  _LeftBarState createState() => _LeftBarState();
}

class _LeftBarState extends State<LeftBar> with SingleTickerProviderStateMixin, UIMixin {
  final ThemeCustomizer customizer = ThemeCustomizer.instance;

  bool isCondensed = false;
  String path = UrlService.getCurrentUrl();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isCondensed = widget.isCondensed;
    return MyCard(
      paddingAll: 0,
      shadow: MyShadow(position: MyShadowPosition.centerRight, elevation: 0.2),
      child: AnimatedContainer(
        color: leftBarTheme.background,
        width: isCondensed ? 70 : 244,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 70,
              child: Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () => Get.toNamed(Routes.DASHBOARD),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          if (widget.isCondensed) Image.asset(Images.logoSm, height: 19),
                          if (!widget.isCondensed)
                            Row(
                              children: <Widget>[
                                Image.asset(Images.logoSm, height: 24),
                                MySpacing.width(10),
                                MyText.titleLarge('Omni', fontWeight: 900, color: contentTheme.light),
                              ],
                            ),
                        ],
                      ),
                    ),
                    if (!widget.isCondensed) const Spacer(),
                    if (!widget.isCondensed)
                      InkWell(
                        splashColor: theme.colorScheme.onSurface,
                        highlightColor: theme.colorScheme.onSurface,
                        onTap: () => ThemeCustomizer.toggleLeftBarCondensed(),
                        child: Iconify(Tabler.menu_2, color: contentTheme.light.withValues(alpha: 0.6)),
                      ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    labelWidget('Menu'),
                    NavigationItem(iconData: LucideIcons.house, title: 'Dashboard', isCondensed: isCondensed, route: '/dashboard', label: '9+', labelColor: contentTheme.success),
                    labelWidget('APPS'),
                    NavigationItem(iconData: LucideIcons.message_square_text, title: 'Chat', isCondensed: isCondensed, route: '/chat'),
                    NavigationItem(iconData: LucideIcons.mail, title: 'Email', isCondensed: isCondensed, route: '/email'),
                    MenuWidget(
                      iconData: LucideIcons.calendar_days,
                      isCondensed: isCondensed,
                      title: 'Calendar',
                      children: <MenuItem>[
                        MenuItem(title: 'Schedule', route: '/calendar/schedule', isCondensed: widget.isCondensed),
                        MenuItem(title: 'Integration', route: '/calendar/integration', isCondensed: widget.isCondensed),
                      ],
                    ),
                    NavigationItem(iconData: LucideIcons.list_todo, title: 'Todo', isCondensed: isCondensed, route: '/todo'),
                    MenuWidget(
                      iconData: LucideIcons.file_text,
                      isCondensed: isCondensed,
                      title: 'Invoice',
                      children: <MenuItem>[
                        MenuItem(title: 'Invoice List', route: '/invoice/list', isCondensed: widget.isCondensed),
                        MenuItem(title: 'Invoice Details', route: '/invoice/details', isCondensed: widget.isCondensed),
                      ],
                    ),
                    labelWidget('CUSTOM'),
                    MenuWidget(
                      iconData: LucideIcons.folder_closed,
                      isCondensed: isCondensed,
                      title: 'Pages',
                      children: <MenuItem>[
                        MenuItem(title: 'Coming Soon', route: '/pages/coming-soon', isCondensed: widget.isCondensed),
                        MenuItem(title: 'FAQs', route: '/pages/faqs', isCondensed: widget.isCondensed),
                        MenuItem(title: 'Maintenance', route: '/pages/maintenance', isCondensed: widget.isCondensed),
                        MenuItem(title: 'Not Found', route: '/pages/not-found', isCondensed: widget.isCondensed),
                        MenuItem(title: 'Pricing', route: '/pages/pricing', isCondensed: widget.isCondensed),
                        MenuItem(title: 'Timeline', route: '/pages/timeline', isCondensed: widget.isCondensed),
                      ],
                    ),
                    // MenuWidget(
                    //   iconData: LucideIcons.lock_keyhole,
                    //   isCondensed: isCondensed,
                    //   title: 'Authentication',
                    //   children: <MenuItem>[
                    //     MenuItem(title: 'Sign In', route: '/auth/login', isCondensed: widget.isCondensed),
                    //     MenuItem(title: 'Sign Up', route: '/auth/sign_up', isCondensed: widget.isCondensed),
                    //     MenuItem(title: 'Reset Password', route: '/auth/reset_password', isCondensed: widget.isCondensed),
                    //     MenuItem(title: 'Lock Screen', route: '/auth/lock', isCondensed: widget.isCondensed),
                    //   ],
                    // ),
                    NavigationItem(iconData: LucideIcons.gift, title: 'Widgets', route: '/widgets', isCondensed: isCondensed, label: 'Hot', labelColor: contentTheme.danger),
                    labelWidget('Components'),
                    MenuWidget(
                      iconData: LucideIcons.flame_kindling,
                      isCondensed: isCondensed,
                      title: 'Base UI',
                      children: <MenuItem>[
                        MenuItem(title: 'Accordion', route: '/base-ui/accordion', isCondensed: widget.isCondensed),
                        MenuItem(title: 'Alert', route: '/base-ui/alert', isCondensed: widget.isCondensed),
                        MenuItem(title: 'Avatar', route: '/base-ui/avatar', isCondensed: widget.isCondensed),
                        MenuItem(title: 'Badge', route: '/base-ui/badge', isCondensed: widget.isCondensed),
                        MenuItem(title: 'Breadcrumb', route: '/base-ui/breadcrumb', isCondensed: widget.isCondensed),
                        MenuItem(title: 'Button', route: '/base-ui/button', isCondensed: widget.isCondensed),
                        MenuItem(title: 'Card', route: '/base-ui/card', isCondensed: widget.isCondensed),
                        MenuItem(title: 'Carousel', route: '/base-ui/carousel', isCondensed: widget.isCondensed),
                        MenuItem(title: 'Collapse', route: '/base-ui/collapse', isCondensed: widget.isCondensed),
                        MenuItem(title: 'Dropdown', route: '/base-ui/dropdown', isCondensed: widget.isCondensed),
                        MenuItem(title: 'List Group', route: '/base-ui/list-group', isCondensed: widget.isCondensed),
                        MenuItem(title: 'Modal', route: '/base-ui/modal', isCondensed: widget.isCondensed),
                        MenuItem(title: 'Pagination', route: '/base-ui/pagination', isCondensed: widget.isCondensed),
                        MenuItem(title: 'Placeholder', route: '/base-ui/placeholder', isCondensed: widget.isCondensed),
                        MenuItem(title: 'Progress', route: '/base-ui/progress', isCondensed: widget.isCondensed),
                        MenuItem(title: 'Spinner', route: '/base-ui/spinner', isCondensed: widget.isCondensed),
                        MenuItem(title: 'Tabs', route: '/base-ui/tabs', isCondensed: widget.isCondensed),
                        MenuItem(title: 'Toast', route: '/base-ui/toast', isCondensed: widget.isCondensed),
                        MenuItem(title: 'Tooltip', route: '/base-ui/tooltip', isCondensed: widget.isCondensed),
                      ],
                    ),
                    MenuWidget(
                      iconData: LucideIcons.pencil_ruler,
                      isCondensed: isCondensed,
                      title: 'Advance UI',
                      children: <MenuItem>[
                        MenuItem(title: 'Rating', route: '/advance-ui/rating', isCondensed: widget.isCondensed),
                        MenuItem(title: 'Sweet Alert', route: '/advance-ui/sweet-alert', isCondensed: widget.isCondensed),
                        MenuItem(title: 'Scrollbar', route: '/advance-ui/scrollbar', isCondensed: widget.isCondensed),
                      ],
                    ),
                    NavigationItem(iconData: LucideIcons.chart_area, title: 'Charts', isCondensed: isCondensed, route: '/charts'),
                    MenuWidget(
                      iconData: LucideIcons.list_checks,
                      isCondensed: isCondensed,
                      title: 'Forms',
                      children: <MenuItem>[
                        MenuItem(title: 'Basic Element', route: '/forms/basic-element', isCondensed: widget.isCondensed),
                        MenuItem(title: 'Checkbox & Radio', route: '/forms/checkbox-radio', isCondensed: widget.isCondensed),
                        MenuItem(title: 'Editor', route: '/forms/editor', isCondensed: widget.isCondensed),
                        MenuItem(title: 'File Upload', route: '/forms/file-upload', isCondensed: widget.isCondensed),
                        MenuItem(title: 'Form Mask', route: '/forms/form-mask', isCondensed: widget.isCondensed),
                        MenuItem(title: 'Slider', route: '/forms/slider', isCondensed: widget.isCondensed),
                        MenuItem(title: 'Validation', route: '/forms/validation', isCondensed: widget.isCondensed),
                        MenuItem(title: 'Wizard', route: '/forms/wizard', isCondensed: widget.isCondensed),
                      ],
                    ),
                    MenuWidget(
                      iconData: LucideIcons.table_properties,
                      isCondensed: isCondensed,
                      title: 'Tables',
                      children: <MenuItem>[MenuItem(title: 'Basic Table', route: '/tables/basic', isCondensed: widget.isCondensed)],
                    ),
                    NavigationItem(iconData: LucideIcons.bike, title: 'Icons', isCondensed: isCondensed, route: '/icons'),
                    NavigationItem(iconData: LucideIcons.map_pin, title: 'Maps', isCondensed: isCondensed, route: '/maps'),
                    NavigationItem(iconData: LucideIcons.volleyball, title: 'Badge Menu', isCondensed: isCondensed, label: '1', labelColor: contentTheme.primary),
                    MenuWidget(
                      iconData: LucideIcons.share_2,
                      isCondensed: isCondensed,
                      title: 'Menu item',
                      children: <MenuItem>[MenuItem(title: 'Menu item 1', isCondensed: widget.isCondensed)],
                    ),
                    MySpacing.height(32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget labelWidget(String label) {
    return isCondensed
        ? MySpacing.empty()
        : Container(
            padding: MySpacing.xy(24, 8),
            child: MyText.labelSmall(label.toUpperCase(), color: leftBarTheme.labelColor, muted: true, maxLines: 1, overflow: TextOverflow.clip, fontWeight: 700),
          );
  }
}

class MenuWidget extends StatefulWidget {
  final IconData iconData;
  final String title;
  final bool isCondensed;
  final bool active;
  final List<MenuItem> children;

  const MenuWidget({super.key, required this.iconData, required this.title, this.isCondensed = false, this.active = false, this.children = const <MenuItem>[]});

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> with UIMixin, SingleTickerProviderStateMixin {
  bool isHover = false;
  bool isActive = false;
  late Animation<double> _iconTurns;
  late AnimationController _controller;
  bool popupShowing = true;
  Function? hideFn;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 200), vsync: this);
    _iconTurns = _controller.drive(Tween<double>(begin: 0.0, end: 0.5).chain(CurveTween(curve: Curves.easeIn)));
    LeftbarObserver.attachListener(widget.title, onChangeMenuActive);
  }

  void onChangeMenuActive(String key) {
    if (key != widget.title) {
      // onChangeExpansion(false);
    }
  }

  void onChangeExpansion(bool value) {
    isActive = value;
    if (isActive) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final dynamic route = UrlService.getCurrentUrl();
    isActive = widget.children.any((MenuItem element) => element.route == route);
    onChangeExpansion(isActive);
    if (hideFn != null) {
      hideFn!();
    }
    // popupShowing = false;
  }

  @override
  Widget build(BuildContext context) {
    // var route = Uri.base.fragment;
    // isActive = widget.children.any((element) => element.route == route);

    if (widget.isCondensed) {
      return CustomPopupMenu(
        backdrop: true,
        show: popupShowing,
        hideFn: (Function hide) => hideFn = hide,
        onChange: (bool value) {
          popupShowing = value;
        },
        placement: CustomPopupMenuPlacement.right,
        menu: MouseRegion(
          cursor: SystemMouseCursors.click,
          onHover: (PointerHoverEvent event) {
            setState(() {
              isHover = true;
            });
          },
          onExit: (PointerExitEvent event) {
            setState(() {
              isHover = false;
            });
          },
          child: MyContainer.transparent(
            margin: MySpacing.fromLTRB(16, 0, 16, 8),
            color: isActive || isHover ? leftBarTheme.activeItemBackground : Colors.transparent,
            padding: MySpacing.xy(8, 8),
            child: Center(child: Icon(widget.iconData, color: (isHover || isActive) ? leftBarTheme.activeItemColor : leftBarTheme.onBackground, size: 20)),
          ),
        ),
        menuBuilder: (_) => MyContainer.bordered(
          paddingAll: 8,
          width: 190,
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisSize: MainAxisSize.min, children: widget.children),
        ),
      );
    } else {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        onHover: (PointerHoverEvent event) {
          setState(() {
            isHover = true;
          });
        },
        onExit: (PointerExitEvent event) {
          setState(() {
            isHover = false;
          });
        },
        child: Padding(
          padding: MySpacing.fromLTRB(24, 0, 16, 0),
          child: ListTileTheme(
            contentPadding: const EdgeInsets.all(0),
            dense: true,
            horizontalTitleGap: 0.0,
            minLeadingWidth: 0,
            child: ExpansionTile(
              tilePadding: MySpacing.zero,
              initiallyExpanded: isActive,
              maintainState: true,
              onExpansionChanged: (bool value) {
                LeftbarObserver.notifyAll(widget.title);
                onChangeExpansion(value);
              },
              trailing: RotationTransition(
                turns: _iconTurns,
                child: Icon(Icons.expand_more, size: 18, color: leftBarTheme.onBackground),
              ),
              iconColor: leftBarTheme.activeItemColor,
              childrenPadding: MySpacing.x(12),
              title: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(widget.iconData, size: 18, color: isHover || isActive ? leftBarTheme.activeItemColor : leftBarTheme.onBackground),
                  MySpacing.width(18),
                  Expanded(
                    child: MyText.labelLarge(widget.title, maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.start, color: isHover || isActive ? leftBarTheme.activeItemColor : leftBarTheme.onBackground),
                  ),
                ],
              ),
              collapsedBackgroundColor: Colors.transparent,
              shape: const RoundedRectangleBorder(side: BorderSide(color: Colors.transparent)),
              backgroundColor: Colors.transparent,
              children: widget.children,
            ),
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    // LeftbarObserver.detachListener(widget.title);
  }
}

class MenuItem extends StatefulWidget {
  final IconData? iconData;
  final String title;
  final bool isCondensed;
  final String? route;

  const MenuItem({super.key, this.iconData, required this.title, this.isCondensed = false, this.route});

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> with UIMixin {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final bool isActive = UrlService.getCurrentUrl() == widget.route;
    return GestureDetector(
      onTap: () {
        if (widget.route != null) {
          Get.toNamed(widget.route!);
        }
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onHover: (PointerHoverEvent event) {
          setState(() {
            isHover = true;
          });
        },
        onExit: (PointerExitEvent event) {
          setState(() {
            isHover = false;
          });
        },
        child: MyContainer.transparent(
          margin: MySpacing.fromLTRB(4, 0, 8, 4),
          color: isActive || isHover ? leftBarTheme.activeItemBackground : Colors.transparent,
          width: MediaQuery.of(context).size.width,
          padding: MySpacing.xy(18, 7),
          child: MyText.bodySmall(
            "${widget.isCondensed ? "" : "- "}  ${widget.title}",
            overflow: TextOverflow.clip,
            maxLines: 1,
            textAlign: TextAlign.left,
            fontSize: 12.5,
            color: isActive || isHover ? leftBarTheme.activeItemColor : leftBarTheme.onBackground,
            fontWeight: isActive || isHover ? 600 : 500,
          ),
        ),
      ),
    );
  }
}

class NavigationItem extends StatefulWidget {
  final IconData? iconData;
  final String title;
  final bool isCondensed;
  final String? route;
  final String? label;
  final Color? labelColor;

  const NavigationItem({super.key, this.iconData, required this.title, this.isCondensed = false, this.route, this.label, this.labelColor});

  @override
  _NavigationItemState createState() => _NavigationItemState();
}

class _NavigationItemState extends State<NavigationItem> with UIMixin {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final bool isActive = UrlService.getCurrentUrl() == widget.route;
    return GestureDetector(
      onTap: () {
        if (widget.route != null) {
          Get.toNamed(widget.route!);
        }
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onHover: (PointerHoverEvent event) {
          setState(() {
            isHover = true;
          });
        },
        onExit: (PointerExitEvent event) {
          setState(() {
            isHover = false;
          });
        },
        child: MyContainer.transparent(
          margin: MySpacing.fromLTRB(8, 0, 8, 8),
          color: isActive || isHover ? leftBarTheme.activeItemBackground : Colors.transparent,
          padding: MySpacing.xy(16, 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if (widget.iconData != null) Center(child: Icon(widget.iconData, color: (isHover || isActive) ? leftBarTheme.activeItemColor : leftBarTheme.onBackground, size: 18)),
              if (!widget.isCondensed) Flexible(fit: FlexFit.loose, child: MySpacing.width(16)),
              if (!widget.isCondensed)
                Expanded(
                  flex: 8,
                  child: MyText.labelLarge(widget.title, overflow: TextOverflow.clip, maxLines: 1, color: isActive || isHover ? leftBarTheme.activeItemColor : leftBarTheme.onBackground),
                ),
              if (!widget.isCondensed && widget.label != null)
                MyContainer(
                  paddingAll: 4,
                  color: widget.labelColor,
                  child: MyText.labelSmall(widget.label ?? '', color: contentTheme.light),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
