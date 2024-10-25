
import 'package:hive/hive.dart';
part 'habitmodel.g.dart';

@HiveType(typeId: 0)
class HabitModel {

  @HiveField(0)
  String name;

  @HiveField(1)
  bool isCompleted;

  @HiveField(2)
  int streak;

  @HiveField(3)
  DateTime? lastCompleted;

  HabitModel({
    required this.name,
    this.isCompleted = false,
    this.streak = 0,
    this.lastCompleted,
  });
}
