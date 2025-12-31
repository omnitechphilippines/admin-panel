import 'dart:math';

class Images {
  //----------------WebLogo----------------
  static String logoIcon = 'assets/images/logo/logo_icon_dark.png';

  static String logoDark = 'assets/logo-dark.png';
  static String logoDarkFull = 'assets/logo-dark-full.png';
  static String logoLight = 'assets/logo-light.png';
  static String logoLightFull = 'assets/logo-light-full.png';
  static String logoSm = 'assets/logo-sm.png';

  //----------------Dummy Images----------------

  static List<String> avatars = List.generate(12, (index) => 'assets/users/avatar-${index + 1}.jpg');

  static List<String> small = List.generate(12, (index) => 'assets/small/img-${index + 1}.jpg');

  static String randomImage(List<String> images) => images[Random().nextInt(images.length)];
}
