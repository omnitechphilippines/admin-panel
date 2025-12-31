import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartsController extends GetxController {
  List<ChartData>? chartData;
  TooltipBehavior? tooltipBehavior;
  late MarkerSettings markerSettings;

  List<ChartSampleData>? columnChartData;

  List<ChartSampleData>? splineChartData;

  List<ChartSampleData>? areaChartData;

  List<ChartSampleData>? bubbleChartData;

  List<ChartSampleData> pieChartData = <ChartSampleData>[];

  List<ChartSampleData> chartWithLegendData = <ChartSampleData>[];

  List<ChartSampleData>? scatterChartData;

  List<ChartSampleData>? stepLineData;

  @override
  void onInit() {
    super.onInit();
    chartData = <ChartData>[ChartData(2005, 21, 28), ChartData(2006, 24, 44), ChartData(2007, 36, 48), ChartData(2008, 38, 50), ChartData(2009, 54, 66), ChartData(2010, 57, 78), ChartData(2011, 70, 84)];
    tooltipBehavior = TooltipBehavior(enable: true);

    tooltipBehavior = TooltipBehavior(enable: true, header: '', canShowMarker: false);
    columnChartData = <ChartSampleData>[
      ChartSampleData(x: 'China', y: 0.541),
      ChartSampleData(x: 'Brazil', y: 0.818),
      ChartSampleData(x: 'Bolivia', y: 1.51),
      ChartSampleData(x: 'Mexico', y: 1.302),
      ChartSampleData(x: 'Egypt', y: 2.017),
      ChartSampleData(x: 'Mongolia', y: 1.683),
    ];

    splineChartData = <ChartSampleData>[
      ChartSampleData(x: 'Jan', y: 43, secondSeriesYValue: 37, thirdSeriesYValue: 41),
      ChartSampleData(x: 'Feb', y: 45, secondSeriesYValue: 37, thirdSeriesYValue: 45),
      ChartSampleData(x: 'Mar', y: 50, secondSeriesYValue: 39, thirdSeriesYValue: 48),
      ChartSampleData(x: 'Apr', y: 55, secondSeriesYValue: 43, thirdSeriesYValue: 52),
      ChartSampleData(x: 'May', y: 63, secondSeriesYValue: 48, thirdSeriesYValue: 57),
      ChartSampleData(x: 'Jun', y: 68, secondSeriesYValue: 54, thirdSeriesYValue: 61),
      ChartSampleData(x: 'Jul', y: 72, secondSeriesYValue: 57, thirdSeriesYValue: 66),
      ChartSampleData(x: 'Aug', y: 70, secondSeriesYValue: 57, thirdSeriesYValue: 66),
      ChartSampleData(x: 'Sep', y: 66, secondSeriesYValue: 54, thirdSeriesYValue: 63),
      ChartSampleData(x: 'Oct', y: 57, secondSeriesYValue: 48, thirdSeriesYValue: 55),
      ChartSampleData(x: 'Nov', y: 50, secondSeriesYValue: 43, thirdSeriesYValue: 50),
      ChartSampleData(x: 'Dec', y: 45, secondSeriesYValue: 37, thirdSeriesYValue: 45),
    ];

    areaChartData = <ChartSampleData>[
      ChartSampleData(x: DateTime(2000), y: 4, secondSeriesYValue: 2.6),
      ChartSampleData(x: DateTime(2001), y: 3.0, secondSeriesYValue: 2.8),
      ChartSampleData(x: DateTime(2002), y: 3.8, secondSeriesYValue: 2.6),
      ChartSampleData(x: DateTime(2003), y: 3.4, secondSeriesYValue: 3),
      ChartSampleData(x: DateTime(2004), y: 3.2, secondSeriesYValue: 3.6),
      ChartSampleData(x: DateTime(2005), y: 3.9, secondSeriesYValue: 3),
    ];

    tooltipBehavior = TooltipBehavior(enable: true, header: '', canShowMarker: false, format: 'point.x\nLiteracy rate : point.x%\nGDP growth rate : point.y\nPopulation : point.sizeB');
    bubbleChartData = <ChartSampleData>[
      ChartSampleData(x: 'China', xValue: 92.2, y: 7.8, size: 1.347),
      ChartSampleData(x: 'India', xValue: 74, y: 6.5, size: 1.241),
      ChartSampleData(x: 'Indonesia', xValue: 90.4, y: 6.0, size: 0.238),
      ChartSampleData(x: 'US', xValue: 99.4, y: 2.2, size: 0.312),
      ChartSampleData(x: 'Germany', xValue: 99, y: 0.7, size: 0.0818),
      ChartSampleData(x: 'Egypt', xValue: 72, y: 2.0, size: 0.0826),
      ChartSampleData(x: 'Russia', xValue: 99.6, y: 3.4, size: 0.143),
      ChartSampleData(x: 'Japan', xValue: 99, y: 0.2, size: 0.128),
      ChartSampleData(x: 'Mexico', xValue: 86.1, y: 4.0, size: 0.115),
      ChartSampleData(x: 'Philippines', xValue: 92.6, y: 6.6, size: 0.096),
      ChartSampleData(x: 'Nigeria', xValue: 61.3, y: 1.45, size: 0.162),
      ChartSampleData(x: 'Hong Kong', xValue: 82.2, y: 3.97, size: 0.7),
      ChartSampleData(x: 'Netherland', xValue: 79.2, y: 3.9, size: 0.162),
      ChartSampleData(x: 'Jordan', xValue: 72.5, y: 4.5, size: 0.7),
      ChartSampleData(x: 'Australia', xValue: 81, y: 3.5, size: 0.21),
      ChartSampleData(x: 'Mongolia', xValue: 66.8, y: 3.9, size: 0.028),
      ChartSampleData(x: 'Taiwan', xValue: 78.4, y: 2.9, size: 0.231),
    ];

    pieChartData = <ChartSampleData>[
      ChartSampleData(x: 'David', y: 13, text: 'David \n 13%'),
      ChartSampleData(x: 'Steve', y: 24, text: 'Steve \n 24%'),
      ChartSampleData(x: 'Jack', y: 25, text: 'Jack \n 25%'),
      ChartSampleData(x: 'Others', y: 38, text: 'Others \n 38%'),
    ];

    chartWithLegendData = <ChartSampleData>[
      ChartSampleData(x: 'Coal', y: 56.2),
      ChartSampleData(x: 'Large Hydro', y: 12.7),
      ChartSampleData(x: 'Small Hydro', y: 1.3),
      ChartSampleData(x: 'Wind Power', y: 10),
      ChartSampleData(x: 'Solar Power', y: 8),
      ChartSampleData(x: 'Biomass', y: 2.6),
      ChartSampleData(x: 'Nuclear', y: 1.9),
      ChartSampleData(x: 'Gas', y: 7),
      ChartSampleData(x: 'Diesel', y: 0.2),
    ];

    scatterChartData = <ChartSampleData>[
      ChartSampleData(x: DateTime(2006), y: 0.01, yValue: -0.03, secondSeriesYValue: 0.10),
      ChartSampleData(x: DateTime(2007), y: 0.03, yValue: -0.02, secondSeriesYValue: 0.08),
      ChartSampleData(x: DateTime(2008), y: -0.06, yValue: -0.13, secondSeriesYValue: -0.03),
      ChartSampleData(x: DateTime(2009), y: -0.03, yValue: -0.04, secondSeriesYValue: 0.04),
      ChartSampleData(x: DateTime(2010), y: 0.09, yValue: 0.07, secondSeriesYValue: 0.19),
      ChartSampleData(x: DateTime(2011), y: 0, yValue: 0.04, secondSeriesYValue: 0),
      ChartSampleData(x: DateTime(2012), y: 0.01, yValue: -0.01, secondSeriesYValue: -0.09),
      ChartSampleData(x: DateTime(2013), y: 0.05, yValue: 0.05, secondSeriesYValue: 0.10),
      ChartSampleData(x: DateTime(2014), y: 0, yValue: 0.08, secondSeriesYValue: 0.05),
      ChartSampleData(x: DateTime(2015), y: 0.1, yValue: 0.01, secondSeriesYValue: -0.04),
      ChartSampleData(x: DateTime(2016), y: 0.08, yValue: 0, secondSeriesYValue: 0.02),
    ];
    markerSettings = const MarkerSettings(height: 15, width: 15);

    stepLineData = <ChartSampleData>[
      ChartSampleData(x: 2000, y: 416, secondSeriesYValue: 180),
      ChartSampleData(x: 2001, y: 490, secondSeriesYValue: 240),
      ChartSampleData(x: 2002, y: 470, secondSeriesYValue: 370),
      ChartSampleData(x: 2003, y: 500, secondSeriesYValue: 200),
      ChartSampleData(x: 2004, y: 449, secondSeriesYValue: 229),
      ChartSampleData(x: 2005, y: 470, secondSeriesYValue: 210),
      ChartSampleData(x: 2006, y: 437, secondSeriesYValue: 337),
      ChartSampleData(x: 2007, y: 458, secondSeriesYValue: 258),
      ChartSampleData(x: 2008, y: 500, secondSeriesYValue: 300),
      ChartSampleData(x: 2009, y: 473, secondSeriesYValue: 173),
      ChartSampleData(x: 2010, y: 520, secondSeriesYValue: 220),
      ChartSampleData(x: 2011, y: 509, secondSeriesYValue: 309),
    ];
  }

  @override
  void onClose() {
    chartData!.clear();
    columnChartData!.clear();
    splineChartData!.clear();
    areaChartData!.clear();
    bubbleChartData!.clear();
    pieChartData.clear();
    chartWithLegendData.clear();
    scatterChartData!.clear();
    super.onClose();
  }
}

class ChartData {
  ChartData(this.x, this.y, this.y2);

  final double x;
  final double y;
  final double y2;
}

class ChartSampleData {
  ChartSampleData({this.x, this.y, this.xValue, this.yValue, this.secondSeriesYValue, this.thirdSeriesYValue, this.pointColor, this.size, this.text, this.open, this.close, this.low, this.high, this.volume});

  final dynamic x;
  final num? y;
  final dynamic xValue;
  final num? yValue;
  final num? secondSeriesYValue;
  final num? thirdSeriesYValue;
  final Color? pointColor;
  final num? size;
  final String? text;
  final num? open;
  final num? close;
  final num? low;
  final num? high;
  final num? volume;
}
