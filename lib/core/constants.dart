import 'package:flutter/material.dart';
import 'package:goldensynapse_task/data/models/habitmodel.dart';

class Constants {
  //==============IMAGES================================
  static const String bgImage = 'assets/image/bg.png';

  //==================STRINGS===========================
  static List<HabitModel> habitList = [
    HabitModel(name: "Drink Water"),
    HabitModel(name: "Exercise"),
    HabitModel(name: "Read"),
    HabitModel(name: "Meditate"),
    HabitModel(name: "Sleep"),
  ];

  //=========================Sizes=====================
  static const SizedBox height5 = SizedBox(height: 5);
  static const SizedBox height10 = SizedBox(height: 10);
  static const SizedBox height15 = SizedBox(height: 15);
  static const SizedBox height20 = SizedBox(height: 20);
  static const SizedBox height40 = SizedBox(height: 40);

  static const SizedBox width5 = SizedBox(width: 5);
  static const SizedBox width10 = SizedBox(width: 10);
  static const SizedBox width15 = SizedBox(width: 15);
  static const SizedBox width20 = SizedBox(width: 20);
}
