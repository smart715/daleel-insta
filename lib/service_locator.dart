import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:insta_daleel/service_locator.config.dart';

final serviceLocator = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies() async {
  $initGetIt(serviceLocator);
}
