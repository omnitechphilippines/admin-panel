import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

import '../../../../helper/utils/my_shadow.dart';
import '../../../../helper/widgets/my_card.dart';
import '../../../../helper/widgets/my_flex.dart';
import '../../../../helper/widgets/my_flex_item.dart';
import '../../../../helper/widgets/my_spacing.dart';
import '../../../../helper/widgets/my_text.dart';
import '../../../../helper/widgets/responsive.dart';
import '../../../../themes/app_theme.dart';
import '../../../../themes/ui_mixin.dart';
import '../../../../views/layout/layout.dart';
import '../controllers/maps_controller.dart';

class MapsView extends GetView<MapsController> {
  const MapsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder<MapsController>(
        init: controller,
        builder: (MapsController controller) {
          return Padding(
            padding: MySpacing.x(flexSpacing / 2),
            child: Center(
              child: MyFlex(
                children: <MyFlexItem>[
                  MyFlexItem(sizes: 'lg-8', child: dataLabel()),
                  MyFlexItem(sizes: 'lg-8', child: europeanTimeZone()),
                  MyFlexItem(sizes: 'lg-8', child: worldPopulationDensity()),
                  MyFlexItem(sizes: 'lg-8', child: worldClock()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget dataLabel() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      paddingAll: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Data Labels', fontWeight: 600),
          MySpacing.height(flexSpacing),
          SfMaps(
            layers: <MapLayer>[
              MapShapeLayer(
                source: controller.dataSource,
                showDataLabels: true,
                dataLabelSettings: const MapDataLabelSettings(overflowMode: MapLabelOverflow.ellipsis),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget europeanTimeZone() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      paddingAll: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('European Time Zones', fontWeight: 600),
          MySpacing.height(flexSpacing),
          SfMaps(
            layers: <MapLayer>[
              MapShapeLayer(
                loadingBuilder: (BuildContext context) {
                  return const SizedBox(height: 25, width: 25, child: CircularProgressIndicator(strokeWidth: 3));
                },
                source: controller.mapSource,
                shapeTooltipBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyText.bodyMedium('${controller.timeZones[index].countryName} : ${controller.timeZones[index].gmtTime}', color: UiMixin.contentTheme.light),
                  );
                },
                legend: const MapLegend.bar(MapElement.shape, position: MapLegendPosition.bottom, padding: EdgeInsets.only(top: 15), segmentSize: Size(60.0, 10.0)),
                tooltipSettings: const MapTooltipSettings(color: Color.fromRGBO(45, 45, 45, 1)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget worldPopulationDensity() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      paddingAll: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('World Population Density (per sq. km.)', fontWeight: 600),
          MySpacing.height(flexSpacing),
          SfMaps(
            layers: <MapLayer>[
              MapShapeLayer(
                loadingBuilder: (BuildContext context) {
                  return const SizedBox(height: 25, width: 25, child: CircularProgressIndicator(strokeWidth: 3));
                },
                source: controller.mapSource1,
                shapeTooltipBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyText.bodySmall('${controller.worldPopulationDensity[index].countryName} : ${controller.numberFormat.format(controller.worldPopulationDensity[index].density)} per sq. km.'),
                  );
                },
                strokeColor: Colors.white30,
                legend: const MapLegend.bar(
                  MapElement.shape,
                  position: MapLegendPosition.bottom,
                  overflowMode: MapLegendOverflowMode.wrap,
                  labelsPlacement: MapLegendLabelsPlacement.betweenItems,
                  padding: EdgeInsets.only(top: 15),
                  spacing: 1.0,
                  segmentSize: Size(55.0, 9.0),
                ),
                tooltipSettings: MapTooltipSettings(
                  color: theme.colorScheme.brightness == Brightness.light ? const Color.fromRGBO(0, 32, 128, 1) : const Color.fromRGBO(226, 233, 255, 1),
                  strokeColor: theme.colorScheme.brightness == Brightness.light ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget worldClock() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      paddingAll: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('World Clock', fontWeight: 600),
          MySpacing.height(flexSpacing),
          SizedBox(
            height: 500,
            child: SfMaps(
              layers: <MapLayer>[
                MapShapeLayer(
                  loadingBuilder: (BuildContext context) {
                    return const SizedBox(height: 25, width: 25, child: CircularProgressIndicator(strokeWidth: 3));
                  },
                  source: controller.mapSource2,
                  initialMarkersCount: 7,
                  markerBuilder: (_, int index) {
                    return MapMarker(
                      longitude: controller.worldClockData[index].longitude,
                      latitude: controller.worldClockData[index].latitude,
                      alignment: Alignment.topCenter,
                      offset: const Offset(0, -4),
                      size: const Size(150, 150),
                      child: ClockWidget(countryName: controller.worldClockData[index].countryName, date: controller.worldClockData[index].date),
                    );
                  },
                  strokeWidth: 0,
                  color: theme.colorScheme.brightness == Brightness.light ? const Color.fromRGBO(71, 70, 75, 0.2) : const Color.fromRGBO(71, 70, 75, 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ClockWidget extends StatefulWidget {
  const ClockWidget({super.key, required this.countryName, required this.date});

  final String countryName;
  final DateTime date;

  @override
  _ClockWidgetState createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  late String _currentTime;
  late DateTime _date;
  Timer? _timer;

  @override
  void initState() {
    _date = widget.date;
    _currentTime = _getFormattedDateTime(widget.date);
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => _updateTime(_date));
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
          ),
        ),
        MyText.bodyMedium(widget.countryName, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)),
        Center(
          child: MyText.bodyMedium(_currentTime, style: Theme.of(context).textTheme.labelSmall!.copyWith(letterSpacing: 0.5, fontWeight: FontWeight.w500)),
        ),
      ],
    );
  }

  void _updateTime(DateTime currentDate) {
    _date = currentDate.add(const Duration(seconds: 1));
    setState(() {
      _currentTime = DateFormat('hh:mm:ss a').format(_date);
    });
  }

  String _getFormattedDateTime(DateTime dateTime) {
    return DateFormat('hh:mm:ss a').format(dateTime);
  }
}
