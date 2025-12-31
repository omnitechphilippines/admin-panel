import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../helper/utils/my_shadow.dart';
import '../../../../../helper/widgets/my_card.dart';
import '../../../../../helper/widgets/my_container.dart';
import '../../../../../helper/widgets/my_flex.dart';
import '../../../../../helper/widgets/my_flex_item.dart';
import '../../../../../helper/widgets/my_spacing.dart';
import '../../../../../helper/widgets/my_text.dart';
import '../../../../../helper/widgets/responsive.dart';
import '../../../../../images.dart';
import '../../../../../themes/ui_mixin.dart';
import '../../../../../views/layout/layout.dart';
import '../controllers/basic_controller.dart';

class BasicView extends GetView<BasicController> {
  const BasicView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: MySpacing.x(flexSpacing / 2),
        child: Center(
          child: MyFlex(
            children: <MyFlexItem>[
              MyFlexItem(sizes: 'lg-8', child: basicExample()),
              MyFlexItem(sizes: 'lg-8', child: inverseTable()),
              MyFlexItem(sizes: 'lg-8', child: stripedRows()),
              MyFlexItem(sizes: 'lg-8', child: tableHeadOptions()),
              MyFlexItem(sizes: 'lg-8', child: smallTable()),
              MyFlexItem(sizes: 'lg-8', child: borderedTable()),
              MyFlexItem(sizes: 'lg-8', child: borderedColorTable()),
              MyFlexItem(sizes: 'lg-8', child: alwaysResponsive()),
              MyFlexItem(sizes: 'lg-8', child: basicBorderlessExample()),
              MyFlexItem(sizes: 'lg-8', child: inverseBorderlessTable()),
              MyFlexItem(sizes: 'lg-8', child: activeTables()),
            ],
          ),
        ),
      ),
    );
  }

  Widget basicExample() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      paddingAll: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Basic Example', fontWeight: 600),
          MySpacing.height(16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: <DataColumn>[
                DataColumn(label: SizedBox(width: 205, child: MyText.titleMedium('Name'))),
                DataColumn(label: SizedBox(width: 205, child: MyText.titleMedium('Phone Number'))),
                DataColumn(label: SizedBox(width: 205, child: MyText.titleMedium('Date of Birth'))),
                DataColumn(label: SizedBox(width: 205, child: MyText.titleMedium('Country'))),
              ],
              rows: <DataRow>[
                DataRow(cells: <DataCell>[DataCell(MyText.bodySmall('John A. Miller')), DataCell(MyText.bodySmall('415-987-6543')), DataCell(MyText.bodySmall('March 14, 1980')), DataCell(MyText.bodySmall('USA'))]),
                DataRow(cells: <DataCell>[DataCell(MyText.bodySmall('Sophia T. Walker')), DataCell(MyText.bodySmall('702-123-9876')), DataCell(MyText.bodySmall('October 22, 1975')), DataCell(MyText.bodySmall('Canada'))]),
                DataRow(cells: <DataCell>[DataCell(MyText.bodySmall('Michael P. Johnson')), DataCell(MyText.bodySmall('212-555-8765')), DataCell(MyText.bodySmall('February 11, 1967')), DataCell(MyText.bodySmall('UK'))]),
                DataRow(cells: <DataCell>[DataCell(MyText.bodySmall('Olivia R. Davis')), DataCell(MyText.bodySmall('323-444-2109')), DataCell(MyText.bodySmall('June 19, 1992')), DataCell(MyText.bodySmall('Australia'))]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget inverseTable() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      paddingAll: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Inverse Table', fontWeight: 600),
          MySpacing.height(16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              decoration: BoxDecoration(color: UiMixin.contentTheme.dark),
              child: DataTable(
                headingRowColor: WidgetStateProperty.all(UiMixin.contentTheme.dark),
                columns: <DataColumn>[
                  DataColumn(
                    label: SizedBox(width: 200, child: MyText.titleMedium('Name', color: UiMixin.contentTheme.onPrimary)),
                  ),
                  DataColumn(
                    label: SizedBox(width: 200, child: MyText.titleMedium('Phone Number', color: UiMixin.contentTheme.onPrimary)),
                  ),
                  DataColumn(
                    label: SizedBox(width: 200, child: MyText.titleMedium('Date of Birth', color: UiMixin.contentTheme.onPrimary)),
                  ),
                  DataColumn(
                    label: SizedBox(width: 200, child: MyText.titleMedium('Country', color: UiMixin.contentTheme.onPrimary)),
                  ),
                ],
                rows: <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(MyText.bodySmall('James M. Taylor', color: UiMixin.contentTheme.onPrimary)),
                      DataCell(MyText.bodySmall('408-555-1234', color: UiMixin.contentTheme.onPrimary)),
                      DataCell(MyText.bodySmall('March 30, 1985', color: UiMixin.contentTheme.onPrimary)),
                      DataCell(MyText.bodySmall('South Korea', color: UiMixin.contentTheme.onPrimary)),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(MyText.bodySmall('Emma L. Davis', color: UiMixin.contentTheme.onPrimary)),
                      DataCell(MyText.bodySmall('818-555-4321', color: UiMixin.contentTheme.onPrimary)),
                      DataCell(MyText.bodySmall('August 12, 1970', color: UiMixin.contentTheme.onPrimary)),
                      DataCell(MyText.bodySmall('Germany', color: UiMixin.contentTheme.onPrimary)),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(MyText.bodySmall('Oliver K. Wright', color: UiMixin.contentTheme.onPrimary)),
                      DataCell(MyText.bodySmall('512-555-6789', color: UiMixin.contentTheme.onPrimary)),
                      DataCell(MyText.bodySmall('November 17, 1962', color: UiMixin.contentTheme.onPrimary)),
                      DataCell(MyText.bodySmall('Japan', color: UiMixin.contentTheme.onPrimary)),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(MyText.bodySmall('Ava R. Patel', color: UiMixin.contentTheme.onPrimary)),
                      DataCell(MyText.bodySmall('616-555-8765', color: UiMixin.contentTheme.onPrimary)),
                      DataCell(MyText.bodySmall('July 4, 1999', color: UiMixin.contentTheme.onPrimary)),
                      DataCell(MyText.bodySmall('Mexico', color: UiMixin.contentTheme.onPrimary)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget stripedRows() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      paddingAll: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Striped Rows', fontWeight: 600),
          MySpacing.height(16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: <DataColumn>[
                DataColumn(label: SizedBox(width: 205, child: MyText.titleMedium('User'))),
                DataColumn(label: SizedBox(width: 205, child: MyText.titleMedium('Account No.'))),
                DataColumn(label: SizedBox(width: 205, child: MyText.titleMedium('Balance'))),
                DataColumn(label: SizedBox(width: 205, child: MyText.titleMedium('Action'))),
              ],
              rows: List<DataRow>.generate(controller.striped.length, (int index) {
                final StripedData data = controller.striped[index];
                return DataRow(
                  color: WidgetStateProperty.all(index.isEven ? UiMixin.contentTheme.secondary.withAlpha(36) : null),
                  cells: <DataCell>[
                    DataCell(
                      Row(
                        children: <Widget>[
                          ClipOval(child: Image.asset(data.imagePath, height: 32, width: 32)),
                          MySpacing.width(12),
                          MyText.bodySmall(data.name),
                        ],
                      ),
                    ),
                    DataCell(MyText.bodySmall(data.accountNo)),
                    DataCell(MyText.bodySmall(data.balance)),
                    DataCell(Row(children: <Widget>[const Icon(Icons.settings, size: 16), MySpacing.width(12), const Icon(Icons.delete, size: 16)])),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget tableHeadOptions() {
    Color getProgressColor(double progress) => progress >= 100
        ? Colors.green
        : progress >= 50
        ? Colors.orange
        : progress >= 25
        ? Colors.blue
        : Colors.red;

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      paddingAll: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Table head options', fontWeight: 600),
          MySpacing.height(16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 16,
              headingRowColor: WidgetStateProperty.all(UiMixin.contentTheme.secondary),
              headingTextStyle: const TextStyle(color: Colors.white),
              columns: <DataColumn>[
                DataColumn(
                  label: SizedBox(width: 250, child: MyText.titleMedium('Product', color: UiMixin.contentTheme.onPrimary)),
                ),
                DataColumn(
                  label: SizedBox(width: 230, child: MyText.titleMedium('Courier', color: UiMixin.contentTheme.onPrimary)),
                ),
                DataColumn(
                  label: SizedBox(width: 230, child: MyText.titleMedium('Process', color: UiMixin.contentTheme.onPrimary)),
                ),
                DataColumn(
                  label: SizedBox(width: 230, child: MyText.titleMedium('Status', color: UiMixin.contentTheme.onPrimary)),
                ),
              ],
              rows: List<DataRow>.generate(controller.tableHead.length, (int index) {
                final TableHeadData data = controller.tableHead[index];
                return DataRow(
                  cells: <DataCell>[
                    DataCell(MyText.bodySmall(data.product)),
                    DataCell(MyText.bodySmall(data.courier)),
                    DataCell(
                      SizedBox(
                        width: 100,
                        child: LinearProgressIndicator(value: data.progress / 100, backgroundColor: UiMixin.contentTheme.dark.withAlpha(36), valueColor: AlwaysStoppedAnimation<Color>(getProgressColor(data.progress))),
                      ),
                    ),
                    DataCell(MyText.bodySmall(data.status)),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget smallTable() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      paddingAll: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Small table', fontWeight: 600),
          MySpacing.height(16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 16,
              headingRowHeight: 36,
              columns: <DataColumn>[
                DataColumn(label: SizedBox(width: 230, child: MyText.titleMedium('Product'))),
                DataColumn(label: SizedBox(width: 230, child: MyText.titleMedium('Price'))),
                DataColumn(label: SizedBox(width: 230, child: MyText.titleMedium('Quantity'))),
                DataColumn(label: SizedBox(width: 230, child: MyText.titleMedium('Amount'))),
              ],
              rows: List<DataRow>.generate(controller.smallTableData.length, (int index) {
                final SmallTableData data = controller.smallTableData[index];
                return DataRow(
                  cells: <DataCell>[
                    DataCell(MyText.bodySmall(data.product)),
                    DataCell(MyText.titleSmall('\$${data.price.toStringAsFixed(2)}')),
                    DataCell(
                      MyContainer(
                        paddingAll: 4,
                        color: UiMixin.contentTheme.primary,
                        child: MyText.bodySmall('${data.quantity} Pcs', color: UiMixin.contentTheme.onPrimary),
                      ),
                    ),
                    DataCell(MyText.bodySmall('\$${data.amount.toStringAsFixed(2)}')),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget borderedTable() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      paddingAll: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Bordered table', fontWeight: 600),
          MySpacing.height(16),
          MyContainer.bordered(
            paddingAll: 0,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 16,
                horizontalMargin: 20,
                columns: <DataColumn>[
                  DataColumn(label: SizedBox(width: 230, child: MyText.titleMedium('User'))),
                  DataColumn(label: SizedBox(width: 230, child: MyText.titleMedium('Account No.'))),
                  DataColumn(label: SizedBox(width: 230, child: MyText.titleMedium('Balance'))),
                  DataColumn(label: SizedBox(width: 230, child: MyText.titleMedium('Action'))),
                ],
                rows: <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Row(
                          children: <Widget>[
                            CircleAvatar(backgroundImage: AssetImage(Images.avatars[1]), radius: 16),
                            MySpacing.width(12),
                            MyText.bodySmall('James M. Taylor'),
                          ],
                        ),
                      ),
                      DataCell(MyText.bodySmall('AC415 987 6543')),
                      DataCell(MyText.bodySmall('March 14, 1980')),
                      DataCell(IconButton(icon: const Icon(Icons.delete), onPressed: () {})),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Row(
                          children: <Widget>[
                            CircleAvatar(backgroundImage: AssetImage(Images.avatars[2]), radius: 16),
                            const SizedBox(width: 8),
                            MyText.bodySmall('Sophia T. Walker'),
                          ],
                        ),
                      ),
                      DataCell(MyText.bodySmall('SB702 123 9876')),
                      DataCell(MyText.bodySmall('October 22, 1975')),
                      DataCell(IconButton(icon: const Icon(Icons.delete), onPressed: () {})),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Row(
                          children: <Widget>[
                            CircleAvatar(backgroundImage: AssetImage(Images.avatars[3]), radius: 16),
                            const SizedBox(width: 8),
                            MyText.bodySmall('Michael P. Johnson'),
                          ],
                        ),
                      ),
                      DataCell(MyText.bodySmall('DL212 555 8765')),
                      DataCell(MyText.bodySmall('February 11, 1967')),
                      DataCell(IconButton(icon: const Icon(Icons.delete), onPressed: () {})),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Row(
                          children: <Widget>[
                            CircleAvatar(backgroundImage: AssetImage(Images.avatars[4]), radius: 16),
                            const SizedBox(width: 8),
                            MyText.bodySmall('Olivia R. Davis'),
                          ],
                        ),
                      ),
                      DataCell(MyText.bodySmall('CA323 444 2109')),
                      DataCell(MyText.bodySmall('June 19, 1992')),
                      DataCell(IconButton(icon: const Icon(Icons.delete), onPressed: () {})),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget borderedColorTable() {
    DataRow buildDataRow(String avatarPath, String userName, String accountNo, String balance) {
      return DataRow(
        cells: <DataCell>[
          DataCell(
            Row(
              children: <Widget>[
                CircleAvatar(backgroundImage: AssetImage(avatarPath), radius: 16),
                MySpacing.width(8),
                MyText.bodySmall(userName),
              ],
            ),
          ),
          DataCell(MyText.bodySmall(accountNo)),
          DataCell(MyText.bodySmall(balance)),
          DataCell(
            Center(
              child: IconButton(icon: const Icon(Icons.delete), onPressed: () {}),
            ),
          ),
        ],
      );
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      paddingAll: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.bodyMedium('Bordered color table', fontWeight: 600),
          MySpacing.height(16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 16,
              border: TableBorder.all(color: UiMixin.contentTheme.primary),
              columns: <DataColumn>[
                DataColumn(label: SizedBox(width: 295, child: MyText.titleMedium('User', fontWeight: 600))),
                DataColumn(label: SizedBox(width: 295, child: MyText.titleMedium('Account No.', fontWeight: 600))),
                DataColumn(label: SizedBox(width: 295, child: MyText.titleMedium('Balance', fontWeight: 600))),
                DataColumn(label: MyText.titleMedium('Action', fontWeight: 600)),
              ],
              rows: <DataRow>[
                buildDataRow(Images.avatars[0], 'James M. Taylor', 'AC415 987 6543', 'March 14, 1980'),
                buildDataRow(Images.avatars[1], 'Sophia T. Walker', 'SB702 123 9876', 'October 22, 1975'),
                buildDataRow(Images.avatars[2], 'Michael P. Johnson', 'DL212 555 8765', 'February 11, 1967'),
                buildDataRow(Images.avatars[3], 'Olivia R. Davis', 'CA323 444 2109', 'June 19, 1992'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget alwaysResponsive() {
    DataRow buildDataRow(int rowNumber) {
      return DataRow(cells: <DataCell>[DataCell(MyText.bodySmall(rowNumber.toString(), fontWeight: 600)), ...List<DataCell>.generate(7, (int index) => DataCell(MyText.bodySmall('Cell')))]);
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      paddingAll: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Always Responsive', fontWeight: 600),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: List<DataColumn>.generate(8, (int index) => DataColumn(label: SizedBox(width: 72, child: MyText.bodyMedium('Heading', fontWeight: 600)))),
              rows: List<DataRow>.generate(3, (int index) => buildDataRow(index + 1)),
            ),
          ),
        ],
      ),
    );
  }

  Widget basicBorderlessExample() {
    DataRow buildDataRow(String name, String phoneNumber, String dob, String country) {
      return DataRow(cells: <DataCell>[DataCell(MyText.bodySmall(name, muted: true)), DataCell(MyText.bodySmall(phoneNumber, muted: true)), DataCell(MyText.bodySmall(dob, muted: true)), DataCell(MyText.bodySmall(country, muted: true))]);
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      paddingAll: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Basic Borderless Example', fontWeight: 600),
          MySpacing.height(16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: <DataColumn>[
                DataColumn(label: SizedBox(width: 204, child: MyText.bodyMedium('Name'))),
                DataColumn(label: SizedBox(width: 204, child: MyText.bodyMedium('Phone Number'))),
                DataColumn(label: SizedBox(width: 204, child: MyText.bodyMedium('Date of Birth'))),
                DataColumn(label: SizedBox(width: 204, child: MyText.bodyMedium('Country'))),
              ],
              rows: <DataRow>[
                buildDataRow('John A. Miller', '415-987-6543', 'March 14, 1980', 'USA'),
                buildDataRow('Sophia T. Walker', '702-123-9876', 'October 22, 1975', 'Canada'),
                buildDataRow('Michael P. Johnson', '212-555-8765', 'February 11, 1967', 'UK'),
                buildDataRow('Olivia R. Davis', '323-444-2109', 'June 19, 1992', 'Australia'),
              ],
              decoration: BoxDecoration(border: Border.all(color: Colors.transparent)),
            ),
          ),
        ],
      ),
    );
  }

  Widget inverseBorderlessTable() {
    DataRow buildDataRow(String name, String phoneNumber, String dob, String country) {
      return DataRow(
        cells: <DataCell>[
          DataCell(MyText.bodySmall(name, muted: true, color: UiMixin.contentTheme.onPrimary)),
          DataCell(MyText.bodySmall(phoneNumber, muted: true, color: UiMixin.contentTheme.onPrimary)),
          DataCell(MyText.bodySmall(dob, muted: true, color: UiMixin.contentTheme.onPrimary)),
          DataCell(MyText.bodySmall(country, muted: true, color: UiMixin.contentTheme.onPrimary)),
        ],
      );
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      paddingAll: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Inverse Borderless table', fontWeight: 600),
          MySpacing.height(16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: <DataColumn>[
                DataColumn(
                  label: SizedBox(width: 230, child: MyText.titleMedium('Name', fontWeight: 600, color: UiMixin.contentTheme.onPrimary)),
                ),
                DataColumn(
                  label: SizedBox(width: 230, child: MyText.titleMedium('Phone Number', fontWeight: 600, color: UiMixin.contentTheme.onPrimary)),
                ),
                DataColumn(
                  label: SizedBox(width: 230, child: MyText.titleMedium('Date of Birth', fontWeight: 600, color: UiMixin.contentTheme.onPrimary)),
                ),
                DataColumn(
                  label: SizedBox(width: 230, child: MyText.titleMedium('Country', fontWeight: 600, color: UiMixin.contentTheme.onPrimary)),
                ),
              ],
              rows: <DataRow>[
                buildDataRow('James M. Taylor', '408-555-1234', 'March 30, 1985', 'South Korea'),
                buildDataRow('Emma L. Davis', '818-555-4321', 'August 12, 1970', 'Germany'),
                buildDataRow('Oliver K. Wright', '512-555-6789', 'November 17, 1962', 'Japan'),
                buildDataRow('Ava R. Patel', '616-555-8765', 'July 4, 1999', 'Mexico'),
              ],
              decoration: BoxDecoration(color: UiMixin.contentTheme.dark),
              headingTextStyle: const TextStyle(color: Colors.white),
              dataTextStyle: const TextStyle(color: Colors.white),
              columnSpacing: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget activeTables() {
    DataRow buildDataRow(bool isActive, String name, String phoneNumber, String dob, String country, {int colspan = 1}) {
      return DataRow(
        cells: <DataCell>[
          DataCell(MyText.bodySmall(name, fontWeight: 600), placeholder: colspan == 2 && !isActive, onTap: () {}),
          if (colspan == 2)
            DataCell(
              Container(
                color: isActive ? UiMixin.contentTheme.secondary.withAlpha(36) : Colors.transparent,
                child: Center(child: MyText.bodySmall(phoneNumber, muted: true, fontWeight: 600)),
              ),
              showEditIcon: isActive,
            )
          else
            DataCell(MyText.bodySmall(phoneNumber, fontWeight: 600, muted: true), placeholder: isActive),
          DataCell(MyText.bodySmall(dob, fontWeight: 600, muted: true)),
          DataCell(MyText.bodySmall(country, fontWeight: 600, muted: true)),
        ],
        color: isActive ? WidgetStateProperty.all(UiMixin.contentTheme.secondary.withAlpha(36)) : null,
      );
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      paddingAll: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Active tables', fontWeight: 600),
          MySpacing.height(16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: <DataColumn>[
                DataColumn(label: SizedBox(width: 230, child: MyText.titleMedium('Name', fontWeight: 600))),
                DataColumn(label: SizedBox(width: 230, child: MyText.titleMedium('Phone Number', fontWeight: 600))),
                DataColumn(label: SizedBox(width: 230, child: MyText.titleMedium('Date of Birth', fontWeight: 600))),
                DataColumn(label: SizedBox(width: 230, child: MyText.titleMedium('Country', fontWeight: 600))),
              ],
              rows: <DataRow>[
                buildDataRow(true, 'James M. Taylor', '415-987-6543', 'March 14, 1980', 'South Korea'),
                buildDataRow(false, 'Sophia T. Walker', '702-123-9876', 'October 22, 1975', 'Canada'),
                buildDataRow(false, 'Michael P. Johnson', '212-555-8765', 'February 11, 1967', 'UK'),
                buildDataRow(false, 'Olivia R. Davis', '323-444-2109', 'June 19, 1992', 'Australia'),
                buildDataRow(false, 'Ava R. Patel', '616-555-8765', 'July 4, 1999', 'Mexico'),
              ],
              columnSpacing: 20,
            ),
          ),
        ],
      ),
    );
  }
}
