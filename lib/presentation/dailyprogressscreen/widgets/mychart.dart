import 'package:charts_flutter_maintained/charts_flutter_maintained.dart'
    as charts;
import 'package:flutter/material.dart';
class CustomRoundedBars extends StatelessWidget {
  final List<charts.Series<HabitsDone, String>> seriesList;
  final bool animate;

  const CustomRoundedBars(this.seriesList, {super.key, required this.animate});

  factory CustomRoundedBars.withSampleData(
      {required int done, required int notDone, required bool animate}) {
    return CustomRoundedBars(
      _createSampleData(done, notDone),
      animate: animate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
      defaultRenderer: charts.BarRendererConfig(
          cornerStrategy: const charts.ConstCornerStrategy(30)),
    );
  }

  static List<charts.Series<HabitsDone, String>> _createSampleData(
      int done, int notDone) {
    final data = [
      HabitsDone('Done', done),
      HabitsDone('Not Done', notDone),
    ];

    return [
      charts.Series<HabitsDone, String>(
        id: 'Habits',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (HabitsDone value, _) => value.habit,
        measureFn: (HabitsDone value, _) => value.value,
        data: data,
      )
    ];
  }
}

class HabitsDone {
  final String habit;
  final int value;

  HabitsDone(this.habit, this.value);
}