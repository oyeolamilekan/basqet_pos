import 'package:get_it/get_it.dart';

import 'services/print_service.dart';

final locator = GetIt.instance;

Future<void> setUpLocator() async {
  locator.registerLazySingleton<PrinterService>(
    () => PrinterService(),
  );
}
