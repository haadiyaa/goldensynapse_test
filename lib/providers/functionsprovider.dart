import 'package:flutter/material.dart';
import 'package:goldensynapse_task/core/constants.dart';
import 'package:goldensynapse_task/data/models/habitmodel.dart';

class FunctionsProvider extends ChangeNotifier {
  void updateCheck(HabitModel habit, bool? newValue) {
    habit.isCompleted = newValue ?? false;
    notifyListeners();
  }

  int completedHabits() {
    return Constants.habitList.where((habit) => habit.isCompleted).length;
  }
}
