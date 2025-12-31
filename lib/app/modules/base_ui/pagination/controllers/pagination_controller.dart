import 'package:get/get.dart';

class PaginationController extends GetxController {
  final RxInt currentPage = 1.obs;
  final RxInt roundedPagination = 2.obs;

  void goToRoundPagination(int page) => roundedPagination.value = page;

  void goToPreviousPage() {
    if (currentPage.value > 1) {
      currentPage.value--;
    }
  }

  void goToNextPage() => currentPage.value++;
}
