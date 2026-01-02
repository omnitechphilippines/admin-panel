import 'package:get/get.dart';

import '../../../../data/models/invoice_list_model.dart';

class ListController extends GetxController {
  final RxList<InvoiceListModel> invoice = <InvoiceListModel>[].obs;
  final RxInt rowsPerPage = 10.obs;
  final RxInt currentPage = 0.obs;

  @override
  void onInit() {
    InvoiceListModel.dummyList.then((List<InvoiceListModel> value) {
      invoice.value = value;
      update();
    });
    super.onInit();
  }

  void removeData(InvoiceListModel data) {
    invoice.remove(data);
    update();
  }

  List<InvoiceListModel> get paginatedData {
    final int start = currentPage.value * rowsPerPage.value;
    final int end = start + rowsPerPage.value;
    return invoice.sublist(start, end < invoice.length ? end : invoice.length);
  }

  int get totalPages => (invoice.length / rowsPerPage.value).ceil();

  void nextPage() {
    if (currentPage.value < totalPages - 1) {
      currentPage.value++;
    }
    update();
  }

  void previousPage() {
    if (currentPage.value > 0) {
      currentPage.value--;
    }
    update();
  }
}
