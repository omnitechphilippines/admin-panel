import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helper/theme/theme_type.dart';
import '../helper/widgets/my_text_style.dart';

ThemeData get theme => AppTheme.theme;

class AppTheme {
  static ThemeType themeType = ThemeType.light;
  static TextDirection textDirection = TextDirection.ltr;

  static ThemeData theme = getTheme();

  AppTheme._();

  static void init() {
    initTextStyle();
  }

  static void initTextStyle() {
    MyTextStyle.changeFontFamily(GoogleFonts.publicSans);
    MyTextStyle.changeDefaultFontWeight(<int, FontWeight>{
      100: FontWeight.w100,
      200: FontWeight.w200,
      300: FontWeight.w300,
      400: FontWeight.w300,
      500: FontWeight.w400,
      600: FontWeight.w500,
      700: FontWeight.w600,
      800: FontWeight.w700,
      900: FontWeight.w800,
    });

    MyTextStyle.changeDefaultTextFontWeight(<MyTextType, int>{
      MyTextType.displayLarge: 500,
      MyTextType.displayMedium: 500,
      MyTextType.displaySmall: 500,
      MyTextType.headlineLarge: 500,
      MyTextType.headlineMedium: 500,
      MyTextType.headlineSmall: 500,
      MyTextType.titleLarge: 500,
      MyTextType.titleMedium: 500,
      MyTextType.titleSmall: 500,
      MyTextType.labelLarge: 500,
      MyTextType.labelMedium: 500,
      MyTextType.labelSmall: 500,
      MyTextType.bodyLarge: 500,
      MyTextType.bodyMedium: 500,
      MyTextType.bodySmall: 500,
    });
  }

  static ThemeData getTheme([ThemeType? themeType]) {
    themeType = themeType ?? AppTheme.themeType;
    return themeType == ThemeType.light ? lightTheme : darkTheme;
  }

  /// -------------------------- Light Theme  -------------------------------------------- ///
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: false,

    /// Brightness
    brightness: Brightness.light,

    /// Primary Color
    primaryColor: const Color(0xff1e84c4),
    scaffoldBackgroundColor: const Color(0xfff0f0f0),
    canvasColor: Colors.transparent,

