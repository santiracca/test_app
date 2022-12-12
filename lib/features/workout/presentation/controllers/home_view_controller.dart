import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:test_app/core/dependency_injection/locator.dart';
import 'package:test_app/features/workout/domain/models/workout.dart';
import 'package:test_app/features/workout/domain/repositories/workout_repository.dart';
import 'package:test_app/features/workout/domain/usecases/create_workout.dart';

class HomeViewController extends ChangeNotifier {
  final WorkoutRepository _workoutRepository;
  final CreateWorkout _createWorkout;
  final SnackbarService _snackbarService;
  final NavigationService _navigationService;

  HomeViewController({
    WorkoutRepository? workoutRepository,
    CreateWorkout? createWorkout,
    SnackbarService? snackbarService,
    NavigationService? navigationService,
  })  : _workoutRepository = workoutRepository ?? locator<WorkoutRepository>(),
        _createWorkout = createWorkout ?? CreateWorkout(),
        _snackbarService = snackbarService ?? locator<SnackbarService>(),
        _navigationService = navigationService ?? locator<NavigationService>();

  bool isLoading = false;
  late Workout wod;

  Future<void> onStartup() async {
    try {
      setBusy(true);
      wod = await _workoutRepository.getWOD(workoutDate: DateTime.now());
      setBusy(false);
    } catch (e) {
      _snackbarService.showSnackbar(message: "Error ocurred");
    }
  }

  void setBusy(bool val) {
    isLoading = val;
    notifyListeners();
  }
}

final homeViewController =
    ChangeNotifierProvider<HomeViewController>((ref) => HomeViewController());
