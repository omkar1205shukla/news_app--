import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:news_assessment/core/di/di.config.dart';

import '../dio_factory.dart';

var getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() async {
  getIt.registerFactory<DioFactory>(() => DioFactory('https://newsapi.org/v2'));
  getIt.init();
}
