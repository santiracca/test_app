import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:test_app/core/services/http_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<SnackbarService>(() => SnackbarService());
  locator.registerLazySingleton<DialogService>(() => DialogService());
  locator.registerLazySingleton<HttpService>(() => HttpService());
}
