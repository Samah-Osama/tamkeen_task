import 'package:flutter/material.dart';
import 'package:tamkeen_task/core/routes/app_routes.dart';
import 'package:tamkeen_task/features/login/presentation/screens/login_with_email_screen.dart';
import 'package:tamkeen_task/features/login/presentation/screens/login_with_otp_screen.dart';
import 'package:tamkeen_task/features/login/presentation/screens/welcome_screen.dart';
class RoutesGenerator {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.welcomeScreen:
        return MaterialPageRoute(builder: (context) => const WelcomeScreen());
        case AppRoutes.loginWithEmailScreen:
        return MaterialPageRoute(builder: (context) => const LoginWithEmailScreen());
 case AppRoutes.loginWithOtpScreen:
        return MaterialPageRoute(builder: (context) => const LoginWithOTPScreen());
    }
    
    return null;
  }
}
