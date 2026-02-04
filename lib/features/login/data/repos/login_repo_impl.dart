import 'package:injectable/injectable.dart';
import 'package:tamkeen_task/core/base/api_result.dart';
import 'package:tamkeen_task/features/login/data/data_source/login_remote_data_source.dart';
import 'package:tamkeen_task/features/login/data/repos/login_repo.dart';

@Injectable(as: LoginRepo)
class LoginRepoImpl implements LoginRepo {
  final LoginRemoteDataSource _loginRemoteDataSource;

  LoginRepoImpl(this._loginRemoteDataSource);
  @override
  Future<ApiResult<dynamic>> loginWithEmailOrPhoneNumber({required String email, required String password}) {
   return _loginRemoteDataSource.loginWithEmailOrPhoneNumber(email: email, password: password);
  }
  
  @override
  Future<ApiResult<dynamic>> loginWithOtp({required String phoneNumber}) {
    return _loginRemoteDataSource.loginWithOtp(phoneNumber: phoneNumber);
  }
  
  @override
  Future<ApiResult<dynamic>> verifyOtp({required String phoneNumber, required String otp}) {
    return _loginRemoteDataSource.verifyOtp(phoneNumber: phoneNumber, otp: otp);
  }
  
  @override
  Future<ApiResult<dynamic>> resendOtp({required String phoneNumber}) {
    return _loginRemoteDataSource.resendOtp(phoneNumber: phoneNumber);
  }
  
}