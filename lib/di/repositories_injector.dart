import 'package:airsoft/main.dart';
import 'package:airsoft/repositories/apply_repository.dart';

class RepositoriesInjector {
  static void initLocator() {
    getIt.registerLazySingleton(() => ApplyRepository());
  }
}