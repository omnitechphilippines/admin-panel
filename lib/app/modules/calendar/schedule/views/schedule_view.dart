import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../../helper/utils/my_shadow.dart';
import '../../../../../helper/widgets/my_card.dart';
import '../../../../../helper/widgets/my_spacing.dart';
import '../../../../../helper/widgets/my_text.dart';
import '../../../../../helper/widgets/my_text_style.dart';
import '../../../../../helper/widgets/responsive.dart';
import '../../../../../themes/app_theme.dart';
import '../../../../../themes/ui_mixin.dart';
import '../../../../../views/layout/layout.dart';
import '../controllers/schedule_controller.dart';

class ScheduleView extends GetView<ScheduleController> {
  const ScheduleView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: MySpacing.x(flexSpacing),
        child: GetBuilder<ScheduleController>(
          builder: (ScheduleController controller) => MyCard(
            shadow: MyShadow(elevation: 0.3, position: MyShadowPosition.center),
            height: Get.mediaQuery.size.height / 1.2,
            child: SfCalendar(
              view: CalendarView.week,
              allowedViews: controller.allowedViews,
              dataSource: controller.events,
              allowDragAndDrop: true,
              allowAppointmentResize: true,
              onDragEnd: controller.dragEnd,
              monthViewSettings: const MonthViewSettings(showAgenda: true, appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
              controller: CalendarController(),
              allowViewNavigation: true,
              showTodayButton: true,
              showCurrentTimeIndicator: true,
              showNavigationArrow: true,
              onSelectionChanged: (CalendarSelectionDetails calendarSelectionDetails) {
                controller.onSelectDate(calendarSelectionDetails);
                addDataModal(context);
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addDataModal(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: MyText.titleMedium('Add Event', fontWeight: 600),
          content: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[title(), MySpacing.height(12), description(), MySpacing.height(12), colorSelect()]),
          actionsPadding: MySpacing.nTop(20),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(textStyle: Theme.of(context).textTheme.labelLarge),
              child: MyText.bodyMedium('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              style: TextButton.styleFrom(textStyle: Theme.of(context).textTheme.labelLarge),
              child: MyText.bodyMedium('Add'),
              onPressed: () => controller.addEvent(),
            ),
          ],
        );
      },
    );
  }

  Widget colorSelect() {
    final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(width: 1, strokeAlign: 0, color: theme.colorScheme.onSurface.withAlpha(80)),
    );
    return DropdownButtonFormField<Color>(
      dropdownColor: UiMixin.contentTheme.background,
      initialValue: controller.selectedColor.value,
      items: controller.colorCollection.map((Color color) {
        return DropdownMenuItem<Color>(
          value: color,
          child: MyText.bodyMedium(colorToString(color), color: color, fontWeight: 600),
        );
      }).toList(),
      onChanged: (Color? value) => controller.onSelectedColor(value!),
      decoration: InputDecoration(
        border: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        disabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        contentPadding: MySpacing.all(12),
        hintText: 'Select Color',
        hintStyle: MyTextStyle.bodyMedium(fontWeight: 600),
      ),
    );
  }

  String colorToString(Color color) => color == Colors.red
      ? 'Red'
      : color == Colors.blue
      ? 'Blue'
      : color == Colors.green
      ? 'Green'
      : color == Colors.yellow
      ? 'Yellow'
      : color == Colors.pink
      ? 'Pink'
      : color == Colors.purple
      ? 'Purple'
      : color == Colors.brown
      ? 'Brown'
      : '';

  Widget title() {
    final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(width: 1, strokeAlign: 0, color: theme.colorScheme.onSurface.withAlpha(80)),
    );
    return SizedBox(
      width: Get.mediaQuery.size.width / 7,
      child: TextFormField(
        controller: controller.titleTE,
        decoration: InputDecoration(
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          disabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          filled: true,
          hintText: 'Add Title',
          hintStyle: MyTextStyle.bodyMedium(fontWeight: 600),
        ),
      ),
    );
  }

  Widget description() {
    final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(width: 1, strokeAlign: 0, color: theme.colorScheme.onSurface.withAlpha(80)),
    );
    return SizedBox(
      width: Get.mediaQuery.size.width / 7,
      child: TextFormField(
        controller: controller.descriptionTE,
        decoration: InputDecoration(
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          disabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          filled: true,
          hintText: 'Add Description',
          hintStyle: MyTextStyle.bodyMedium(fontWeight: 600),
        ),
      ),
    );
  }
}
