import 'package:flutter/material.dart';

import 'package:goldensynapse_task/core/appcolors.dart';
import 'package:goldensynapse_task/data/models/habitmodel.dart';

class HabitTile extends StatelessWidget {
  const HabitTile({
    super.key,
    required this.index,
    required this.habit,
    required this.onChanged,
  });
  final int index;
  final HabitModel habit;
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      tileColor: AppColors.tileColors[index],
      titleTextStyle: const TextStyle(
        fontSize: 16,
        color: AppColors.black,
      ),
      trailing:
          Text('${String.fromCharCodes(Runes('\u{1F525}'))} ${habit.streak}'),
      leading: Checkbox(
        activeColor: AppColors.activeColors[index],
        value: habit.isCompleted,
        onChanged: onChanged,
      ),
      title: Text(
        habit.name,
      ),
    );
  }
}
