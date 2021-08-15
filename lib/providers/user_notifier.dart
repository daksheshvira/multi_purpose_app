import 'package:flutter/foundation.dart';
import 'package:multi_purpose_app/data/common_repo.dart';
import 'package:multi_purpose_app/utils/app_env.dart';

class UserNotifier extends ChangeNotifier {
  final repo = CommonRepo();

  Future<String> validateUser(String email) async {
    try {
      AppEnv.instance.user = await repo.validateUser(email);
      return '';
    } catch (e) {
      return e.toString();
    }
  }
}
