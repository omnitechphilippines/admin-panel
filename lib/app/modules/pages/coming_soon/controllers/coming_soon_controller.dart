import 'dart:async';

import 'package:get/get.dart';

class ComingSoonController extends GetxController {
  Timer? countdownTimer;
  Duration myDuration = const Duration(days: 351);

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void setCountDown() {
    const int reduceSecondsBy = 1;
    final int seconds = myDuration.inSeconds - reduceSecondsBy;
    if (seconds >= 0) {
      myDuration = Duration(seconds: seconds);
    }
    update();
  }

  void startTimer() => countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
}
