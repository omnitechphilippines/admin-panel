import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../helper/utils/my_shadow.dart';
import '../../../../helper/widgets/my_card.dart';
import '../../../../helper/widgets/my_container.dart';
import '../../../../helper/widgets/my_flex.dart';
import '../../../../helper/widgets/my_flex_item.dart';
import '../../../../helper/widgets/my_list_extension.dart';
import '../../../../helper/widgets/my_spacing.dart';
import '../../../../helper/widgets/my_text.dart';
import '../../../../helper/widgets/responsive.dart';
import '../../../../images.dart';
import '../../../../themes/ui_mixin.dart';
import '../../../../views/layout/layout.dart';
import '../../charts/controllers/charts_controller.dart';
import '../controllers/widgets_controller.dart';

class WidgetsView extends GetView<WidgetsController> {
  const WidgetsView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WidgetsController>(
      builder: (_) {
        return Layout(
          child: Padding(
            padding: MySpacing.x(flexSpacing / 2),
            child: MyFlex(
              children: <MyFlexItem>[
                MyFlexItem(sizes: 'lg-3 md-6 sm-6', child: state1('Campaign Sent', '13,647', LucideIcons.layers, UiMixin.contentTheme.primary)),
                MyFlexItem(sizes: 'lg-3 md-6 sm-6', child: state1('New Leads', '9,526', LucideIcons.award, UiMixin.contentTheme.success)),
                MyFlexItem(sizes: 'lg-3 md-6 sm-6', child: state1('Deals', '976', LucideIcons.backpack, UiMixin.contentTheme.danger)),
                MyFlexItem(sizes: 'lg-3 md-6 sm-6', child: state1('Booked Revenue', '\$123', LucideIcons.circle_dollar_sign, UiMixin.contentTheme.warning)),
                MyFlexItem(sizes: 'lg-2.4 md-6 sm-6', child: state2('assets/other/bold-duotone.svg', '\$59.6k', 'Total Income', '8.72', UiMixin.contentTheme.success, LucideIcons.donut)),
                MyFlexItem(sizes: 'lg-2.4 md-6 sm-6', child: state2('assets/other/black-hole-line-duotone.svg', '\$24.03k', 'Total Expenses', '3.28', UiMixin.contentTheme.danger, LucideIcons.chart_column_big)),
                MyFlexItem(sizes: 'lg-2.4 md-6 sm-6', child: state2('assets/other/leaf.svg', '\$48.7k', 'Investments', '5.69', UiMixin.contentTheme.danger, LucideIcons.building_2)),
                MyFlexItem(sizes: 'lg-2.4 md-6 sm-6', child: state2('assets/other/crown-star-bold-duotone.svg', '\$11.3k', 'Savings', '10.58', UiMixin.contentTheme.success, LucideIcons.soup)),
                MyFlexItem(sizes: 'lg-2.4', child: state2('assets/other/cpu-bolt-line-duotone.svg', '\$5.5k', 'Profits', '2.25', UiMixin.contentTheme.success, LucideIcons.volleyball)),
                MyFlexItem(sizes: 'lg-3 md-6 sm-6', child: stats3('Campaign Sent', '13, 647', ' 2.3', true, 'assets/other/leaf.svg')),
                MyFlexItem(sizes: 'lg-3 md-6 sm-6', child: stats3('Clicks', '9, 526', '8.1', true, 'assets/other/cpu_bolt.svg')),
                MyFlexItem(sizes: 'lg-3 md-6 sm-6', child: stats3('Conversions', '976', '0.3', false, 'assets/other/layers.svg')),
                MyFlexItem(sizes: 'lg-3 md-6 sm-6', child: stats3('New Users', '\$123.6k', '10.6', false, 'assets/other/users_group_two.svg')),
                MyFlexItem(sizes: 'lg-6', child: recentProjectSummary()),
                MyFlexItem(sizes: 'lg-6', child: todaySchedules()),
                MyFlexItem(
                  sizes: 'lg-12',
                  child: MyCard(
                    marginAll: 0,
                    shadow: MyShadow(elevation: 0.2),
                    paddingAll: 0,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: MyFlex(
                      contentPadding: false,
                      runSpacing: 0,
                      spacing: 0,
                      children: <MyFlexItem>[
                        MyFlexItem(sizes: 'lg-4', child: conversation()),
                        MyFlexItem(sizes: 'lg-8', child: performance()),
                      ],
                    ),
                  ),
                ),
                MyFlexItem(sizes: 'lg-4', child: myTask()),
                MyFlexItem(sizes: 'lg-4', child: friendsRequest()),
                MyFlexItem(sizes: 'lg-4', child: recentTransactions()),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget state1(String title, String count, IconData icon, Color color) {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      paddingAll: 20,
      child: Row(
        children: <Widget>[
          MyContainer(
            color: color,
            child: Icon(icon, color: UiMixin.contentTheme.onPrimary, size: 24),
          ),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[MyText.bodyMedium(title, fontWeight: 600, xMuted: true), MySpacing.height(4), MyText.titleLarge(count, fontWeight: 600)]),
          ),
        ],
      ),
    );
  }

  Widget state2(String svgImage, String counter, String title, String percentile, Color color, IconData icon) {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      paddingAll: 0,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: MySpacing.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SvgPicture.asset(svgImage, height: 36, width: 36),
                MySpacing.height(20),
                MyText.titleLarge(counter, fontWeight: 800),
                MyText.bodyMedium(title, fontWeight: 600, muted: true),
                MySpacing.height(20),
                MyContainer(
                  paddingAll: 2,
                  color: color.withValues(alpha: 0.2),
                  child: MyText.labelMedium('$percentile%', color: color),
                ),
              ],
            ),
          ),
          Positioned(bottom: -10, right: -5, child: Icon(icon, size: 60, color: UiMixin.contentTheme.secondary.withValues(alpha: 0.4))),
        ],
      ),
    );
  }

  Widget stats3(String title, String value, String percentage, bool isPositive, String svgImage) {
    return MyCard(
      shadow: MyShadow(elevation: 0.2, position: MyShadowPosition.center),
      paddingAll: 0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: MySpacing.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MyContainer(
                  height: 56,
                  width: 56,
                  paddingAll: 0,
                  color: UiMixin.contentTheme.background.withValues(alpha: .6),
                  child: Center(child: SvgPicture.asset(svgImage, height: 32, width: 32)),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[MyText.bodySmall(title, muted: true, fontWeight: 600), MySpacing.height(6), MyText.titleLarge(value, fontWeight: 700)]),
              ],
            ),
          ),
          MyContainer(
            color: UiMixin.contentTheme.background.withValues(alpha: .6),
            borderRadiusAll: 0,
            padding: MySpacing.xy(18, 12),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Row(
              children: <Widget>[
                Icon(isPositive ? Boxicons.bxs_up_arrow : Boxicons.bxs_down_arrow, color: isPositive ? UiMixin.contentTheme.success : UiMixin.contentTheme.danger, size: 12),
                MySpacing.width(4),
                MyText.bodyMedium('$percentage%', color: isPositive ? UiMixin.contentTheme.success : UiMixin.contentTheme.danger),
                MySpacing.width(8),
                Expanded(child: MyText.bodySmall('Last Month', maxLines: 1)),
                InkWell(
                  onTap: () {},
                  child: MyText.bodySmall('View More', fontWeight: 600, overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget recentProjectSummary() {
    DataRow buildDataRow(String project, String client, List<String> teamAvatars, String deadline, double progress) {
      return DataRow(
        cells: <DataCell>[
          DataCell(MyText.bodyMedium(project)),
          DataCell(MyText.bodyMedium(client)),
          DataCell(
            SizedBox(
              width: 100,
              child: Stack(
                alignment: Alignment.centerRight,
                children: teamAvatars
                    .mapIndexed(
                      (int index, String image) => Positioned(
                        left: (18 + (20 * index)).toDouble(),
                        child: MyContainer.rounded(
                          paddingAll: 2,
                          child: MyContainer.rounded(bordered: true, paddingAll: 0, child: Image.asset(image, height: 28, width: 28, fit: BoxFit.cover)),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          DataCell(MyText.bodyMedium(deadline)),
          DataCell(
            SizedBox(
              width: 100,
              child: LinearProgressIndicator(
                value: progress / 100,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(progress > 50 ? UiMixin.contentTheme.success : (progress > 30 ? Colors.orange : UiMixin.contentTheme.danger)),
              ),
            ),
          ),
        ],
      );
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(child: MyText.titleMedium('Recent Project Summary', fontWeight: 600)),
              InkWell(
                onTap: () {},
                child: Row(
                  children: <Widget>[
                    MyText.bodyMedium('Export', fontWeight: 600, color: UiMixin.contentTheme.primary),
                    MySpacing.width(8),
                    Icon(LucideIcons.share, color: UiMixin.contentTheme.primary, size: 14),
                  ],
                ),
              ),
            ],
          ),
          MySpacing.height(16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowHeight: 50,
              columns: <DataColumn>[
                DataColumn(label: MyText.titleMedium('Project', fontWeight: 600)),
                DataColumn(label: MyText.titleMedium('Client', fontWeight: 600)),
                DataColumn(label: MyText.titleMedium('Team', fontWeight: 600)),
                DataColumn(label: MyText.titleMedium('Deadline', fontWeight: 600)),
                DataColumn(label: MyText.titleMedium('Work Progress', fontWeight: 600)),
              ],
              rows: <DataRow>[
                buildDataRow('Zelogy', 'Daniel Olsen', <String>[Images.avatars[0], Images.avatars[1], Images.avatars[2]], '12 April 2024', 33),
                buildDataRow('Shiaz', 'Jack Roldan', <String>[Images.avatars[3], Images.avatars[4]], '10 April 2024', 74),
                buildDataRow('Holderick', 'Betty Cox', <String>[Images.avatars[5], Images.avatars[6], Images.avatars[7]], '31 March 2024', 50),
                buildDataRow('Feyvux', 'Carlos Johnson', <String>[Images.avatars[8], Images.avatars[9]], '25 March 2024', 92),
                buildDataRow('Xavlox', 'Lorraine Cox', <String>[Images.avatars[10]], '22 March 2024', 48),
                buildDataRow('Mozacav', 'Delores Young', <String>[Images.avatars[11], Images.avatars[1], Images.avatars[0]], '15 March 2024', 21),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget todaySchedules() {
    return MyCard(
      shadow: MyShadow(elevation: 0.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium("Today's Schedules", fontWeight: 600),
          MySpacing.height(16),
          buildScheduleItem(time: '09:00', title: 'Setup Github Repository', duration: '09:00 - 10:00', alertColor: UiMixin.contentTheme.primary),
          MySpacing.height(19),
          buildScheduleItem(time: '10:00', title: 'Design Review - Omni Admin', duration: '10:00 - 10:30', alertColor: UiMixin.contentTheme.success),
          MySpacing.height(19),
          buildScheduleItem(time: '11:00', title: 'Meeting with BD Team', duration: '11:00 - 12:30', alertColor: UiMixin.contentTheme.info),
          MySpacing.height(19),
          buildScheduleItem(time: '01:00', title: 'Meeting with Design Studio', duration: '01:00 - 02:00', alertColor: UiMixin.contentTheme.warning),
        ],
      ),
    );
  }

  Widget buildScheduleItem({required String time, required String title, required String duration, required Color alertColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: 60, child: MyText.bodyMedium(time, fontWeight: 600)),
        Expanded(
          child: MyContainer(
            paddingAll: 0,
            child: MyCard(
              color: alertColor.withValues(alpha: 0.2),
              shadow: MyShadow(elevation: 0),
              borderRadiusAll: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MyText.bodyMedium(title, fontWeight: 600, color: alertColor),
                  MySpacing.height(8),
                  MyText.bodySmall(duration, color: alertColor),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget conversation() {
    SfCircularChart totalSalesChart() {
      return SfCircularChart(
        margin: MySpacing.zero,
        legend: const Legend(overflowMode: LegendItemOverflowMode.wrap),
        series: controller.salesChart(),
        tooltipBehavior: controller.tooltipBehavior,
        borderWidth: 0,
      );
    }

    return MyContainer.bordered(
      borderRadiusAll: 0,
      paddingAll: 24,
      height: 500,
      border: Border(
        bottom: BorderSide.none,
        left: BorderSide.none,
        top: BorderSide.none,
        right: BorderSide(color: Colors.grey.shade300),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Conversation', fontWeight: 600),
          totalSalesChart(),
          Center(
            child: Wrap(
              runAlignment: WrapAlignment.spaceEvenly,
              alignment: WrapAlignment.spaceEvenly,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 40,
              children: <Widget>[
                Column(children: <Widget>[MyText.bodyMedium('This Week', fontWeight: 600, muted: true), MySpacing.height(8), MyText.titleLarge('23.5k', fontWeight: 600)]),
                Column(children: <Widget>[MyText.bodyMedium('Last Week', fontWeight: 600, muted: true), MySpacing.height(8), MyText.titleLarge('41.05k', fontWeight: 600)]),
              ],
            ),
          ),
          MyContainer(
            color: UiMixin.contentTheme.background,
            paddingAll: 12,
            onTap: () {},
            child: Center(child: MyText.bodyMedium('View Details', fontWeight: 600)),
          ),
        ],
      ),
    );
  }

  Widget performance() {
    return MyContainer.bordered(
      borderRadiusAll: 0,
      paddingAll: 24,
      border: Border(
        bottom: BorderSide.none,
        left: BorderSide.none,
        top: BorderSide.none,
        right: BorderSide(color: Colors.grey.shade300),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MyText.titleMedium('Performance', fontWeight: 600),
              Wrap(
                spacing: 16,
                children: <Widget>[
                  for (final TimePeriod period in TimePeriod.values)
                    MyContainer.bordered(
                      paddingAll: 8,
                      onTap: () => controller.selectPriority(period),
                      color: controller.selectedPeriod == period ? UiMixin.contentTheme.background : UiMixin.contentTheme.disabled,
                      child: MyText.bodySmall(controller.getPeriodLabel(period), fontWeight: controller.selectedPeriod == period ? 600 : 500),
                    ),
                ],
              ),
            ],
          ),
          MySpacing.height(20),
          MyContainer(color: UiMixin.contentTheme.info.withValues(alpha: .2), width: double.infinity, child: MyText.bodyMedium('We regret to inform you that our server is currently experiencing technical difficulties.', fontWeight: 600)),
          MySpacing.height(20),
          SizedBox(
            height: 332,
            child: SfCartesianChart(
              primaryXAxis: const CategoryAxis(),
              margin: MySpacing.zero,
              tooltipBehavior: controller.chart,
              legend: const Legend(isVisible: true, position: LegendPosition.bottom),
              axes: <ChartAxis>[NumericAxis(numberFormat: NumberFormat.compact(), majorGridLines: const MajorGridLines(width: 0), opposedPosition: true, name: 'yAxis1', interval: 1000, minimum: 0, maximum: 7000)],
              series: <CartesianSeries<dynamic, dynamic>>[
                ColumnSeries<ChartSampleData, dynamic>(
                  animationDuration: 2000,
                  width: 0.5,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4)),
                  color: UiMixin.contentTheme.purple,
                  dataSource: controller.chartData,
                  xValueMapper: (ChartSampleData data, _) => data.x,
                  yValueMapper: (ChartSampleData data, _) => data.y,
                  name: 'Page Views',
                ),
                LineSeries<ChartSampleData, dynamic>(
                  dataSource: controller.chartData,
                  xValueMapper: (ChartSampleData data, _) => data.x,
                  yValueMapper: (ChartSampleData data, _) => data.yValue,
                  yAxisName: 'yAxis1',
                  color: UiMixin.contentTheme.success,
                  markerSettings: const MarkerSettings(isVisible: true),
                  name: 'Clicks',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget myTask() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      paddingAll: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: MySpacing.all(16),
            child: Row(
              children: <Widget>[
                Expanded(child: MyText.titleMedium('My Task', fontWeight: 600)),
                MyContainer(
                  onTap: () {},
                  color: UiMixin.contentTheme.primary,
                  paddingAll: 8,
                  child: Row(
                    children: <Widget>[
                      Icon(LucideIcons.plus, size: 16, color: UiMixin.contentTheme.onPrimary),
                      MyText.labelMedium('Create Task', color: UiMixin.contentTheme.onPrimary),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 0),
          SizedBox(
            height: 350,
            child: ListView.separated(
              itemCount: controller.todoList.length,
              padding: MySpacing.all(16),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final TodoItem todo = controller.todoList[index];
                return TodoItemWidget(item: todo, onChanged: () => controller.toggleCheckbox(index));
              },
              separatorBuilder: (BuildContext context, int index) {
                return MySpacing.height(16);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget friendsRequest() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      paddingAll: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: MySpacing.all(16), child: MyText.titleMedium('Friends Request (${controller.users.length})', fontWeight: 600)),
          const Divider(height: 0),
          SizedBox(
            height: 363,
            child: ListView.separated(
              itemCount: controller.users.length,
              padding: MySpacing.all(16),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final Map<String, String> user = controller.users[index];
                return Row(
                  children: <Widget>[
                    MyContainer(
                      height: 36,
                      width: 36,
                      paddingAll: 0,
                      borderRadiusAll: 2,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image.asset(user['image']!, fit: BoxFit.cover),
                    ),
                    MySpacing.width(16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          MyText.bodyMedium(user['name']!, fontWeight: 600, color: UiMixin.contentTheme.secondary),
                          MySpacing.height(4),
                          MyText.bodyMedium(user['mutualFriends']!, fontWeight: 600, xMuted: true),
                        ],
                      ),
                    ),
                    PopupMenuButton<String>(
                      iconSize: 20,
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(
                          value: 'Value1',
                          child: Row(children: <Widget>[const Icon(LucideIcons.users, size: 16), MySpacing.width(6), MyText.bodyMedium('See Profile', fontWeight: 600)]),
                        ),
                        PopupMenuItem<String>(
                          value: 'Value2',
                          child: Row(children: <Widget>[const Icon(LucideIcons.send, size: 16), MySpacing.width(6), MyText.bodyMedium('Message to Victoria', fontWeight: 600)]),
                        ),
                        PopupMenuItem<String>(
                          value: 'Value3',
                          child: Row(children: <Widget>[const Icon(LucideIcons.user_x, size: 16), MySpacing.width(6), MyText.bodyMedium('Unfriend Victoria', fontWeight: 600)]),
                        ),
                        PopupMenuItem<String>(
                          value: 'Value4',
                          child: Row(children: <Widget>[const Icon(LucideIcons.ban, size: 16), MySpacing.width(6), MyText.bodyMedium('Block Victoria', fontWeight: 600)]),
                        ),
                      ],
                    ),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return MySpacing.height(16);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget recentTransactions() {
    return MyCard(
      shadow: MyShadow(elevation: 0.5),
      paddingAll: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: MySpacing.all(16),
            child: Row(
              children: <Widget>[
                Expanded(child: MyText.titleMedium('Recent Transactions', fontWeight: 600)),
                MyContainer(
                  color: UiMixin.contentTheme.primary,
                  paddingAll: 8,
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(LucideIcons.plus, color: UiMixin.contentTheme.onPrimary, size: 16),
                      MyText.labelMedium('Add', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 0),
          SizedBox(
            height: 348,
            child: SingleChildScrollView(
              child: DataTable(
                columns: <DataColumn>[
                  DataColumn(label: MyText.titleMedium('Date', fontWeight: 600)),
                  DataColumn(label: MyText.titleMedium('Amount', fontWeight: 600)),
                  DataColumn(label: MyText.titleMedium('Type', fontWeight: 600)),
                  DataColumn(label: MyText.titleMedium('Description', fontWeight: 600)),
                ],
                rows: <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(MyText.bodySmall('24 April, 2024', fontWeight: 600)),
                      DataCell(MyText.bodySmall('\$120.55', fontWeight: 600)),
                      DataCell(
                        MyContainer(
                          color: UiMixin.contentTheme.success,
                          paddingAll: 3,
                          child: MyText.bodySmall('Cr', color: UiMixin.contentTheme.onSuccess),
                        ),
                      ),
                      const DataCell(Text('Commissions')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      const DataCell(Text('24 April, 2024')),
                      const DataCell(Text('\$9.68')),
                      DataCell(
                        MyContainer(
                          color: UiMixin.contentTheme.success,
                          paddingAll: 3,
                          child: MyText.bodySmall('Cr', color: UiMixin.contentTheme.onSuccess),
                        ),
                      ),
                      const DataCell(Text('Affiliates')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      const DataCell(Text('20 April, 2024')),
                      const DataCell(Text('\$105.22')),
                      DataCell(
                        MyContainer(
                          color: UiMixin.contentTheme.danger,
                          paddingAll: 3,
                          child: MyText.bodySmall('Dr', color: UiMixin.contentTheme.onDanger),
                        ),
                      ),
                      const DataCell(Text('Grocery')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      const DataCell(Text('18 April, 2024')),
                      const DataCell(Text('\$80.59')),
                      DataCell(
                        MyContainer(
                          color: UiMixin.contentTheme.success,
                          paddingAll: 3,
                          child: MyText.bodySmall('Cr', color: UiMixin.contentTheme.onSuccess),
                        ),
                      ),
                      const DataCell(Text('Refunds')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      const DataCell(Text('18 April, 2024')),
                      const DataCell(Text('\$750.95')),
                      DataCell(
                        MyContainer(
                          color: UiMixin.contentTheme.danger,
                          paddingAll: 3,
                          child: MyText.bodySmall('Dr', color: UiMixin.contentTheme.onDanger),
                        ),
                      ),
                      const DataCell(Text('Bill Payments')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      const DataCell(Text('17 April, 2024')),
                      const DataCell(Text('\$455.62')),
                      DataCell(
                        MyContainer(
                          color: UiMixin.contentTheme.danger,
                          paddingAll: 3,
                          child: MyText.bodySmall('Dr', color: UiMixin.contentTheme.onDanger),
                        ),
                      ),
                      const DataCell(Text('Electricity')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      const DataCell(Text('17 April, 2024')),
                      const DataCell(Text('\$102.77')),
                      DataCell(
                        MyContainer(
                          color: UiMixin.contentTheme.success,
                          paddingAll: 3,
                          child: MyText.bodySmall('Cr', color: UiMixin.contentTheme.onSuccess),
                        ),
                      ),
                      const DataCell(Text('Interest')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      const DataCell(Text('16 April, 2024')),
                      const DataCell(Text('\$79.49')),
                      DataCell(
                        MyContainer(
                          color: UiMixin.contentTheme.success,
                          paddingAll: 3,
                          child: MyText.bodySmall('Cr', color: UiMixin.contentTheme.onSuccess),
                        ),
                      ),
                      const DataCell(Text('Refunds')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      const DataCell(Text('05 April, 2024')),
                      const DataCell(Text('\$980.00')),
                      DataCell(
                        MyContainer(
                          color: UiMixin.contentTheme.danger,
                          paddingAll: 3,
                          child: MyText.bodySmall('Dr', color: UiMixin.contentTheme.onDanger),
                        ),
                      ),
                      const DataCell(Text('Shopping')),
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
}

class TodoItemWidget extends StatelessWidget {
  final TodoItem item;
  final VoidCallback onChanged;

  const TodoItemWidget({super.key, required this.item, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Theme(
          data: ThemeData(),
          child: Checkbox(
            value: item.isChecked,
            onChanged: (bool? value) {
              if (value != null) {
                onChanged();
              }
            },
            shape: const CircleBorder(),
          ),
        ),
        MySpacing.width(12),
        Expanded(child: MyText.bodyMedium(item.title, decoration: item.isChecked ? TextDecoration.lineThrough : TextDecoration.none)),
      ],
    );
  }
}
