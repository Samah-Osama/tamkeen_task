import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:tamkeen_task/core/api_manager/api_service.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;  
  
@InjectableInit(  
  initializerName: 'init', 
  preferRelativeImports: true, 
  asExtension: true, 
)  
 void configureDependencies() => getIt.init();
 @module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio();

  @lazySingleton
  ApiService getApiService(Dio dio) => ApiService(dio);
}