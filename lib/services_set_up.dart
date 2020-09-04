import 'package:businessland_app/services/user_service.dart';
import 'package:get_it/get_it.dart';
class ServiceSetUp {
  ServiceSetUp() {
    GetIt.I.registerLazySingleton(() => UserService());
  }
}