import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../images.dart';
import '../../charts/controllers/charts_controller.dart';

enum TimePeriod { all, oneMonth, sixMonths, oneYear }

class WidgetsController extends GetxController {
  TooltipBehavior? tooltipBehavior;
  TimePeriod selectedPeriod = TimePeriod.oneYear;
  final TooltipBehavior chart = TooltipBehavior(enable: true, format: 'point.x : point.yValue1 : point.yValue2', tooltipPosition: TooltipPosition.pointer);

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

  List<TodoItem> todoList = <TodoItem>[
    TodoItem(title: 'Review system logs for any reported errors', isChecked: false),
    TodoItem(title: 'Conduct user testing to identify potential bugs', isChecked: true),
    TodoItem(title: 'Gather feedback from stakeholders', isChecked: false),
    TodoItem(title: 'Prioritize bugs based on severity and impact', isChecked: false),
    TodoItem(title: 'Investigate and analyze the root cause of each bug', isChecked: false),
    TodoItem(title: 'Develop and implement fixes for the identified bugs', isChecked: false),
    TodoItem(title: 'Complete any recurring tasks', isChecked: false),
    TodoItem(title: 'Check emails and respond', isChecked: false),
    TodoItem(title: 'Review schedule for the day', isChecked: true),
    TodoItem(title: 'Daily stand-up meeting', isChecked: false),
  ];

  final List<Map<String, String>> users = <Map<String, String>>[
    <String, String>{'name': 'Victoria P. Miller', 'image': Images.avatars[10], 'mutualFriends': 'no mutual friends'},
    <String, String>{'name': 'Dallas C. Payne', 'image': Images.avatars[9], 'mutualFriends': '856 mutual friends'},
    <String, String>{'name': 'Florence A. Lopez', 'image': Images.avatars[8], 'mutualFriends': '52 mutual friends'},
    <String, String>{'name': 'Gail A. Nix', 'image': Images.avatars[7], 'mutualFriends': '12 mutual friends'},
    <String, String>{'name': 'Lynne J. Petty', 'image': Images.avatars[6], 'mutualFriends': 'no mutual friends'},
    <String, String>{'name': 'Victoria P. Miller', 'image': Images.avatars[5], 'mutualFriends': 'no mutual friends'},
    <String, String>{'name': 'Dallas C. Payne', 'image': Images.avatars[4], 'mutualFriends': '856 mutual friends'},
    <String, String>{'name': 'Florence A. Lopez', 'image': Images.avatars[3], 'mutualFriends': '52 mutual friends'},
    <String, String>{'name': 'Gail A. Nix', 'image': Images.avatars[2], 'mutualFriends': '12 mutual friends'},
    <String, String>{'name': 'Lynne J. Petty', 'image': Images.avatars[1], 'mutualFriends': 'no mutual friends'},
  ];

  void toggleCheckbox(int index) {
    todoList[index].isChecked = !todoList[index].isChecked;
    update();
  }
}

class TodoItem {
  final String title;
  bool isChecked;

  TodoItem({required this.title, this.isChecked = false});
}
