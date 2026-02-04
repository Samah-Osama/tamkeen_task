import 'package:tamkeen_task/core/base/api_result.dart';

abstract class LoginRepo {
  Future<ApiResult<dynamic>> loginWithEmailOrPhoneNumber({required String email , required String password});
  Future<ApiResult<dynamic>> loginWithOtp({required String phoneNumber});
  Future<ApiResult<dynamic>> verifyOtp({required String phoneNumber , required String otp});
  Future<ApiResult<dynamic>> resendOtp({required String phoneNumber});

}