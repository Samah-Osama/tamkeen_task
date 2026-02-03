import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://partnerslaravel.tamkeenstores.com.sa/api/frontend/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
@POST("login-email-new")
Future<dynamic> loginWithEmailOrPhoneNumber(@Body() Map<String, dynamic> body);
}
