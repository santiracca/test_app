import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_app/core/dependency_injection/locator.dart';
import 'package:test_app/features/user/domain/models/user.dart';
import 'package:test_app/features/user/domain/repositories/user_repository.dart';
import 'package:test_app/features/user/domain/usecases/get_user.dart';

class HomeViewController extends ChangeNotifier {
  final GetUser _getUser;
  HomeViewController({
    GetUser? getUser,
  }) : _getUser = getUser ?? GetUser();

  bool isLoading = false;
  User? currentUser;

  Future<void> getUser() async {
    isLoading = true;
    notifyListeners();
    try {
      currentUser = await _getUser();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

final homeViewProvider = ChangeNotifierProvider((ref) => HomeViewController());
