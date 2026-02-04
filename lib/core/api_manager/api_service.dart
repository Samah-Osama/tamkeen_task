import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:tamkeen_task/core/api_manager/api_endpoints.dart';

part 'api_service.g.dart';

@RestApi(baseUrl:ApiEndpoints.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
@POST(ApiEndpoints.loginWithEmailOrPhoneNumber)
Future<dynamic> loginWithEmailOrPhoneNumber(@Body() Map<String, dynamic> body);
@POST(ApiEndpoints.loginWithOtp)
Future<dynamic> loginWithOtp(@Field("phone_number") String phoneNumber);
@POST(ApiEndpoints.verifyOtp)
Future<dynamic> verifyOtp(@Body() Map<String, dynamic> body);
@POST(ApiEndpoints.resendOtp)
Future<dynamic> resendOtp(@Field("phone_number") String phoneNumber);
}
