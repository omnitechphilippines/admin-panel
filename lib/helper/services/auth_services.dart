import 'package:get/get.dart';
import '../../app/data/models/user.dart';
import '../storage/local_storage.dart';

import '../../app/routes/app_pages.dart';

class AuthService {
  static bool isLoggedIn = false;

  static User get dummyUser => User(-1, 'omnitechphilippines@gmail.com', 'Nicholas', 'Jackson');

  static Future<Map<String, String>?> loginUser(Map<String, Object?> data) async {
    // await Future.delayed(const Duration(seconds: 1));
    if (data['email'] != dummyUser.email) {
      return <String, String>{'email': 'This email is not registered'};
    } else if (data['password'] != '1234567') {
      return <String, String>{'password': 'Password is incorrect'};
    }

    isLoggedIn = true;
    await LocalStorage.setLoggedInUser(true);
    return null;
  }

  static void logout() async {
    isLoggedIn = false;
    await LocalStorage.setLoggedInUser(false);
    Get.toNamed(Routes.LOGIN);
  }
}
