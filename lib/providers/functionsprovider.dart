import 'package:flutter/material.dart';
import 'package:goldensynapse_task/data/models/habitmodel.dart';

class FunctionsProvider extends ChangeNotifier {
  List<HabitModel> habitList = [
    HabitModel(name: "Drink Water"),
    HabitModel(name: "Exercise"),
    HabitModel(name: "Read"),
    HabitModel(name: "Meditate"),
    HabitModel(name: "Sleep"),
  ];
  void updateCheck(HabitModel habit, bool? newValue) {
    habit.isCompleted = newValue ?? false;
    notifyListeners();
    if (habit.isCompleted) {
      DateTime today = DateTime.now();
      if (habit.lastCompleted != null &&
          today.difference(habit.lastCompleted!).inDays == 1) {
        habit.streak += 1;
        notifyListeners();
      } else {
        habit.streak = 1;
        notifyListeners();
      }
      habit.lastCompleted = today;
      notifyListeners();
    } else {
      habit.streak = 0;
      notifyListeners();
    }
  }

  void resetStreak() {
    for (var habit in habitList) {
      habit.isCompleted = false;
      habit.streak = 0;
      habit.lastCompleted = null;
    }
    notifyListeners();
  }

  int countHabitsDone() {
    return habitList.where((habit) => habit.isCompleted).length;
  }
}
