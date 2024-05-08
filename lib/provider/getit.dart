import 'package:fitness_app/service/navigation_service.dart';
import 'package:fitness_app/src/view/auth_screen_view_model.dart';
import 'package:fitness_app/src/view/details_screen_view_model.dart';
import 'package:fitness_app/src/view/home_screen_view_model.dart';
import 'package:fitness_app/src/view/user_profile_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void setupLocator() {
  getIt.registerLazySingleton(() => NavigationService());
  getIt.registerFactory(() => DetailsScreenViewModel());
  getIt.registerFactory(() => HomeScreenViewModel());
  getIt.registerFactory(() => UserProfileViewModel());
  getIt.registerFactory(() => AuthScreenViewModel());
}
