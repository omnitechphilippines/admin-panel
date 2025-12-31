import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

import '../../../../helper/services/auth_services.dart';
import '../../../../helper/utils/my_shadow.dart';
import '../../../../helper/widgets/my_card.dart';
import '../../../../helper/widgets/my_container.dart';
import '../../../../helper/widgets/my_flex.dart';
import '../../../../helper/widgets/my_flex_item.dart';
import '../../../../helper/widgets/my_spacing.dart';
import '../../../../helper/widgets/my_text.dart';
import '../../../../helper/widgets/responsive.dart';
import '../../../../themes/app_theme.dart';
import '../../../../themes/ui_mixin.dart';
import '../../../../views/layout/layout.dart';
import '../../../data/models/chart_model.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder<DashboardController>(
        init: controller,
        builder: (DashboardController controller) {
          return Padding(
            padding: MySpacing.x(flexSpacing / 2),
            child: MyFlex(
              children: <MyFlexItem>[
                MyFlexItem(sizes: 'lg-3 md-6', child: stats('Page View', '13, 647', ' 2.3', true, 'assets/other/leaf.svg')),
                MyFlexItem(sizes: 'lg-3 md-6', child: stats('Clicks', '9, 526', '8.1', true, 'assets/other/cpu_bolt.svg')),
                MyFlexItem(sizes: 'lg-3 md-6', child: stats('Conversions', '976', '0.3', false, 'assets/other/layers.svg')),
                MyFlexItem(sizes: 'lg-3 md-6', child: stats('New Users', '\$123.6k', '10.6', false, 'assets/other/users_group_two.svg')),
                MyFlexItem(
                  sizes: 'lg-3 md-6',
                  child: const ElevatedButton(onPressed: AuthService.logout, child: Text('Logout')),
                ),
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
                        MyFlexItem(sizes: 'lg-3', child: conversation()),
                        MyFlexItem(sizes: 'lg-6', child: performance()),
                        MyFlexItem(sizes: 'lg-3', child: sessionByBrowser()),
                      ],
                    ),
                  ),
                ),
                MyFlexItem(sizes: 'lg-6 md-6', child: sessionsByCountry()),
                MyFlexItem(sizes: 'lg-6 md-6', child: topPages()),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget stats(String title, String value, String percentage, bool isPositive, String svgImage) {
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
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[MyText.bodyMedium(title, muted: true, fontWeight: 600), MySpacing.height(6), MyText.titleLarge(value, fontWeight: 700)]),
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
                spacing: 4,
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
          MyContainer(color: UiMixin.contentTheme.warning.withValues(alpha: .2), width: double.infinity, child: MyText.bodyMedium('We regret to inform you that our server is currently experiencing technical difficulties.', fontWeight: 600)),
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
                  color: UiMixin.contentTheme.success,
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
                  color: UiMixin.contentTheme.primary,
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

  Widget sessionByBrowser() {
    return MyContainer(
      borderRadiusAll: 0,
      paddingAll: 24,
      height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Session by browser', fontWeight: 600),
          MySpacing.height(24),
          for (final Map<String, String> session in controller.sessionByBrowserData)
            Padding(
              padding: MySpacing.bottom(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[MyText.bodyMedium(session['browser']!, fontWeight: 600), MyText.bodyMedium(session['percentage']!, fontWeight: 600), MyText.bodyMedium(session['user_count']!, fontWeight: 600)],
              ),
            ),
          const Spacer(),
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

  Widget sessionsByCountry() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(child: MyText.titleMedium('Sessions by Country', fontWeight: 600)),
              PopupMenuButton<String>(
                onSelected: controller.onTeamMember,
                itemBuilder: (BuildContext context) {
                  return <String>['Download', 'Export', 'Import'].map((String behavior) {
                    return PopupMenuItem<String>(
                      value: behavior,
                      height: 32,
                      child: MyText.bodySmall(behavior.toString(), color: theme.colorScheme.onSurface, fontWeight: 600),
                    );
                  }).toList();
                },
                color: theme.cardTheme.color,
                child: MyContainer.bordered(
                  padding: MySpacing.xy(8, 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MyText.labelMedium(controller.selectedTeamMember.toString(), color: UiMixin.contentTheme.onBackground),
                      MySpacing.width(4),
                      Icon(LucideIcons.chevron_down, size: 18, color: UiMixin.contentTheme.onBackground),
                    ],
                  ),
                ),
              ),
            ],
          ),
          MySpacing.height(12),
          MyFlex(
            runAlignment: WrapAlignment.center,
            wrapAlignment: WrapAlignment.center,
            wrapCrossAlignment: WrapCrossAlignment.center,
            children: <MyFlexItem>[
              MyFlexItem(
                sizes: 'lg-6',
                child: SfMaps(
                  layers: <MapLayer>[
                    MapShapeLayer(
                      loadingBuilder: (BuildContext context) {
                        return const CircularProgressIndicator(strokeWidth: 3);
                      },
                      source: controller.mapSource,
                      initialMarkersCount: 7,
                      markerBuilder: (_, int index) {
                        return MapMarker(
                          longitude: controller.worldClockData[index].longitude,
                          latitude: controller.worldClockData[index].latitude,
                          alignment: Alignment.topCenter,
                          offset: const Offset(0, -4),
                          size: const Size(100, 100),
                          child: _clockWidget(controller.worldClockData[index].countryName),
                        );
                      },
                      strokeWidth: 0,
                    ),
                  ],
                ),
              ),
              MyFlexItem(
                sizes: 'lg-6',
                child: const Column(
                  children: <Widget>[
                    CountryProgress(country: 'United States', flagIcon: 'assets/svg/USA.svg', progress: 82.05, value: '659k', progressColor: Colors.grey),
                    CountryProgress(country: 'Russia', flagIcon: 'assets/svg/Russia.svg', progress: 70.5, value: '485k', progressColor: Colors.blue),
                    CountryProgress(country: 'China', flagIcon: 'assets/svg/China.svg', progress: 65.8, value: '355k', progressColor: Colors.orange),
                    CountryProgress(country: 'Canada', flagIcon: 'assets/svg/Canada.svg', progress: 55.8, value: '204k', progressColor: Colors.green),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget topPages() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: 375,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(child: MyText.titleMedium('Top Pages', fontWeight: 700)),
              MyContainer(
                paddingAll: 8,
                color: UiMixin.contentTheme.primary.withValues(alpha: 0.2),
                onTap: () {},
                child: MyText.labelMedium('View All', fontWeight: 600, color: UiMixin.contentTheme.primary),
              ),
            ],
          ),
          MySpacing.height(16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 90,
              headingRowColor: WidgetStatePropertyAll<Color?>(UiMixin.contentTheme.secondary.withValues(alpha: 0.15)),
              columns: <DataColumn>[
                DataColumn(label: MyText.bodyMedium('Page Path', fontWeight: 600)),
                DataColumn(label: MyText.bodyMedium('Page Views', fontWeight: 600)),
                DataColumn(label: MyText.bodyMedium('Avg Time on Page', fontWeight: 600)),
                DataColumn(label: MyText.bodyMedium('Exit Rate', fontWeight: 600)),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(MyText.bodyMedium('omni/dashboard.html', fontWeight: 600, xMuted: true)),
                    DataCell(MyText.bodyMedium('4265', fontWeight: 600, xMuted: true)),
                    DataCell(MyText.bodyMedium('09m:45s', fontWeight: 600, xMuted: true)),
                    DataCell(
                      MyContainer(
                        color: UiMixin.contentTheme.danger.withValues(alpha: 0.2),
                        paddingAll: 4,
                        child: MyText.labelSmall('20.4%', fontWeight: 600, color: UiMixin.contentTheme.danger),
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(MyText.bodyMedium('omni/chat.html', fontWeight: 600, xMuted: true)),
                    DataCell(MyText.bodyMedium('2584', fontWeight: 600, xMuted: true)),
                    DataCell(MyText.bodyMedium('05m:02s', fontWeight: 600, xMuted: true)),
                    DataCell(
                      MyContainer(
                        color: UiMixin.contentTheme.warning.withValues(alpha: 0.2),
                        paddingAll: 4,
                        child: MyText.labelSmall('12.25%', fontWeight: 600, color: UiMixin.contentTheme.warning),
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(MyText.bodyMedium('omni/auth-login.html', fontWeight: 600, xMuted: true)),
                    DataCell(MyText.bodyMedium('3369', fontWeight: 600, xMuted: true)),
                    DataCell(MyText.bodyMedium('04m:25s', fontWeight: 600, xMuted: true)),
                    DataCell(
                      MyContainer(
                        color: UiMixin.contentTheme.success.withValues(alpha: 0.2),
                        paddingAll: 4,
                        child: MyText.labelSmall('5.2%', fontWeight: 600, color: UiMixin.contentTheme.success),
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(MyText.bodyMedium('omni/email.html', fontWeight: 600, xMuted: true)),
                    DataCell(MyText.bodyMedium('985', fontWeight: 600, xMuted: true)),
                    DataCell(MyText.bodyMedium('02m:03s', fontWeight: 600, xMuted: true)),
                    DataCell(
                      MyContainer(
                        color: UiMixin.contentTheme.danger.withValues(alpha: 0.2),
                        paddingAll: 4,
                        child: MyText.labelSmall('64.2%', fontWeight: 600, color: UiMixin.contentTheme.danger),
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(MyText.bodyMedium('omni/social.html', fontWeight: 600, xMuted: true)),
                    DataCell(MyText.bodyMedium('653', fontWeight: 600, xMuted: true)),
                    DataCell(MyText.bodyMedium('15m:56s', fontWeight: 600, xMuted: true)),
                    DataCell(
                      MyContainer(
                        color: UiMixin.contentTheme.success.withValues(alpha: 0.2),
                        paddingAll: 4,
                        child: MyText.labelSmall('2.4%', fontWeight: 600, color: UiMixin.contentTheme.success),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _clockWidget(String countryName) {
    return Row(
      children: <Widget>[
        MyContainer.rounded(
          paddingAll: 4,
          color: UiMixin.contentTheme.secondary.withValues(alpha: .6),
          child: MyContainer.rounded(paddingAll: 4, color: UiMixin.contentTheme.secondary),
        ),
        MySpacing.width(4),
        MyText.bodyMedium(countryName, fontWeight: 700),
      ],
    );
  }
}

class CountryProgress extends StatelessWidget {
  final String country;
  final String flagIcon;
  final double progress;
  final String value;
  final Color progressColor;

  const CountryProgress({super.key, required this.country, required this.flagIcon, required this.progress, required this.value, required this.progressColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MySpacing.bottom(16),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(children: <Widget>[SvgPicture.asset(flagIcon, width: 20, height: 20), MySpacing.width(8), MyText.bodyMedium(country, fontWeight: 600)]),
            ],
          ),
          MySpacing.height(8),
          Row(
            children: <Widget>[
              Expanded(
                child: LinearProgressIndicator(
                  value: progress / 100,
                  backgroundColor: Colors.grey.shade300,
                  color: progressColor,
                  minHeight: 4,
                  borderRadius: const BorderRadius.horizontal(left: Radius.circular(12)),
                ),
              ),
              MySpacing.width(8),
              MyText.bodyMedium(value, fontWeight: 600),
            ],
          ),
        ],
      ),
    );
  }
}
