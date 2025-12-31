import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../helper/utils/my_shadow.dart';
import '../../../../../helper/widgets/my_card.dart';
import '../../../../../helper/widgets/my_container.dart';
import '../../../../../helper/widgets/my_spacing.dart';
import '../../../../../helper/widgets/my_text.dart';
import '../../../../../helper/widgets/responsive.dart';
import '../../../../../images.dart';
import '../../../../../themes/ui_mixin.dart';
import '../../../../../views/layout/layout.dart';
import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  const DetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: MySpacing.x(flexSpacing),
        child: MyCard(
          shadow: MyShadow(elevation: 0.2),
          height: 800,
          paddingAll: 24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(child: MyText.titleMedium('Invoice: #RB89562', fontWeight: 600)),
                  Column(
                    children: <Widget>[
                      Image.asset(Images.logoDarkFull, height: 24),
                      MySpacing.height(16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          MyText.bodyMedium('1729 Bangor St,', color: UiMixin.contentTheme.secondary),
                          MySpacing.height(4),
                          MyText.bodyMedium('Houlton, ME, 04730', color: UiMixin.contentTheme.secondary),
                          MySpacing.height(4),
                          MyText.bodyMedium('P: (207) 532-9109', color: UiMixin.contentTheme.secondary),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              MySpacing.height(16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MyText.bodySmall('Customer', fontWeight: 600, color: UiMixin.contentTheme.secondary),
                  MySpacing.height(12),
                  MyText.titleMedium('Glenn H Smith', fontWeight: 600),
                  MySpacing.height(12),
                  MyText.bodyMedium('135 White Cemetery Rd,', color: UiMixin.contentTheme.secondary),
                  MySpacing.height(4),
                  MyText.bodyMedium('Perryville, KY, 40468', color: UiMixin.contentTheme.secondary),
                  MySpacing.height(4),
                  MyText.bodyMedium('P: (304) 584-4345', color: UiMixin.contentTheme.secondary),
                ],
              ),
              MySpacing.height(24),
              invoiceTable(),
              MySpacing.height(24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: MySpacing.top(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          MyText.bodySmall('Notes:', color: UiMixin.contentTheme.cardText),
                          const SizedBox(height: 8.0),
                          MyText.bodySmall(
                            'All accounts are to be paid within 7 days from receipt of invoice. '
                            'To be paid by cheque or credit card or direct payment online. '
                            'If account is not paid within 7 days, the credit details supplied as '
                            'confirmation of work undertaken will be charged the agreed quoted fee noted above.',
                            color: UiMixin.contentTheme.cardText,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            MyText.bodyMedium('Sub-total:', fontWeight: 600, color: UiMixin.contentTheme.cardText),
                            MyText.bodyMedium('\$2266.59', fontWeight: 600, color: UiMixin.contentTheme.cardText),
                          ],
                        ),
                        MySpacing.height(16),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            MyText.bodyMedium('Discount (10%):', fontWeight: 600, color: UiMixin.contentTheme.cardText),
                            MyText.bodyMedium('\$226.66', fontWeight: 600, color: UiMixin.contentTheme.cardText),
                          ],
                        ),
                        MySpacing.height(20),
                        MyText.titleLarge('\$2039.93 USD', fontWeight: 700),
                      ],
                    ),
                  ),
                ],
              ),
              MySpacing.height(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  MyContainer(
                    color: UiMixin.contentTheme.primary,
                    paddingAll: 12,
                    child: MyText.labelMedium('Print', color: UiMixin.contentTheme.onPrimary),
                  ),
                  MySpacing.width(12),
                  MyContainer.bordered(
                    borderColor: UiMixin.contentTheme.primary,
                    paddingAll: 11,
                    child: MyText.labelMedium('Submit ', color: UiMixin.contentTheme.primary),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget invoiceTable() {
    return Table(
      columnWidths: const <int, TableColumnWidth>{0: FlexColumnWidth(3), 1: FixedColumnWidth(100), 2: FixedColumnWidth(150), 3: FixedColumnWidth(100)},
      children: <TableRow>[
        TableRow(
          decoration: BoxDecoration(color: UiMixin.contentTheme.secondary.withValues(alpha: 0.1)),
          children: <Widget>[
            TableCell(
              child: Padding(
                padding: MySpacing.xy(12, 8),
                child: MyText.titleMedium('Product Name', fontWeight: 600, color: UiMixin.contentTheme.secondary, maxLines: 1),
              ),
            ),
            TableCell(
              child: Padding(
                padding: MySpacing.y(8),
                child: MyText.titleMedium('Quantity', fontWeight: 600, color: UiMixin.contentTheme.secondary, maxLines: 1),
              ),
            ),
            TableCell(
              child: Padding(
                padding: MySpacing.y(8),
                child: MyText.titleMedium('Price', fontWeight: 600, color: UiMixin.contentTheme.secondary, maxLines: 1),
              ),
            ),
            TableCell(
              child: Padding(
                padding: MySpacing.xy(12, 8),
                child: MyText.titleMedium('Total', textAlign: TextAlign.end, fontWeight: 600, color: UiMixin.contentTheme.secondary, maxLines: 1),
              ),
            ),
          ],
        ),
        // Data Rows
        TableRow(
          children: <Widget>[
            Padding(
              padding: MySpacing.all(14),
              child: MyText.bodyMedium('G15 Gaming Laptop', fontWeight: 600, color: UiMixin.contentTheme.cardText, maxLines: 1),
            ),
            Padding(
              padding: MySpacing.all(14),
              child: MyText.bodyMedium('3', fontWeight: 600, color: UiMixin.contentTheme.cardText, maxLines: 1),
            ),
            Padding(
              padding: MySpacing.all(14),
              child: MyText.bodyMedium('\$240.59', fontWeight: 600, color: UiMixin.contentTheme.cardText, maxLines: 1),
            ),
            Padding(
              padding: MySpacing.all(14),
              child: MyText.bodyMedium('\$721.77', textAlign: TextAlign.end, fontWeight: 600, color: UiMixin.contentTheme.cardText, maxLines: 1),
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            Padding(
              padding: MySpacing.all(14),
              child: MyText.bodyMedium('Sony Alpha ILCE 6000Y 24.3 MP Mirrorless Digital SLR Camera', fontWeight: 600, color: UiMixin.contentTheme.cardText, maxLines: 1),
            ),
            Padding(
              padding: MySpacing.all(14),
              child: MyText.bodyMedium('5', fontWeight: 600, color: UiMixin.contentTheme.cardText, maxLines: 1),
            ),
            Padding(
              padding: MySpacing.all(14),
              child: MyText.bodyMedium('\$135.99', fontWeight: 600, color: UiMixin.contentTheme.cardText, maxLines: 1),
            ),
            Padding(
              padding: MySpacing.all(14),
              child: MyText.bodyMedium('\$679.95', textAlign: TextAlign.end, fontWeight: 600, color: UiMixin.contentTheme.cardText, maxLines: 1),
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            Padding(
              padding: MySpacing.all(14),
              child: MyText.bodyMedium('Sony Over-Ear Wireless Headphone with Mic', fontWeight: 600, color: UiMixin.contentTheme.cardText, maxLines: 1),
            ),
            Padding(
              padding: MySpacing.all(14),
              child: MyText.bodyMedium('1', fontWeight: 600, color: UiMixin.contentTheme.cardText, maxLines: 1),
            ),
            Padding(
              padding: MySpacing.all(14),
              child: MyText.bodyMedium('\$99.49', fontWeight: 600, color: UiMixin.contentTheme.cardText, maxLines: 1),
            ),
            Padding(
              padding: MySpacing.all(14),
              child: MyText.bodyMedium('\$99.49', textAlign: TextAlign.end, fontWeight: 600, color: UiMixin.contentTheme.cardText, maxLines: 1),
            ),
          ],
        ),
        TableRow(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black.withValues(alpha: 0.2))),
          ),
          children: <Widget>[
            Padding(
              padding: MySpacing.all(14),
              child: MyText.bodyMedium('Adam ROMA USB-C / USB-A 3.1 (2-in-1 Flash Drive) – 128GB', fontWeight: 600, color: UiMixin.contentTheme.cardText, maxLines: 1),
            ),
            Padding(
              padding: MySpacing.all(14),
              child: MyText.bodyMedium('2', fontWeight: 600, color: UiMixin.contentTheme.cardText, maxLines: 1),
            ),
            Padding(
              padding: MySpacing.all(14),
              child: MyText.bodyMedium('\$350.19', fontWeight: 600, color: UiMixin.contentTheme.cardText, maxLines: 1),
            ),
            Padding(
              padding: MySpacing.all(14),
              child: MyText.bodyMedium('\$700.38', textAlign: TextAlign.end, fontWeight: 600, color: UiMixin.contentTheme.cardText, maxLines: 1),
            ),
          ],
        ),
      ],
    );
  }
}
