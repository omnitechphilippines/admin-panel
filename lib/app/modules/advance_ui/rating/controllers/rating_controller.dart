import 'dart:math';

import 'package:get/get.dart';

class RatingController extends GetxController {
  final RxDouble rating = 3.0.obs;
  final RxInt starCount = 5.obs;

  final RxDouble raterWithStepExampleRating = 1.5.obs;
  final RxInt raterWithStepExampleStarCount = 5.obs;

  final RxDouble currentRating = 1.5.obs;
  final RxInt totalStars = 5.obs;
  final RxString statusMessage = ''.obs;

  final RxDouble ratingValue = 3.5.obs;
  final RxInt totalStarCount = 5.obs;

  final RxDouble userRating = 2.0.obs; // Initial rating
  final RxDouble hoveredRating = 0.0.obs; // Rating when hovering (not used, but kept for future functionality)
  final RxInt totalResetStars = 5.obs; // Total number of stars to display

  // Function to handle the star tap action
  void handleStarTap(int index) {
    userRating.value = index + 1.0; // Update rating to the index of the tapped star (1-based)
    // update();
  }

  // Function to reset the rating to the default value
  void resetUserRating() {
    userRating.value = 2.0; // Reset to the initial rating (can be changed)
    // update();
  }

  final Random _random = Random();

  Future<double> getUpdatedRating() async {
    await Future<Object?>.delayed(const Duration(seconds: 1));
    return _random.nextDouble() * 5;
  }

  void handleRatingChange(double rating) {
    currentRating.value = rating;
    statusMessage.value = 'Rating in progress. Please wait...';

    // update();

    getUpdatedRating().then((double newRating) {
      currentRating.value = newRating;
      statusMessage.value = 'Rating updated to: ${newRating.toStringAsFixed(1)}';
      // update();
    });
  }

  void onRaterWithStep(int index) {
    raterWithStepExampleRating.value = (index + 1).toDouble();
    // update();
  }

  void updateRating(double r) {
    rating.value = r;
    // update();
  }
}