    /// AppBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xffffffff),
      iconTheme: IconThemeData(color: Color(0xff495057)),
      actionsIconTheme: IconThemeData(color: Color(0xff495057)),
    ),

    /// Card Theme
    cardTheme: const CardThemeData(color: Color(0xffffffff)),
    cardColor: const Color(0xffffffff),

    /// Floating Action Theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: const Color(0xff1e84c4),
      splashColor: const Color(0xffeeeeee).withAlpha(100),
      highlightElevation: 8,
      elevation: 4,
      focusColor: const Color(0xff1e84c4),
      hoverColor: const Color(0xff1e84c4),
      foregroundColor: const Color(0xffeeeeee),
    ),

    /// Divider Theme
    dividerTheme: const DividerThemeData(color: Color(0xffe8e8e8), thickness: 1),
    dividerColor: const Color(0xffe8e8e8),

    /// Bottom AppBar Theme
    bottomAppBarTheme: const BottomAppBarThemeData(color: Color(0xffeeeeee), elevation: 2),

    /// Tab bar Theme
    tabBarTheme: const TabBarThemeData(
      unselectedLabelColor: Color(0xff495057),
      labelColor: Color(0xff1e84c4),
      indicatorSize: TabBarIndicatorSize.label,
      indicator: UnderlineTabIndicator(borderSide: BorderSide(color: Color(0xff1e84c4), width: 2.0)),
    ),

    /// CheckBox theme
    checkboxTheme: CheckboxThemeData(checkColor: WidgetStateProperty.all(const Color(0xffeeeeee)), fillColor: WidgetStateProperty.all(const Color(0xff1e84c4))),

    /// Radio theme
    radioTheme: RadioThemeData(fillColor: WidgetStateProperty.all(const Color(0xff1e84c4))),

    ///Switch Theme
    switchTheme: SwitchThemeData(
      trackColor: WidgetStateProperty.resolveWith((Set<WidgetState> state) {
        const Set<WidgetState> interactiveStates = <WidgetState>{WidgetState.pressed, WidgetState.hovered, WidgetState.focused, WidgetState.selected};
        if (state.any(interactiveStates.contains)) {
          return const Color(0xffabb3ea);
        }
        return null;
      }),
      thumbColor: WidgetStateProperty.resolveWith((Set<WidgetState> state) {
        const Set<WidgetState> interactiveStates = <WidgetState>{WidgetState.pressed, WidgetState.hovered, WidgetState.focused, WidgetState.selected};
        if (state.any(interactiveStates.contains)) {
          return const Color(0xff1e84c4);
        }
        return null;
      }),
    ),

    /// Slider Theme
    sliderTheme: SliderThemeData(
      activeTrackColor: const Color(0xff1e84c4),
      inactiveTrackColor: const Color(0xff1e84c4).withAlpha(140),
      trackShape: const RoundedRectSliderTrackShape(),
      trackHeight: 4.0,
      thumbColor: const Color(0xff1e84c4),
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
      tickMarkShape: const RoundSliderTickMarkShape(),
      inactiveTickMarkColor: Colors.red[100],
      valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
      valueIndicatorTextStyle: const TextStyle(color: Color(0xffeeeeee)),
    ),

    /// Other Colors
    splashColor: Colors.white.withAlpha(100),
    highlightColor: const Color(0xffeeeeee),
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff1e84c4), brightness: Brightness.light).copyWith(surface: const Color(0xffffffff)).copyWith(error: const Color(0xfff0323c)),
  );

  /// -------------------------- Dark Theme  -------------------------------------------- ///
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: false,

    /// Brightness
    brightness: Brightness.dark,

    /// Primary Color
    primaryColor: const Color(0xff1e84c4),

    /// Scaffold and Background color
    scaffoldBackgroundColor: const Color(0xff23282e),
    canvasColor: Colors.transparent,

    /// AppBar Theme
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xff161616)),

    /// Card Theme
    cardTheme: const CardThemeData(color: Color(0xff282f37)),
    cardColor: const Color(0xff222327),

    /// Input (Text-Field) Theme
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 1, color: Color(0xff1e84c4)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 1, color: Colors.white70),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 1, color: Colors.white70),
      ),
    ),

    /// Divider Color
    dividerTheme: const DividerThemeData(color: Color(0xff363636), thickness: 1),
    dividerColor: const Color(0xff363636),

    /// Floating Action Theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: const Color(0xff1e84c4),
      splashColor: Colors.white.withAlpha(100),
      highlightElevation: 8,
      elevation: 4,
      focusColor: const Color(0xff1e84c4),
      hoverColor: const Color(0xff1e84c4),
      foregroundColor: Colors.white,
    ),

    /// Bottom AppBar Theme
    bottomAppBarTheme: const BottomAppBarThemeData(color: Color(0xff464c52), elevation: 2),

    /// Tab bar Theme
    tabBarTheme: const TabBarThemeData(
      unselectedLabelColor: Color(0xff495057),
      labelColor: Color(0xff1e84c4),
      indicatorSize: TabBarIndicatorSize.label,
      indicator: UnderlineTabIndicator(borderSide: BorderSide(color: Color(0xff1e84c4), width: 2.0)),
    ),

    ///Switch Theme
    switchTheme: SwitchThemeData(
      trackColor: WidgetStateProperty.resolveWith((Set<WidgetState> state) {
        const Set<WidgetState> interactiveStates = <WidgetState>{WidgetState.pressed, WidgetState.hovered, WidgetState.focused, WidgetState.selected};
        if (state.any(interactiveStates.contains)) {
          return const Color(0xffabb3ea);
        }
        return null;
      }),
      thumbColor: WidgetStateProperty.resolveWith((Set<WidgetState> state) {
        const Set<WidgetState> interactiveStates = <WidgetState>{WidgetState.pressed, WidgetState.hovered, WidgetState.focused, WidgetState.selected};
        if (state.any(interactiveStates.contains)) {
          return const Color(0xff1e84c4);
        }
        return null;
      }),
    ),

    /// Slider Theme
    sliderTheme: SliderThemeData(
      activeTrackColor: const Color(0xff1e84c4),
      inactiveTrackColor: const Color(0xff1e84c4).withAlpha(100),
      trackShape: const RoundedRectSliderTrackShape(),
      trackHeight: 4.0,
      thumbColor: const Color(0xff1e84c4),
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
      tickMarkShape: const RoundSliderTickMarkShape(),
      inactiveTickMarkColor: Colors.red[100],
      valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
      valueIndicatorTextStyle: const TextStyle(color: Colors.white),
    ),
    disabledColor: const Color(0xffa3a3a3),
    highlightColor: Colors.white.withAlpha(28),
    splashColor: Colors.white.withAlpha(56),
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff1e84c4), brightness: Brightness.dark).copyWith(surface: const Color(0xff161616)).copyWith(error: Colors.orange),
  );

  static ThemeData createThemeM3(ThemeType themeType, Color seedColor) {
    if (themeType == ThemeType.light) {
      return lightTheme.copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: seedColor, brightness: Brightness.light),
      );
    }
    return darkTheme.copyWith(
      colorScheme: ColorScheme.fromSeed(seedColor: seedColor, brightness: Brightness.dark, onSurface: const Color(0xFFDAD9CA)),
    );
  }

  static ThemeData createTheme(ColorScheme colorScheme) {
    if (themeType != ThemeType.light) {
      return darkTheme.copyWith(colorScheme: colorScheme);
    }
    return lightTheme.copyWith(colorScheme: colorScheme);
  }

  static ThemeData getNFTTheme() {
    if (themeType == ThemeType.light) {
      return lightTheme.copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff232245), brightness: Brightness.light),
      );
    } else {
      return darkTheme.copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff232245), brightness: Brightness.dark, onSurface: const Color(0xFFDAD9CA)),
      );
    }
    // return createTheme(ColorScheme.fromSeed(seedColor: Color(0xff232245)));
  }

  static ThemeData getRentalServiceTheme() {
    return createThemeM3(themeType, const Color(0xff2e87a6));
  }
}
