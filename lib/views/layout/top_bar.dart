import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import '../../helper/theme/theme_customizer.dart';
import '../../helper/utils/my_shadow.dart';
import '../../helper/utils/ui_mixins.dart';
import '../../helper/widgets/my_button.dart';
import '../../helper/widgets/my_card.dart';
import '../../helper/widgets/my_container.dart';
import '../../helper/widgets/my_spacing.dart';
import '../../helper/widgets/my_text.dart';
import '../../helper/widgets/my_text_style.dart';
import '../../images.dart';
import '../../themes/app_theme.dart';
import '../../widgets/custom_pop_menu.dart';
// import 'package:universal_html/html.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> with SingleTickerProviderStateMixin, UIMixin {
  bool isFullScreen = false;
  Function? hideFn;

  void goFullScreen() {
    // if (isFullScreen) {
    //   document.exitFullscreen();
    // } else {
    //   document.documentElement!.requestFullscreen();
    // }
    // setState(() {
    //   isFullScreen = !isFullScreen;
    // });
  }

  final List<Map<String, String>> notifications = <Map<String, String>>[
    <String, String>{'avatar': Images.avatars[0], 'comment': 'Josephine Thompson commented on admin panel "Wow 😍! this admin looks good and awesome design"'},
    <String, String>{'name': 'Donoghue Susan', 'comment': 'Hi, How are you? What about our next meeting'},
    <String, String>{'avatar': Images.avatars[2], 'name': 'Jacob Gines', 'comment': "Answered to your comment on the cash flow forecast's graph 🔔."},
    <String, String>{
      'icon': 'solar:leaf-bold-duotone',
      'comment': 'You have received 20 new messages in the conversation',
      // "name": "You have received <b>20</b> new messages in the conversation"
    },
    <String, String>{'avatar': Images.avatars[3], 'name': 'Shawn Bunch', 'comment': 'Commented on Admin'},
  ];

  @override
  Widget build(BuildContext context) {
    return MyCard(
      shadow: MyShadow(position: MyShadowPosition.bottomRight, elevation: 0.2),
      height: 68,
      borderRadiusAll: 0,
      paddingAll: 0,
      color: topBarTheme.background.withAlpha(246),
      child: Row(
        children: <Widget>[
          Padding(padding: MySpacing.left(16), child: _buildMenu()),
          Expanded(child: _buildActions()),
        ],
      ),
    );
  }

  Widget _buildMenu() {
    return Row(
      children: <Widget>[
        ThemeCustomizer.instance.leftBarCondensed
            ? InkWell(
                splashColor: theme.colorScheme.onSurface,
                highlightColor: theme.colorScheme.onSurface,
                onTap: () => ThemeCustomizer.toggleLeftBarCondensed(),
                child: Icon(LucideIcons.menu, color: topBarTheme.onBackground),
              )
            : const SizedBox(),
        if (ThemeCustomizer.instance.leftBarCondensed) MySpacing.width(20),
        _buildSearchField(),
      ],
    );
  }

  Widget _buildSearchField() {
    return SizedBox(
      width: 230,
      child: TextFormField(
        maxLines: 1,
        style: MyTextStyle.bodyMedium(),
        decoration: InputDecoration(
          hintText: 'Search...',
          hintStyle: MyTextStyle.labelMedium(muted: true),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
          filled: true,
          fillColor: contentTheme.background,
          prefixIcon: const Align(alignment: Alignment.center, child: Icon(TablerIcons.search, size: 16)),
          prefixIconConstraints: const BoxConstraints(minWidth: 36, maxWidth: 36, minHeight: 32, maxHeight: 32),
          contentPadding: MySpacing.xy(16, 14),
          isCollapsed: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
      ),
    );
  }

  Widget _buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        _buildThemeToggle(),
        MySpacing.width(12),
        _buildFullScreenToggle(),
        MySpacing.width(12),
        CustomPopupMenu(
          backdrop: true,
          hideFn: (Function hide) => hideFn = hide,
          onChange: (_) {},
          offsetX: -230,
          offsetY: 40,
          placement: CustomPopupMenuPlacement.right,
          menu: SizedBox(
            height: 36,
            width: 36,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Icon(TablerIcons.bell, color: topBarTheme.onBackground, size: 26),
                Positioned(
                  top: 0,
                  right: 0,
                  child: MyContainer.rounded(
                    color: contentTheme.danger,
                    paddingAll: 4,
                    child: MyText.labelMedium(notifications.length.toString(), color: contentTheme.onDanger),
                  ),
                ),
              ],
            ),
          ),
          menuBuilder: (_) => _buildNotificationIcon(),
        ),
        MySpacing.width(12),
        Icon(LucideIcons.settings, color: topBarTheme.onBackground),
        MySpacing.width(12),
        Padding(padding: MySpacing.right(16), child: _buildAccountMenu()),
      ],
    );
  }

  Widget _buildThemeToggle() {
    return InkWell(
      onTap: () => ThemeCustomizer.setTheme(ThemeCustomizer.instance.theme == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark),
      child: Icon(ThemeCustomizer.instance.theme == ThemeMode.dark ? TablerIcons.sun : TablerIcons.moon, color: topBarTheme.onBackground, size: 26),
    );
  }

  Widget _buildFullScreenToggle() {
    return InkWell(
      onTap: goFullScreen,
      child: Icon(isFullScreen ? TablerIcons.minimize : TablerIcons.maximize, color: topBarTheme.onBackground, size: 26),
    );
  }

  Widget _buildNotificationIcon() {
    return MyContainer(
      paddingAll: 0,
      width: 320,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: MySpacing.x(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MyText.bodyMedium('Notification', fontWeight: 600),
                MyButton.text(
                  padding: MySpacing.xy(8, 12),
                  onPressed: () => hideFn?.call(),
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: MyText.labelSmall('Clear All', xMuted: true, decoration: TextDecoration.underline),
                ),
              ],
            ),
          ),
          const Divider(height: 0),
          MyContainer(
            height: 300,
            paddingAll: 0,
            child: ListView.separated(
              itemCount: notifications.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final Map<String, String> notification = notifications[index];
                return MyButton(
                  backgroundColor: Colors.transparent,
                  msBackgroundColor: const WidgetStatePropertyAll<Color>(Colors.transparent),
                  // msShadowColor: WidgetStatePropertyAll(Colors.transparent),
                  onPressed: () {},
                  padding: MySpacing.zero,
                  msPadding: WidgetStatePropertyAll(MySpacing.zero),
                  splashColor: contentTheme.secondary.withValues(alpha: 0.1),
                  child: Padding(
                    padding: MySpacing.all(20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        MyContainer.rounded(
                          height: 36,
                          width: 36,
                          paddingAll: 0,
                          color: notification['name'] == null ? contentTheme.success.withValues(alpha: 0.2) : contentTheme.primary.withValues(alpha: 0.2),
                          child: notification['avatar'] != null
                              ? Image.asset(notification['avatar']!)
                              : Center(child: notification['name'] == null ? SvgPicture.asset('assets/other/leaf.svg', height: 20, width: 20) : MyText.titleMedium(notification['name']![0].toUpperCase(), color: contentTheme.primary)),
                        ),
                        MySpacing.width(12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              if (notification['name'] != null) MyText.bodyMedium(notification['name'] ?? '', fontWeight: 600),
                              if (notification['name'] != null) MySpacing.height(4),
                              MyText.bodySmall(notification['comment'] ?? '', fontWeight: 600),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(height: 0);
              },
            ),
          ),
          const Divider(height: 0),
          SizedBox(
            height: 60,
            child: Center(
              child: MyButton.small(
                onPressed: () => hideFn?.call(),
                elevation: 0,
                padding: MySpacing.all(8),
                backgroundColor: contentTheme.primary,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    MyText.labelMedium('View all notification', fontWeight: 600, color: contentTheme.onPrimary),
                    MySpacing.width(8),
                    Icon(LucideIcons.arrow_right, size: 16, color: contentTheme.onPrimary),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountMenu() {
    return CustomPopupMenu(
      backdrop: true,
      onChange: (_) {},
      offsetX: -120,
      offsetY: 8,
      menu: Padding(
        padding: MySpacing.xy(8, 8),
        child: MyContainer.rounded(paddingAll: 0, child: Image.asset(Images.avatars[0], height: 32, width: 32, fit: BoxFit.cover)),
      ),
      menuBuilder: (_) => buildAccountMenuContent(),
    );
  }

  Widget buildAccountMenuContent() {
    return MyContainer.bordered(
      paddingAll: 0,
      child: Padding(
        padding: MySpacing.x(12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[MyText.bodyMedium('Welcome Omni!', fontWeight: 600, xMuted: true)]),
      ),
    );
  }
}
