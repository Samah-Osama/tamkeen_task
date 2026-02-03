import 'package:tamkeen_task/core/base/api_result.dart';

abstract class LoginRepo {
  Future<ApiResult<dynamic>> loginWithEmailOrPhoneNumber({required String email , required String password});
}