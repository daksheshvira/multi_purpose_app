import 'package:multi_purpose_app/data/models/user.dart';

class AppEnv {
  static final AppEnv instance = AppEnv._internal();

  factory AppEnv() {
    return instance;
  }

  AppEnv._internal();

  User? user;
}
