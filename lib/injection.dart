import 'package:engu/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@injectableInit
void configureDependencies(String baseUrl) {
  getIt.registerSingleton<String>(baseUrl, instanceName: 'baseUrl');
  $initGetIt(getIt);
}
