import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

import '../../../data/models/chart_model.dart';

enum TimePeriod { all, oneMonth, sixMonths, oneYear }

class DashboardController extends GetxController {
  TimePeriod selectedPeriod = TimePeriod.oneYear;
  String selectedTeamMember = 'Download';
  final TooltipBehavior chart = TooltipBehavior(enable: true, format: 'point.x : point.yValue1 : point.yValue2', tooltipPosition: TooltipPosition.pointer);

  TooltipBehavior? tooltipBehavior;
  late List<TimeDetails> worldClockData;
  late MapShapeSource mapSource;

  String getPeriodLabel(TimePeriod period) {
    switch (period) {
      case TimePeriod.all:
        return 'ALL';
      case TimePeriod.oneMonth:
        return '1M';
      case TimePeriod.sixMonths:
        return '6M';
      case TimePeriod.oneYear:
        return '1Y';
    }
  }

  void onTeamMember(String time) {
    selectedTeamMember = time;
    update();
  }

  final List<ChartSampleData> chartData = <ChartSampleData>[
    ChartSampleData(x: 'Jan', y: 15, yValue: 800),
    ChartSampleData(x: 'Feb', y: 25, yValue: 1500),
    ChartSampleData(x: 'Mar', y: 27, yValue: 2000),
    ChartSampleData(x: 'Apr', y: 40, yValue: 3000),
    ChartSampleData(x: 'May', y: 30, yValue: 2200),
    ChartSampleData(x: 'Jun', y: 25, yValue: 1800),
    ChartSampleData(x: 'Jul', y: 40, yValue: 3000),
    ChartSampleData(x: 'Aug', y: 55, yValue: 2500),
    ChartSampleData(x: 'Sep', y: 42, yValue: 2200),
    ChartSampleData(x: 'Oct', y: 70, yValue: 4000),
    ChartSampleData(x: 'Nov', y: 60, yValue: 2000),
    ChartSampleData(x: 'Dec', y: 33, yValue: 1000),
  ];

  void selectPriority(TimePeriod period) {
    selectedPeriod = period;
    update();
  }

  List<DoughnutSeries<ChartSampleData, String>> salesChart() {
    return <DoughnutSeries<ChartSampleData, String>>[
      DoughnutSeries<ChartSampleData, String>(
        explode: true,
        dataSource: <ChartSampleData>[
          ChartSampleData(x: 'Brooklyn, New York', y: 41.05, text: '41.05%'),
          ChartSampleData(x: 'The Castro, San Francisco', y: 23.5, text: '23.5%'),
        ],
        xValueMapper: (ChartSampleData data, _) => data.x as String,
        yValueMapper: (ChartSampleData data, _) => data.y,
        dataLabelMapper: (ChartSampleData data, _) => data.text,
        dataLabelSettings: const DataLabelSettings(isVisible: true),
      ),
    ];
  }

  List<Map<String, String>> sessionByBrowserData = <Map<String, String>>[
    <String, String>{'browser': 'Chrome', 'percentage': '62.5%', 'user_count': '5.06k'},
    <String, String>{'browser': 'Firefox', 'percentage': '12.3%', 'user_count': '1.5k'},
    <String, String>{'browser': 'Safari', 'percentage': '9.86%', 'user_count': '1.03k'},
    <String, String>{'browser': 'Brave', 'percentage': '3.15%', 'user_count': '0.3k'},
    <String, String>{'browser': 'Opera', 'percentage': '3.01%', 'user_count': '1.58k'},
    <String, String>{'browser': 'Falkon', 'percentage': '2.8%', 'user_count': '0.01k'},
    <String, String>{'browser': 'Web', 'percentage': '1.05%', 'user_count': '2.51k'},
    <String, String>{'browser': 'Other', 'percentage': '6.38%', 'user_count': '3.6k'},
  ];

  @override
  void onInit() {
    tooltipBehavior = TooltipBehavior(enable: true, format: 'point.x : point.y%');
    final DateTime currentTime = DateTime.now().toUtc();
    worldClockData = <TimeDetails>[
      TimeDetails('Seattle', 47.60621, -122.332071, currentTime.subtract(const Duration(hours: 7))),
      TimeDetails('Belem', -1.455833, -48.503887, currentTime.subtract(const Duration(hours: 3))),
      TimeDetails('Greenland', 71.706936, -42.604303, currentTime.subtract(const Duration(hours: 2))),
      TimeDetails('Yakutsk', 62.035452, 129.675475, currentTime.add(const Duration(hours: 9))),
      TimeDetails('Delhi', 28.704059, 77.10249, currentTime.add(const Duration(hours: 5, minutes: 30))),
      TimeDetails('Brisbane', -27.469771, 153.025124, currentTime.add(const Duration(hours: 10))),
      TimeDetails('Harare', -17.825166, 31.03351, currentTime.add(const Duration(hours: 2))),
    ];

    mapSource = const MapShapeSource.asset('assets/data/world_map.json', shapeDataField: 'name');
    super.onInit();
  }

  @override
  void dispose() {
    worldClockData.clear();
    super.dispose();
  }
}

class TimeDetails {
  TimeDetails(this.countryName, this.latitude, this.longitude, this.date);

  final String countryName;
  final double latitude;
  final double longitude;
  final DateTime date;
}
