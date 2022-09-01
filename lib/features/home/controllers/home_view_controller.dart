import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:test_app/core/dependecy_injection/locator.dart';
import 'package:test_app/core/router/router.dart' as router;
import 'package:test_app/core/services/http_service.dart';

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

  String userName = 'Santi';
  bool isLoading = true;

  Future<void> getUser() async {
    try {
      final response =
          await _httpService.client.get("$API_BASE_URL/character/2");

      userName = response.data['name'];
      isLoading = false;
      notifyListeners();
    } catch (e) {
      _snackbarService.showSnackbar(message: 'Que cagadaaaa');
    }
  }

  void changeUserName() {
    userName = userName == 'Santi' ? 'El pueblo' : 'Santi';
    notifyListeners();
  }

  void navigateToProfilePage() {
    _navigationService.navigateTo(router.Router.profilePage);
  }
}

final homeViewProvider = ChangeNotifierProvider((ref) => HomeViewController());
