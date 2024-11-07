import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:major_craft_application/dependency_injection.config.dart';

@InjectableInit(
  asExtension: false,
)
abstract class DependencyInjection {
  static final instance = GetIt.instance..allowReassignment = true;

  static Future<void> registerDependecies() async => init(instance);
}
