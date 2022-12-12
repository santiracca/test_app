import 'package:test_app/features/workout/domain/models/exercise.dart';

class Workout {
  final int id;
  final DateTime startedAt;
  final DateTime endedAt;
  final List<Exercise> exercises;

  Workout({
    required this.id,
    required this.startedAt,
    required this.endedAt,
    required this.exercises,
  });
}
