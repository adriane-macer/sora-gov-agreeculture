import 'package:get_it/get_it.dart';
import 'package:sora_gov_agree/helpers/db_helper.dart';
import 'package:sora_gov_agree/services/category_service.dart';
import 'package:sora_gov_agree/services/dio_service.dart';
import 'package:sora_gov_agree/services/plants_service.dart';

GetIt locator = new GetIt();

void setupLocator() {
  locator.allowReassignment = true;
  locator.registerLazySingleton(() => PlantsService());
  locator.registerLazySingleton(() => DioService());
  locator.registerLazySingleton(()=> CategoryService());
}
