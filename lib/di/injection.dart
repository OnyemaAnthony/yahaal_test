import 'package:get_it/get_it.dart';


final getIt = GetIt.instance;
class Di{
  static Future<void> initialize()async{
    //getIt.registerFactory(() => CategoryBloc());


    //
    // getIt.registerLazySingleton<CategoryService>(() => CategoryServiceImpl());
    // getIt.registerLazySingleton<CategoryRepository>(() => CategoryRepositoryImpl(getIt()));

    //getIt.registerLazySingleton(() => AddTaskCase(getIt()));

  }
}
