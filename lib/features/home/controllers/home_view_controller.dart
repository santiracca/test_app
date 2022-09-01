import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:test_app/core/dependecy_injection/locator.dart';
import 'package:test_app/core/router/router.dart' as router;
import 'package:test_app/core/services/http_service.dart';
import 'package:test_app/features/home/models/user.dart';

const API_BASE_URL = 'https://rickandmortyapi.com/api';

class HomeViewController extends ChangeNotifier {
  final NavigationService _navigationService;
  final HttpService _httpService;
  final SnackbarService _snackbarService;

  HomeViewController(
      {NavigationService? navigationService,
      HttpService? httpService,
      SnackbarService? snackbarService})
      : _navigationService = navigationService ?? locator<NavigationService>(),
        _snackbarService = snackbarService ?? locator<SnackbarService>(),
        _httpService = httpService ?? locator<HttpService>();

  User? user;
  bool isLoading = false;

  void setLoading(bool val) {
    isLoading = val;
    notifyListeners();
  }

  Future<void> getUser() async {
    try {
      setLoading(true);
      final response =
          await _httpService.client.get("$API_BASE_URL/character/2");

      user = User.fromJson(response.data);
      setLoading(false);
    } catch (e) {
      _snackbarService.showSnackbar(message: 'Que cagadaaaa');
    }
  }

  void navigateToProfilePage() {
    _navigationService.navigateTo(router.Router.profilePage);
  }
}

final homeViewProvider = ChangeNotifierProvider((ref) => HomeViewController());
