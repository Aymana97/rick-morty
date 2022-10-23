import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'inject.config.dart';
  
@InjectableInit()
void _configureDependencies(GetIt getIt) => $initGetIt(getIt); 

injectDependencies() {
  GetIt.I.registerSingleton<Dio>(Dio());
  _configureDependencies(GetIt.instance);
}