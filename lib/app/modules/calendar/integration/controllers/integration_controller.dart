import 'package:get/get.dart';

import '../../../../data/models/integration_model.dart';

class IntegrationController extends GetxController {
  RxList<CalendarIntegrationModel> calendarIntegration = <CalendarIntegrationModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    CalendarIntegrationModel.dummyList.then((List<CalendarIntegrationModel> value) {
      calendarIntegration.value = value;
      update();
    });
  }
}
