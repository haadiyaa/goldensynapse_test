import 'package:goldensynapse_task/data/models/habitmodel.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  static final HiveHelper _helper = HiveHelper._internal();

  factory HiveHelper() {
    return _helper;
  }

  HiveHelper._internal();

  Future<void> initHive() async {
    await Hive.initFlutter();

    Hive.registerAdapter(HabitModelAdapter());

    await Hive.openBox<HabitModel>('habits');
  }

  Future<void> closeHive() async {
    await Hive.close();
  }

  
}
