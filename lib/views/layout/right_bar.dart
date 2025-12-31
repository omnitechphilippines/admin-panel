import 'package:flutter/material.dart';
import '../../helper/theme/theme_customizer.dart';
import '../../helper/utils/ui_mixins.dart';
import '../../helper/widgets/my_spacing.dart';
import '../../helper/widgets/my_text.dart';
import '../../themes/app_theme.dart';
import '../../widgets/custom_switch.dart';

class RightBar extends StatefulWidget {
  // final RightBarThemeType rightBarThemeType;
  // final LeftBarThemeType leftBarThemeType;
  // final TopBarThemeType topBarThemeType;
  // final ContentThemeType contentThemeType;
  // final OnLeftBarColorSchemeChange onLeftBarColorSchemeChange;
  // final OnTopBarColorSchemeChange onTopBarColorSchemeChange;
  // final OnRightBarColorSchemeChange onRightBarColorSchemeChange;
  // final OnContentSchemeChange onContentSchemeChange;

  const RightBar({
    super.key, // this.leftBarThemeType,
    // this.topBarThemeType,
    // this.contentThemeType,
    // this.onLeftBarColorSchemeChange,
    // this.onTopBarColorSchemeChange,
    // this.onContentSchemeChange,
    // this.onRightBarColorSchemeChange
  });

  @override
  _RightBarState createState() => _RightBarState();
}

class _RightBarState extends State<RightBar> with SingleTickerProviderStateMixin, UIMixin {
  ThemeCustomizer customizer = ThemeCustomizer.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    customizer = ThemeCustomizer.instance;
    return Container(
      width: 280,
      color: theme.colorScheme.surface,
      child: Column(
        children: <Widget>[
          Container(
            height: 60,
            alignment: Alignment.centerLeft,
            padding: MySpacing.x(24),
            color: theme.colorScheme.primaryContainer,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(child: MyText.labelLarge('Settings', color: theme.colorScheme.onPrimaryContainer)),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.close, size: 18, color: theme.colorScheme.onPrimaryContainer),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: MySpacing.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MyText.labelMedium('Color Scheme'),
                  const Divider(),
                  MySpacing.height(8),
                  Row(
                    children: <Widget>[
                      CustomSwitch.small(
                        value: customizer.theme == ThemeMode.light,
                        onChanged: (bool value) {
                          ThemeCustomizer.setTheme(ThemeMode.light);
                        },
                      ),
                      MySpacing.width(12),
                      const Text('Light'),
                    ],
                  ),
                  MySpacing.height(8),
                  Row(
                    children: <Widget>[
                      CustomSwitch.small(
                        value: customizer.theme == ThemeMode.dark,
                        onChanged: (bool value) {
                          ThemeCustomizer.setTheme(ThemeMode.dark);
                        },
                      ),
                      MySpacing.width(12),
                      const Text('Dark'),
                    ],
                  ),
                  const Divider(),
                  const Text('Top Bar'),
                  const Divider(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
