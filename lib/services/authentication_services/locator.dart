import 'package:makhi/services/authentication_services/auth_services.dart';
import 'package:get_it/get_it.dart';


final locator = GetIt.instance;


void setUpServices() {
  locator.registerSingleton<AuthServices>(AuthServices());

}