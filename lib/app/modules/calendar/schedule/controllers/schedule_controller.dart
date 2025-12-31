import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../../helper/widgets/my_form_validator.dart';

class ScheduleController extends GetxController {
  late DataSource events;
  MyFormValidator basicValidator = MyFormValidator();
  TextEditingController titleTE = TextEditingController(), descriptionTE = TextEditingController(), locationTE = TextEditingController();
  final Rx<Color> selectedColor = Colors.red.obs;
  List<Appointment> appointmentCollection = <Appointment>[];
  DateTime? selectedDate;

  List<Color> colorCollection = <Color>[Colors.red, Colors.blue, Colors.green, Colors.yellow, Colors.pink, Colors.purple, Colors.brown];

  @override
  void onInit() {
    super.onInit();
    events = addAppointments();
    titleTE = TextEditingController(text: 'Title');
    titleTE = titleTE..text = 'Title';
    descriptionTE = TextEditingController(text: 'Description');
    locationTE = TextEditingController(text: 'Location');
    selectedColor.value = colorCollection[0];
  }

  void onSelectedColor(Color value) {
    selectedColor.value = value;
    update();
  }

  final List<CalendarView> allowedViews = <CalendarView>[CalendarView.day, CalendarView.week, CalendarView.workWeek, CalendarView.schedule];

  void dragEnd(AppointmentDragEndDetails appointmentDragEndDetails) {
    final Appointment detail = appointmentDragEndDetails.appointment as Appointment;
    final Duration duration = detail.endTime.difference(detail.startTime);

    final DateTime start = DateTime(appointmentDragEndDetails.droppingTime!.year, appointmentDragEndDetails.droppingTime!.month, appointmentDragEndDetails.droppingTime!.day, appointmentDragEndDetails.droppingTime!.hour, 0, 0);

    events.appointments!.remove(appointmentDragEndDetails.appointment);
    events.notifyListeners(CalendarDataSourceAction.remove, <dynamic>[appointmentDragEndDetails.appointment]);

    final Appointment app = Appointment(subject: detail.subject, color: detail.color, startTime: start, endTime: start.add(duration));

    events.appointments!.add(app);
    events.notifyListeners(CalendarDataSourceAction.add, <dynamic>[app]);
  }

  void addEvent() {
    if (titleTE.text.isEmpty || descriptionTE.text.isEmpty || locationTE.text.isEmpty) {
      Get.snackbar('Error', 'All fields must be filled out to add an event.', maxWidth: 300, snackPosition: SnackPosition.TOP, backgroundColor: Colors.red, colorText: Colors.white);
      return; // Stop execution if validation fails
    }

    final DateTime today = selectedDate ?? DateTime.now();

    final Appointment appointment = Appointment(startTime: today, endTime: today.add(const Duration(hours: 1)), color: selectedColor.value, subject: descriptionTE.text);

    appointmentCollection.add(appointment);

    titleTE.clear();
    descriptionTE.clear();
    locationTE.clear();

    events = DataSource(appointmentCollection);
    Get.back();
    update();
  }

  DataSource addAppointments() {
    final DateTime today = DateTime.now();
    appointmentCollection.add(Appointment(startTime: today, endTime: today.add(const Duration(hours: 1)), subject: 'Planning', color: Colors.green));
    appointmentCollection.add(Appointment(startTime: today.add(const Duration(days: 1, hours: 2)), endTime: today.add(const Duration(days: 1, hours: 3)), subject: 'Meeting', color: Colors.red));
    appointmentCollection.add(Appointment(startTime: today.add(const Duration(days: 1, hours: 1)), endTime: today.add(const Duration(days: 1, hours: 2)), subject: 'Retrospective', color: Colors.pink));
    appointmentCollection.add(Appointment(startTime: today.add(const Duration(days: 2, hours: 5)), endTime: today.add(const Duration(days: 2, hours: 6)), subject: 'Birthday', color: Colors.pink));
    appointmentCollection.add(Appointment(startTime: today.add(const Duration(days: 3, hours: 3)), endTime: today.add(const Duration(days: 3, hours: 4)), subject: 'Consulting', color: Colors.deepPurple));

    return DataSource(appointmentCollection);
  }

  void onSelectDate(CalendarSelectionDetails calendarSelectionDetails) {
    selectedDate = calendarSelectionDetails.date;
  }

  @override
  void onClose() {
    titleTE.dispose();
    descriptionTE.dispose();
    locationTE.dispose();
    super.onClose();
  }
}

class DataSource extends CalendarDataSource {
  DataSource(List<Appointment> source) {
    appointments = source;
  }
}
