import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

import 'package:get/get.dart';

import '../../../../../helper/utils/my_shadow.dart';
import '../../../../../helper/widgets/my_card.dart';
import '../../../../../helper/widgets/my_container.dart';
import '../../../../../helper/widgets/my_list_extension.dart';
import '../../../../../helper/widgets/my_spacing.dart';
import '../../../../../helper/widgets/my_text.dart';
import '../../../../../helper/widgets/my_text_style.dart';
import '../../../../../helper/widgets/responsive.dart';
import '../../../../../images.dart';
import '../../../../../models/invoice_list_model.dart';
import '../../../../../themes/ui_mixin.dart';
import '../../../../../views/layout/layout.dart';
import '../controllers/list_controller.dart';

class ListView extends GetView<ListController> {
  const ListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: MySpacing.x(flexSpacing),
        child: MyCard(
          shadow: MyShadow(elevation: 0.2),
          paddingAll: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: MySpacing.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(width: 250, child: _buildSearch()),
                    _buildCreateInvoice(),
                  ],
                ),
              ),
              Obx(() => _buildInvoice()),
              _buildPaginationControls(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearch() {
    return TextFormField(
      style: MyTextStyle.bodyMedium(),
      decoration: InputDecoration(
        hintText: 'Search text',
        hintStyle: MyTextStyle.bodyMedium(),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: UiMixin.contentTheme.secondary, width: .2),
          borderRadius: BorderRadius.circular(4),
        ),
        prefixIcon: const Icon(LucideIcons.search),
        isCollapsed: true,
        isDense: true,
        contentPadding: MySpacing.all(16),
      ),
    );
  }

  Widget _buildCreateInvoice() {
    return MyContainer(
      color: UiMixin.contentTheme.success,
      paddingAll: 12,
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(LucideIcons.plus, size: 16, color: UiMixin.contentTheme.onPrimary),
          MySpacing.width(12),
          MyText.bodyMedium('Create Invoice', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
        ],
      ),
    );
  }

  Widget _buildInvoice() {
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
          DataColumn(label: MyText.labelLarge('Invoice ID', color: UiMixin.contentTheme.secondary)),
          DataColumn(label: MyText.labelLarge('Customer', color: UiMixin.contentTheme.secondary)),
          DataColumn(label: MyText.labelLarge('Created Date', color: UiMixin.contentTheme.secondary)),
          DataColumn(label: MyText.labelLarge('Due Date', color: UiMixin.contentTheme.secondary)),
          DataColumn(label: MyText.labelLarge('Amount', color: UiMixin.contentTheme.secondary)),
          DataColumn(label: MyText.labelLarge('Payment Status', color: UiMixin.contentTheme.secondary)),
          DataColumn(label: MyText.labelLarge('Via', color: UiMixin.contentTheme.secondary)),
          DataColumn(label: MyText.labelLarge('Action', color: UiMixin.contentTheme.secondary)),
        ],
        rows: controller.invoice.mapIndexed((int index, InvoiceListModel data) {
          return DataRow(
            cells: <DataCell>[
              DataCell(MyText.bodyMedium(data.invoiceId, fontWeight: 600)),
              DataCell(
                Row(
                  children: <Widget>[
                    CircleAvatar(radius: 12, backgroundImage: AssetImage(Images.avatars[index % Images.avatars.length])),
                    MySpacing.width(12),
                    MyText.bodyMedium(data.clientName, fontWeight: 600, muted: true),
                  ],
                ),
              ),
              DataCell(MyText.bodyMedium(data.invoiceDate, fontWeight: 600, muted: true)),
              DataCell(MyText.bodyMedium(data.dueDate, fontWeight: 600, muted: true)),
              DataCell(MyText.bodyMedium(data.amount, fontWeight: 600, muted: true)),
              DataCell(
                MyContainer(
                  color: data.status == 'Unpaid'
                      ? UiMixin.contentTheme.warning.withValues(alpha: 0.2)
                      : data.status == 'Send'
                      ? UiMixin.contentTheme.primary.withValues(alpha: 0.2)
                      : data.status == 'Paid'
                      ? UiMixin.contentTheme.success.withValues(alpha: 0.2)
                      : null,
                  paddingAll: 2,
                  child: MyText.labelSmall(
                    data.status,
                    fontWeight: 600,
                    color: data.status == 'Unpaid'
                        ? UiMixin.contentTheme.warning
                        : data.status == 'Send'
                        ? UiMixin.contentTheme.primary
                        : data.status == 'Paid'
                        ? UiMixin.contentTheme.success
                        : null,
                  ),
                ),
              ),
              DataCell(MyText.bodyMedium(data.paymentMethod, fontWeight: 600, muted: true)),
              DataCell(
                Row(
                  children: <Widget>[
                    MyContainer(
                      onTap: () {},
                      color: UiMixin.contentTheme.secondary.withValues(alpha: 0.15),
                      paddingAll: 8,
                      child: Icon(LucideIcons.file_pen, size: 14, color: UiMixin.contentTheme.secondary),
                    ),
                    MySpacing.width(12),
                    MyContainer(
                      onTap: () => controller.removeData(data),
                      color: UiMixin.contentTheme.danger.withValues(alpha: 0.15),
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
