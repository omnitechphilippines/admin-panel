import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/my.dart';
import '../widgets/my_breadcrumb_item.dart';
import '../widgets/my_constant.dart';
import '../widgets/my_text_style.dart';
import 'admin_theme.dart';

class MaterialRadius {
  double xs, small, medium, large;

  MaterialRadius({this.xs = 2, this.small = 4, this.medium = 6, this.large = 8});
}

class ColorGroup {
  final Color color, onColor;

  ColorGroup(this.color, this.onColor);
}

class AppStyle {
  static void init() {
    initMyStyle();
    AdminTheme.setTheme();
  }

  static void initMyStyle() {
    MyTextStyle.resetFontStyles();
    MyTextStyle.changeFontFamily(GoogleFonts.publicSans);
    My.setConstant(
      MyConstantData(
        containerRadius: AppStyle.containerRadius.medium,
        cardRadius: AppStyle.cardRadius.medium,
        buttonRadius: AppStyle.buttonRadius.medium,
        defaultBreadCrumbItem: MyBreadcrumbItem(name: 'WebUi', route: '/dashboard'),
      ),
    );
    bool isMobile = true;
    try {
      isMobile = Platform.isAndroid || Platform.isIOS;
    } catch (_) {
      isMobile = false;
    }
    My.setFlexSpacing(isMobile ? 16 : 24);
  }

  /// -------------------------- Styles  -------------------------------------------- ///

  static MaterialRadius buttonRadius = MaterialRadius(small: 2, medium: 4, large: 8);
  static MaterialRadius cardRadius = MaterialRadius(xs: 2, small: 4, medium: 4, large: 8);
  static MaterialRadius containerRadius = MaterialRadius(xs: 2, small: 4, medium: 4, large: 8);
  static MaterialRadius imageRadius = MaterialRadius(xs: 2, small: 4, medium: 4, large: 8);
}

class AppColors {
  static const Color star = Color(0xffFFC233);
  static Color ratingStarColor = const Color(0xFFF9A825);
  static Color success = const Color(0xff1abc9c);

  static ColorGroup pink = ColorGroup(const Color(0xffFFC2D9), const Color(0xffF5005E));
  static ColorGroup violet = ColorGroup(const Color(0xffD0BADE), const Color(0xff4E2E60));

  static ColorGroup blue = ColorGroup(const Color(0xffADD8FF), const Color(0xff004A8F));
  static ColorGroup green = ColorGroup(const Color(0xffAFE9DA), const Color(0xff165041));
  static ColorGroup orange = ColorGroup(const Color(0xffFFCEC2), const Color(0xffFF3B0A));
  static ColorGroup skyBlue = ColorGroup(const Color(0xffC2F0FF), const Color(0xff0099CC));
  static ColorGroup lavender = ColorGroup(const Color(0xffEAE2F3), const Color(0xff7748AD));
  static ColorGroup queenPink = ColorGroup(const Color(0xffE8D9DC), const Color(0xff804D57));
  static ColorGroup blueViolet = ColorGroup(const Color(0xffC5C6E7), const Color(0xff3B3E91));
  static ColorGroup rosePink = ColorGroup(const Color(0xffFCB1E0), const Color(0xffEC0999));

  static ColorGroup rubinRed = ColorGroup(const Color(0x98f6a8bd), const Color(0xffd03760));
  static ColorGroup favorite = rubinRed;
  static ColorGroup redOrange = ColorGroup(const Color(0xffFFAD99), const Color(0xffF53100));

  static Color notificationSuccessBGColor = const Color(0xff117E68);
  static Color notificationSuccessTextColor = const Color(0xffffffff);
  static Color notificationSuccessActionColor = const Color(0xffFFE815);

  static Color notificationErrorBGColor = const Color(0xfffcd9df);
  static Color notificationErrorTextColor = const Color(0xffFF3B0A);
  static Color notificationErrorActionColor = const Color(0xff3874ff);

  // static Color notificationErrorActionColor = Color(0xff006784);

  static List<ColorGroup> list = <ColorGroup>[redOrange, violet, blue, green, orange, skyBlue, lavender, blueViolet];

  static ColorGroup get random => list[Random().nextInt(list.length)];

  static ColorGroup get(int index) {
    return list[index % list.length];
  }

  static Color getColorByRating(int rating) {
    final Map<int, Color> colors = <int, Color>{1: const Color(0xfff0323c), 2: const Color(0xcdf0323c), 3: star, 4: const Color(0xcd3cd278), 5: const Color(0xff3cd278)};

    return colors[rating] ?? colors[1]!;
  }

  AppColors() {
    list.addAll(<ColorGroup>[pink, violet, blue, green, orange]);
  }
}
