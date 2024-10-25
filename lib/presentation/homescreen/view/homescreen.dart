import 'package:flutter/material.dart';
import 'package:goldensynapse_task/core/appcolors.dart';
import 'package:goldensynapse_task/core/constants.dart';
import 'package:goldensynapse_task/presentation/dailyprogressscreen/view/dailyprogressscreen.dart';
import 'package:goldensynapse_task/presentation/homescreen/widgets/habittile.dart';
import 'package:goldensynapse_task/providers/functionsprovider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Habits'),
        // actions: [
        //   ElevatedButton(
        //     style: ElevatedButton.styleFrom(
        //       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        //       foregroundColor: AppColors.white,
        //       backgroundColor: AppColors.lightBlue,
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(10),
        //       ),
        //     ),
        //     onPressed: () {
        //       Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //               builder: (_) => const DailyProgressScreen()));
        //     },
        //     child: const Text('Show Progress'),
        //   ),
        //   Constants.width10,
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Consumer<FunctionsProvider>(
                builder: (context, functionsProvider, child) =>
                    ListView.separated(
                  itemCount: functionsProvider.habitList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Constants.height15;
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return HabitTile(
                      onChanged: (value) {
                        functionsProvider.updateCheck(
                          functionsProvider.habitList[index],
                          value,
                        );
                      },
                      habit: functionsProvider.habitList[index],
                      index: index,
                    );
                  },
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      foregroundColor: AppColors.white,
                      backgroundColor: AppColors.lightBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const DailyProgressScreen()));
                    },
                    child: const Text('Show Progress'),
                  ),
                ),
                Constants.width10,
                Expanded(
                  child: Consumer<FunctionsProvider>(
                    builder: (context, functionsProvider, child) =>
                        ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        foregroundColor: AppColors.white,
                        backgroundColor: AppColors.lightBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        functionsProvider.resetStreak();
                      },
                      child: const Text('Reset Streaks'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
