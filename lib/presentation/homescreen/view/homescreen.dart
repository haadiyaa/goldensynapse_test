import 'package:flutter/material.dart';
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
        title: Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => DailyProgressScreen()));
            },
            icon: Icon(Icons.list),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Consumer<FunctionsProvider>(
                builder: (context, functionsProvider, child) =>
                    ListView.separated(
                  itemCount: Constants.habitList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Constants.height15;
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return HabitTile(
                      onChanged: (value) {
                        print(value);
                        functionsProvider.updateCheck(
                          Constants.habitList[index],
                          value,
                        );
                      },
                      habit: Constants.habitList[index],
                      index: index,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
