class Workout {
  dynamic id;
  String workoutname;
  String level;
  String description;
  String workoutType;
  int duration;

  Workout(
      {this.id,
      required this.workoutname,
      required this.level,
      required this.description,
      required this.workoutType,
      required this.duration});

  Workout.fromJson(Map<String, dynamic> json)
  : workoutname = json['workoutname'],
  level = json['level'],
  description = json['description'],
  workoutType = json['workoutType'],
  duration = json['duration'];

  Map<String, dynamic> toJson() => {
    'workoutname' : workoutname,
    'level' : level,
    'description' : description,
    'workoutType' : workoutType,
    'duration' : duration,
  };
}