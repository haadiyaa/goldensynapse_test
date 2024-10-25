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
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(5, 5),
              color: Color.fromARGB(255, 192, 192, 192)),
        ],
        borderRadius: BorderRadius.circular(10),
        color: habit.isCompleted
            ? AppColors.tileColors2[index]
            : AppColors.tileColors[index],
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        titleTextStyle: const TextStyle(
          fontSize: 16,
          color: AppColors.black,
        ),
        trailing:
            Text('${String.fromCharCodes(Runes('\u{1F525}'))} ${habit.streak}'),
        leading: Checkbox(
          side: BorderSide(
            color: AppColors.activeColors[index],
            width: 2,
          ),
          activeColor: AppColors.activeColors[index],
          value: habit.isCompleted,
          onChanged: onChanged,
        ),
        title: Text(
          habit.name,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
