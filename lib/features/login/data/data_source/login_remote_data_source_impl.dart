import 'package:injectable/injectable.dart';
import 'package:tamkeen_task/features/login/data/data_source/login_remote_data_source.dart';

import '../../../../core/api_manager/api_service.dart';
import '../../../../core/base/api_result.dart';


@Injectable(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final ApiService _apiService;

  LoginRemoteDataSourceImpl(this._apiService);
  @override
  Future<ApiResult> loginWithEmailOrPhoneNumber({required String email, required String password})async {
  try {
  final data = await  _apiService.loginWithEmailOrPhoneNumber({'phone_number': email, 'password': password});

  return ApiSuccess(data: data);
} catch (e) {
  return ApiError(message: e.toString());
}
  }
}