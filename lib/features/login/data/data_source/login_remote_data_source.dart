import 'package:tamkeen_task/core/base/api_result.dart';

abstract class LoginRemoteDataSource {
  Future<ApiResult<dynamic>> loginWithEmail({required String email , required String password});
}