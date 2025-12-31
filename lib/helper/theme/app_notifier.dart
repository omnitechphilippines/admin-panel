import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../themes/app_theme.dart';
import '../localization/language.dart';
import '../storage/local_storage.dart';
import 'theme_customizer.dart';
import 'theme_type.dart';
import '../widgets/my.dart';

class AppNotifier extends ChangeNotifier {
  AppNotifier();

  Future<void> init() async {
    _changeTheme();
    notifyListeners();
  }

  void updateTheme(ThemeCustomizer themeCustomizer) {
    _changeTheme();

    notifyListeners();

    LocalStorage.setCustomizer(themeCustomizer);
  }

  Future<void> updateInStorage(ThemeCustomizer themeCustomizer) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("theme_customizer", themeCustomizer.toJSON());
  }

  void changeDirectionality(TextDirection textDirection, [bool notify = true]) {
    AppTheme.textDirection = textDirection;
    My.setTextDirection(textDirection);

    if (notify) {
      notifyListeners();
    }
  }

  Future<void> changeLanguage(Language language, {bool notify = true, bool changeDirection = true}) async {
    if (changeDirection) {
      if (language.supportRTL) {
        changeDirectionality(TextDirection.rtl, false);
      } else {
        changeDirectionality(TextDirection.ltr, false);
      }
    }

    await ThemeCustomizer.changeLanguage(language);

    if (notify) {
      notifyListeners();
    }
  }

  void _changeTheme() {
    AppTheme.themeType = ThemeCustomizer.instance.theme == ThemeMode.light ? ThemeType.light : ThemeType.dark;
    AppTheme.theme = AppTheme.getTheme();
  }
}
