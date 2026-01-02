import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

import 'package:get/get.dart';

import '../../../../helper/utils/my_shadow.dart';
import '../../../../helper/utils/utils.dart';
import '../../../../helper/widgets/my_card.dart';
import '../../../../helper/widgets/my_container.dart';
import '../../../../helper/widgets/my_spacing.dart';
import '../../../../helper/widgets/my_text.dart';
import '../../../../helper/widgets/my_text_style.dart';
import '../../../../helper/widgets/responsive.dart';
import '../../../../themes/ui_mixin.dart';
import '../../../../views/layout/layout.dart';
import '../../../data/models/todo_model.dart';
import '../controllers/todo_controller.dart';

class TodoView extends GetView<TodoController> {
  const TodoView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: MySpacing.x(flexSpacing),
        child: MyCard(
          shadow: MyShadow(elevation: 0.2),
          paddingAll: 0,
          child: GetBuilder<TodoController>(
            builder: (_) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: MySpacing.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(width: 250, child: _buildSearch()),
                      _buildCreateTaskButton(),
                    ],
                  ),
                ),
                _buildTodoData(context),
                MySpacing.height(12),
                _buildPaginationControls(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearch() {
    return TextFormField(
      style: MyTextStyle.bodyMedium(),
      decoration: InputDecoration(
        hintText: 'Search task...',
        hintStyle: MyTextStyle.bodyMedium(),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: UiMixin.contentTheme.secondary),
          borderRadius: BorderRadius.circular(4),
        ),
        prefixIcon: const Icon(LucideIcons.search),
        isDense: true,
        isCollapsed: true,
        contentPadding: MySpacing.all(16),
      ),
    );
  }

  Widget _buildCreateTaskButton() {
    return MyContainer(
      onTap: () {},
      color: UiMixin.contentTheme.primary,
      paddingAll: 12,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(LucideIcons.plus, size: 16, color: UiMixin.contentTheme.onPrimary),
          MySpacing.width(12),
          MyText.bodyMedium('Create Task', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
        ],
      ),
    );
  }

  Widget _buildTodoData(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        sortAscending: true,
        columnSpacing: 100,
        headingRowColor: WidgetStateProperty.all(UiMixin.contentTheme.secondary.withValues(alpha: 0.06)),
        headingRowHeight: 40,
        dataRowMaxHeight: 60,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        columns: <DataColumn>[
          DataColumn(label: MyText.labelLarge('Task Name', color: UiMixin.contentTheme.secondary)),
          DataColumn(label: MyText.labelLarge('Created Date', color: UiMixin.contentTheme.secondary)),
          DataColumn(label: MyText.labelLarge('Due Date', color: UiMixin.contentTheme.secondary)),
          DataColumn(label: MyText.labelLarge('Assigned', color: UiMixin.contentTheme.secondary)),
          DataColumn(label: MyText.labelLarge('Status', color: UiMixin.contentTheme.secondary)),
          DataColumn(label: MyText.labelLarge('Priority', color: UiMixin.contentTheme.secondary)),
          DataColumn(label: MyText.labelLarge('Action', color: UiMixin.contentTheme.secondary)),
        ],
        rows: controller.paginatedData.map((TodoModel data) {
          return DataRow(
            cells: <DataCell>[
              DataCell(
                Row(
                  children: <Widget>[
                    Theme(
                      data: ThemeData(),
                      child: Checkbox(value: data.isComplete, shape: const CircleBorder(), activeColor: UiMixin.contentTheme.primary, visualDensity: VisualDensity.compact, onChanged: (bool? value) => controller.onCompleteTask(data)),
                    ),
                    MySpacing.width(12),
                    MyText.bodyMedium(data.task, fontWeight: 600, decoration: data.isComplete ? TextDecoration.lineThrough : TextDecoration.none),
                  ],
                ),
              ),
              DataCell(MyText.bodyMedium(Utils.getDateStringFromDateTime(data.createdAt, showMonthShort: true), fontWeight: 600)),
              DataCell(MyText.bodyMedium(Utils.getDateStringFromDateTime(data.dueDate, showMonthShort: true), fontWeight: 600)),
              DataCell(
                Row(
                  children: <Widget>[
                    CircleAvatar(radius: 12, backgroundImage: AssetImage(data.avatar)),
                    MySpacing.width(12),
                    MyText.bodyMedium(data.name, fontWeight: 600),
                  ],
                ),
              ),
              DataCell(
                MyContainer(
                  color: data.status == 'In-progress'
                      ? UiMixin.contentTheme.warning.withValues(alpha: 0.2)
                      : data.status == 'Pending'
                      ? UiMixin.contentTheme.primary.withValues(alpha: 0.2)
                      : data.status == 'Completed'
                      ? UiMixin.contentTheme.success.withValues(alpha: 0.2)
                      : data.status == 'New'
                      ? UiMixin.contentTheme.info.withValues(alpha: 0.2)
                      : null,
                  paddingAll: 4,
                  child: MyText.labelMedium(
                    data.status,
                    color: data.status == 'In-progress'
                        ? UiMixin.contentTheme.warning
                        : data.status == 'Pending'
                        ? UiMixin.contentTheme.primary
                        : data.status == 'Completed'
                        ? UiMixin.contentTheme.success
                        : data.status == 'New'
                        ? UiMixin.contentTheme.info
                        : null,
                    fontWeight: 600,
                  ),
                ),
              ),
              DataCell(
                Row(
                  children: <Widget>[
                    MyContainer.rounded(
                      color: data.priority == 'High'
                          ? UiMixin.contentTheme.danger
                          : data.priority == 'Low'
                          ? UiMixin.contentTheme.success
                          : data.priority == 'Medium'
                          ? UiMixin.contentTheme.warning
                          : null,
                      paddingAll: 6,
                    ),
                    MySpacing.width(8),
                    MyText.bodyMedium(
                      data.priority,
                      fontWeight: 600,
                      color: data.priority == 'High'
                          ? UiMixin.contentTheme.danger
                          : data.priority == 'Low'
                          ? UiMixin.contentTheme.success
                          : data.priority == 'Medium'
                          ? UiMixin.contentTheme.warning
                          : null,
                    ),
                  ],
                ),
              ),
              DataCell(
                Row(
                  children: <Widget>[
                    MyContainer(
                      onTap: () {
                        showDialog(context: context, builder: (BuildContext context) => _showEditDialog(context, data));
                      },
                      // Trigger Edit Dialog
                      color: UiMixin.contentTheme.secondary.withValues(alpha: 0.3),
                      paddingAll: 8,
                      child: Icon(LucideIcons.file_pen, size: 14, color: UiMixin.contentTheme.secondary),
                    ),
                    MySpacing.width(12),
                    MyContainer(
                      onTap: () => controller.removeData(data),
                      color: UiMixin.contentTheme.danger.withValues(alpha: 0.3),
                      paddingAll: 8,
                      child: Icon(LucideIcons.trash_2, size: 14, color: UiMixin.contentTheme.danger),
                    ),
                  ],
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Dialog _showEditDialog(BuildContext context, TodoModel data) {
    final TextEditingController taskController = TextEditingController(text: data.task);
    final TextEditingController dueDateController = TextEditingController(text: Utils.getDateStringFromDateTime(data.dueDate));

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 450, minWidth: 250),
        child: Padding(
          padding: MySpacing.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MyText.titleMedium('Edit Task', fontWeight: 600),
              MySpacing.height(16),
              TextFormField(
                controller: taskController,
                style: MyTextStyle.bodyMedium(),
                decoration: InputDecoration(
                  hintText: 'Task Name',
                  hintStyle: MyTextStyle.bodyMedium(),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: UiMixin.contentTheme.secondary, width: .2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              MySpacing.height(16),
              TextFormField(
                controller: dueDateController,
                style: MyTextStyle.bodyMedium(),
                decoration: InputDecoration(
                  hintText: 'Due Date',
                  hintStyle: MyTextStyle.bodyMedium(),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: UiMixin.contentTheme.secondary, width: .2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              MySpacing.height(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  MyContainer(
                    onTap: () {
                      controller.updateTask(data, taskController.text, dueDateController.text);
                      Navigator.pop(context);
                    },
                    paddingAll: 8,
                    color: UiMixin.contentTheme.primary.withValues(alpha: 0.4),
                    child: MyText.labelMedium('Save', color: UiMixin.contentTheme.primary, fontWeight: 600),
                  ),
                  MySpacing.width(12),
                  MyContainer(
                    onTap: () => Navigator.pop(context),
                    paddingAll: 8,
                    color: UiMixin.contentTheme.secondary.withValues(alpha: 0.4),
                    child: MyText.labelMedium('Cancel', fontWeight: 600, color: UiMixin.contentTheme.secondary),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaginationControls() {
    return Padding(
      padding: MySpacing.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          IconButton(icon: const Icon(LucideIcons.arrow_left, size: 16), visualDensity: VisualDensity.compact, onPressed: () => controller.previousPage()),
          MyText.labelMedium('Page ${controller.currentPage + 1} of ${controller.totalPages}', fontWeight: 600),
          IconButton(icon: const Icon(LucideIcons.arrow_right, size: 16), visualDensity: VisualDensity.compact, onPressed: () => controller.nextPage()),
        ],
      ),
    );
  }
}
