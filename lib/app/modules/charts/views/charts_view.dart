import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../helper/utils/my_shadow.dart';
import '../../../../helper/widgets/my_card.dart';
import '../../../../helper/widgets/my_flex.dart';
import '../../../../helper/widgets/my_flex_item.dart';
import '../../../../helper/widgets/my_spacing.dart';
import '../../../../helper/widgets/my_text.dart';
import '../../../../helper/widgets/responsive.dart';
import '../../../../views/layout/layout.dart';
import '../controllers/charts_controller.dart';

class ChartsView extends GetView<ChartsController> {
  const ChartsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: MySpacing.x(flexSpacing / 2),
        child: Center(
          child: MyFlex(
            children: <MyFlexItem>[
              MyFlexItem(sizes: 'lg-8', child: lineChart()),
              MyFlexItem(sizes: 'lg-8', child: columnChart()),
              MyFlexItem(sizes: 'lg-8', child: spLineChart()),
              MyFlexItem(sizes: 'lg-8', child: areaChart()),
              MyFlexItem(sizes: 'lg-8', child: bubbleChart()),
              MyFlexItem(sizes: 'lg-8', child: pieChart()),
              MyFlexItem(sizes: 'lg-8', child: chartWithLegend()),
              MyFlexItem(sizes: 'lg-8', child: defaultScatterChart()),
              MyFlexItem(sizes: 'lg-8', child: stepLine()),
            ],
          ),
        ),
      ),
    );
  }

  Widget lineChart() {
    List<LineSeries<ChartData, num>> buildLineSeries() {
      return <LineSeries<ChartData, num>>[
        LineSeries<ChartData, num>(
          dataSource: controller.chartData,
          xValueMapper: (ChartData sales, int index) => sales.x,
          yValueMapper: (ChartData sales, int index) => sales.y,
          name: 'Germany',
          markerSettings: const MarkerSettings(isVisible: true),
        ),
        LineSeries<ChartData, num>(
          dataSource: controller.chartData,
          name: 'England',
          xValueMapper: (ChartData sales, int index) => sales.x,
          yValueMapper: (ChartData sales, int index) => sales.y2,
          markerSettings: const MarkerSettings(isVisible: true),
        ),
      ];
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Line Chart', fontWeight: 600),
          MySpacing.height(16),
          SfCartesianChart(
            margin: MySpacing.zero,
            plotAreaBorderWidth: 0,
            primaryXAxis: const NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift, interval: 2, majorGridLines: MajorGridLines(width: 0)),
            primaryYAxis: const NumericAxis(
              labelFormat: '{value}%',
              axisLine: AxisLine(width: 0),
              majorTickLines: MajorTickLines(color: Colors.transparent),
            ),
            series: buildLineSeries(),
            legend: const Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap, position: LegendPosition.bottom),
            tooltipBehavior: controller.tooltipBehavior,
          ),
        ],
      ),
    );
  }

  Widget columnChart() {
    List<ColumnSeries<ChartSampleData, String>> buildColumnSeries() {
      return <ColumnSeries<ChartSampleData, String>>[
        ColumnSeries<ChartSampleData, String>(
          dataSource: controller.columnChartData,
          xValueMapper: (ChartSampleData sales, int index) => sales.x,
          yValueMapper: (ChartSampleData sales, int index) => sales.y,
          dataLabelSettings: const DataLabelSettings(isVisible: true, textStyle: TextStyle(fontSize: 10)),
        ),
      ];
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Column Chart', fontWeight: 600),
          MySpacing.height(16),
          SfCartesianChart(
            plotAreaBorderWidth: 0,
            primaryXAxis: const CategoryAxis(majorGridLines: MajorGridLines(width: 0)),
            primaryYAxis: const NumericAxis(axisLine: AxisLine(width: 0), labelFormat: '{value}%', majorTickLines: MajorTickLines(size: 0)),
            series: buildColumnSeries(),
            tooltipBehavior: controller.tooltipBehavior,
          ),
        ],
      ),
    );
  }

  Widget spLineChart() {
    List<SplineSeries<ChartSampleData, String>> buildSplineSeries() {
      return <SplineSeries<ChartSampleData, String>>[
        SplineSeries<ChartSampleData, String>(
          dataSource: controller.splineChartData,
          xValueMapper: (ChartSampleData sales, int index) => sales.x,
          yValueMapper: (ChartSampleData sales, int index) => sales.y,
          markerSettings: const MarkerSettings(isVisible: true),
          name: 'High',
        ),
        SplineSeries<ChartSampleData, String>(
          dataSource: controller.splineChartData,
          xValueMapper: (ChartSampleData sales, int index) => sales.x,
          yValueMapper: (ChartSampleData sales, int index) => sales.secondSeriesYValue,
          markerSettings: const MarkerSettings(isVisible: true),
          name: 'Low',
        ),
      ];
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Spline Chart', fontWeight: 600),
          MySpacing.height(16),
          SfCartesianChart(
            plotAreaBorderWidth: 0,
            primaryXAxis: const CategoryAxis(majorGridLines: MajorGridLines(width: 0), labelPlacement: LabelPlacement.onTicks),
            primaryYAxis: const NumericAxis(minimum: 30, maximum: 80, axisLine: AxisLine(width: 0), edgeLabelPlacement: EdgeLabelPlacement.shift, labelFormat: '{value}°F', majorTickLines: MajorTickLines(size: 0)),
            series: buildSplineSeries(),
            legend: const Legend(isVisible: true, position: LegendPosition.bottom),
            tooltipBehavior: controller.tooltipBehavior,
          ),
        ],
      ),
    );
  }

  Widget areaChart() {
    List<AreaSeries<ChartSampleData, DateTime>> buildAreaSeries() {
      return <AreaSeries<ChartSampleData, DateTime>>[
        AreaSeries<ChartSampleData, DateTime>(dataSource: controller.areaChartData, xValueMapper: (ChartSampleData sales, int index) => sales.x, yValueMapper: (ChartSampleData sales, int index) => sales.y, opacity: 0.7, name: 'Product A'),
        AreaSeries<ChartSampleData, DateTime>(
          dataSource: controller.areaChartData,
          xValueMapper: (ChartSampleData sales, int index) => sales.x,
          yValueMapper: (ChartSampleData sales, int index) => sales.secondSeriesYValue,
          opacity: 0.7,
          name: 'Product B',
        ),
      ];
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Area Chart', fontWeight: 600),
          MySpacing.height(16),
          SfCartesianChart(
            plotAreaBorderWidth: 0,
            primaryXAxis: DateTimeAxis(dateFormat: DateFormat.y(), interval: 1, intervalType: DateTimeIntervalType.years, majorGridLines: const MajorGridLines(width: 0), edgeLabelPlacement: EdgeLabelPlacement.shift),
            primaryYAxis: const NumericAxis(labelFormat: '{value}M', interval: 1, axisLine: AxisLine(width: 0), majorTickLines: MajorTickLines(size: 0)),
            series: buildAreaSeries(),
            legend: const Legend(isVisible: true, opacity: 0.7, position: LegendPosition.bottom),
            tooltipBehavior: controller.tooltipBehavior,
          ),
        ],
      ),
    );
  }

  Widget bubbleChart() {
    List<BubbleSeries<ChartSampleData, num>> buildBubbleSeries() {
      return <BubbleSeries<ChartSampleData, num>>[
        BubbleSeries<ChartSampleData, num>(
          dataSource: controller.bubbleChartData,
          xValueMapper: (ChartSampleData sales, int index) => sales.xValue,
          yValueMapper: (ChartSampleData sales, int index) => sales.y,
          sizeValueMapper: (ChartSampleData sales, int index) => sales.size,
          opacity: 0.7,
        ),
      ];
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Bubble Chart', fontWeight: 600),
          MySpacing.height(16),
          SfCartesianChart(
            plotAreaBorderWidth: 0,
            primaryXAxis: const NumericAxis(majorGridLines: MajorGridLines(width: 0), minimum: 60, maximum: 100),
            primaryYAxis: const NumericAxis(axisLine: AxisLine(width: 0), majorTickLines: MajorTickLines(size: 0)),
            series: buildBubbleSeries(),
            tooltipBehavior: controller.tooltipBehavior,
          ),
        ],
      ),
    );
  }

  Widget pieChart() {
    List<PieSeries<ChartSampleData, String>> buildDefaultPieSeries() {
      return <PieSeries<ChartSampleData, String>>[
        PieSeries<ChartSampleData, String>(
          dataSource: controller.pieChartData,
          xValueMapper: (ChartSampleData data, int index) => data.x,
          yValueMapper: (ChartSampleData data, int index) => data.y,
          dataLabelMapper: (ChartSampleData data, int index) => data.text,
          explode: true,
          explodeIndex: 0,
          startAngle: 90,
          endAngle: 90,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        ),
      ];
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Pie Chart', fontWeight: 600),
          MySpacing.height(16),
          SfCircularChart(
            legend: const Legend(isVisible: true, position: LegendPosition.bottom),
            series: buildDefaultPieSeries(),
          ),
        ],
      ),
    );
  }

  Widget chartWithLegend() {
    List<DoughnutSeries<ChartSampleData, String>> buildDoughnutSeries() {
      return <DoughnutSeries<ChartSampleData, String>>[
        DoughnutSeries<ChartSampleData, String>(
          dataSource: controller.chartWithLegendData,
          xValueMapper: (ChartSampleData data, int index) => data.x,
          yValueMapper: (ChartSampleData data, int index) => data.y,
          startAngle: 90,
          endAngle: 90,
          dataLabelSettings: const DataLabelSettings(isVisible: true, labelPosition: ChartDataLabelPosition.outside),
        ),
      ];
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Chart with legend', fontWeight: 600),
          MySpacing.height(16),
          SfCircularChart(
            legend: const Legend(position: LegendPosition.bottom, isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
            series: buildDoughnutSeries(),
            tooltipBehavior: TooltipBehavior(enable: true),
          ),
        ],
      ),
    );
  }

  Widget defaultScatterChart() {
    List<ScatterSeries<ChartSampleData, DateTime>> buildScatterSeries() {
      return <ScatterSeries<ChartSampleData, DateTime>>[
        ScatterSeries<ChartSampleData, DateTime>(
          dataSource: controller.scatterChartData,
          xValueMapper: (ChartSampleData sales, int index) => sales.x,
          yValueMapper: (ChartSampleData sales, int index) => sales.y,
          opacity: 0.7,
          name: 'Brazil',
          markerSettings: controller.markerSettings,
        ),
        ScatterSeries<ChartSampleData, DateTime>(
          dataSource: controller.scatterChartData,
          xValueMapper: (ChartSampleData sales, int index) => sales.x,
          yValueMapper: (ChartSampleData sales, int index) => sales.yValue,
          opacity: 0.7,
          name: 'Canada',
          markerSettings: controller.markerSettings,
        ),
        ScatterSeries<ChartSampleData, DateTime>(
          dataSource: controller.scatterChartData,
          xValueMapper: (ChartSampleData sales, int index) => sales.x,
          yValueMapper: (ChartSampleData sales, int index) => sales.secondSeriesYValue,
          color: const Color.fromRGBO(0, 168, 181, 1),
          name: 'India',
          markerSettings: controller.markerSettings,
        ),
      ];
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Default Scatter Chart', fontWeight: 600),
          MySpacing.height(16),
          SfCartesianChart(
            plotAreaBorderWidth: 0,
            primaryXAxis: const DateTimeAxis(labelIntersectAction: AxisLabelIntersectAction.multipleRows, majorGridLines: MajorGridLines(width: 0)),
            primaryYAxis: const NumericAxis(labelFormat: '{value}%', axisLine: AxisLine(width: 0), minorTickLines: MinorTickLines(size: 0)),
            legend: const Legend(isVisible: true, position: LegendPosition.bottom),
            tooltipBehavior: controller.tooltipBehavior,
            series: buildScatterSeries(),
          ),
        ],
      ),
    );
  }

  Widget stepLine() {
    List<StepLineSeries<ChartSampleData, num>> buildStepLineSeries() {
      return <StepLineSeries<ChartSampleData, num>>[
        StepLineSeries<ChartSampleData, num>(dataSource: controller.stepLineData, xValueMapper: (ChartSampleData sales, int index) => sales.x, yValueMapper: (ChartSampleData sales, int index) => sales.y, name: 'Renewable'),
        StepLineSeries<ChartSampleData, num>(dataSource: controller.stepLineData, xValueMapper: (ChartSampleData sales, int index) => sales.x, yValueMapper: (ChartSampleData sales, int index) => sales.secondSeriesYValue, name: 'Non-Renewable'),
      ];
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Step Line', fontWeight: 600),
          MySpacing.height(16),
          SfCartesianChart(
            plotAreaBorderWidth: 0,
            primaryXAxis: const NumericAxis(majorGridLines: MajorGridLines(width: 0), interval: 1),
            primaryYAxis: const NumericAxis(axisLine: AxisLine(width: 0), majorTickLines: MajorTickLines(size: 0), labelFormat: '{value}B'),
            series: buildStepLineSeries(),
            legend: const Legend(isVisible: true, position: LegendPosition.bottom),
            tooltipBehavior: controller.tooltipBehavior,
          ),
        ],
      ),
    );
  }
}
