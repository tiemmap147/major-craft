import 'package:major_craft_application/core/constants/environment_config.dart';

abstract class ApiEndpoints {
  static const String baseUrl = EnvironmentConfig.appServerUrl;
  static const String posts = '/posts';
}
