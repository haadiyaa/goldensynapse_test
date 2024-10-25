import 'package:flutter/material.dart';
import 'package:goldensynapse_task/data/models/habitmodel.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FunctionsProvider extends ChangeNotifier {
  List<HabitModel> habitList = [
    HabitModel(name: "Drink Water"),
    HabitModel(name: "Exercise"),
    HabitModel(name: "Read"),
    HabitModel(name: "Meditate"),
    HabitModel(name: "Sleep"),
  ];

  Box<HabitModel> habitBox = Hive.box<HabitModel>('habits');

  FunctionsProvider() {
    loadHabits();
    checkDate();
  }

  void checkDate() {
    final today = DateTime.now();
    for (var habit in habitBox.values) {
      if (habit.lastCompleted == null ||
          today.difference(habit.lastCompleted!).inDays >= 1) {
        habit.isCompleted = false;
        if (habit.lastCompleted == null ||
            today.difference(habit.lastCompleted!).inDays == 1) {
        } else {
          habit.streak = 0;
        }
        updateHabit(habit);
      }
    }
    notifyListeners();
  }

  void loadHabits() {
    if (habitBox.isNotEmpty) {
      habitList = habitBox.values.toList();
      
    } else {
      for (var habit in habitList) {
        habitBox.add(habit);
      }
    }
    notifyListeners();
  }

  void updateHabit(HabitModel habit) {
    final habitIndex = habitList.indexOf(habit);
    if (habitIndex != -1) {
      habitBox.put(habitIndex, habit);
    }
  }

  void updateCheck(HabitModel habit, bool? newValue) {
    habit.isCompleted = newValue ?? false;
    if (habit.isCompleted) {
      DateTime today = DateTime.now();
      if (habit.lastCompleted != null &&
          today.difference(habit.lastCompleted!).inDays == 1) { 
        habit.streak += 1;
      } else {
        habit.streak = 1;
      }
      habit.lastCompleted = today;
    } else {
      habit.streak -= 1;
    }
    updateHabit(habit);
    notifyListeners();
  }

  void resetStreak() {
    for (var habit in habitList) {
      habit.isCompleted = false;
      habit.streak = 0;
      habit.lastCompleted = null;
      updateHabit(habit);
    }

    notifyListeners();
  }

  int countHabitsDone() {
    return habitList.where((habit) => habit.isCompleted).length;
  }
}
