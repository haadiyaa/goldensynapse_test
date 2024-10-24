class HabitModel {
  String name;
  bool isCompleted;
  int streak;
  DateTime? lastCompleted;

  HabitModel({
    required this.name,
    this.isCompleted = false,
    this.streak = 0,
    this.lastCompleted,
  });
}
