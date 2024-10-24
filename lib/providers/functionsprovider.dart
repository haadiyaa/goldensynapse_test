import 'package:flutter/material.dart';
import 'package:goldensynapse_task/core/constants.dart';
import 'package:goldensynapse_task/data/models/habitmodel.dart';

class FunctionsProvider extends ChangeNotifier {
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

  int countHabitsDone(List<HabitModel> habits) {
    return habits.where((habit) => habit.isCompleted).length;
  }
}
