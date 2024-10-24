import 'package:flutter/material.dart';
import 'package:goldensynapse_task/core/constants.dart';
import 'package:goldensynapse_task/presentation/dailyprogressscreen/widgets/mychart.dart';
import 'package:goldensynapse_task/providers/functionsprovider.dart';
import 'package:provider/provider.dart';

class DailyProgressScreen extends StatelessWidget {
  const DailyProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Progress'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Consumer<FunctionsProvider>(
              builder: (context, value, child) => SizedBox(
                height: size.height * 0.4,
                child: CustomRoundedBars.withSampleData(
                  done: value.countHabitsDone(Constants.habitList),
                  notDone: Constants.habitList.length -
                      value.countHabitsDone(Constants.habitList),
                  animate: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
