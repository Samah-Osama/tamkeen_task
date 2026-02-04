import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamkeen_task/core/config/injection.dart';
import 'package:tamkeen_task/core/routes/app_routes.dart';
import 'package:tamkeen_task/features/login/data/repos/login_repo.dart';
import 'package:tamkeen_task/features/login/presentation/cubits/cubit/login_cubit.dart';
import 'package:tamkeen_task/features/login/presentation/screens/login_with_email_screen.dart';
import 'package:tamkeen_task/features/login/presentation/screens/login_with_otp_screen.dart';
import 'package:tamkeen_task/features/login/presentation/screens/welcome_screen.dart';
import 'package:tamkeen_task/features/login/presentation/screens/widgets/verification_code_screen.dart';

class RoutesGenerator {
  static final LoginCubit _loginCubit = LoginCubit(getIt<LoginRepo>());
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.welcomeScreen:
        return MaterialPageRoute(builder: (context) => const WelcomeScreen());
      case AppRoutes.loginWithEmailScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _loginCubit,
            child: const LoginWithEmailScreen(),
          ),
        );

      case AppRoutes.loginWithOtpScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _loginCubit,
            child: const LoginWithOTPScreen(),
          ),
        );
      case AppRoutes.verificationCodeScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _loginCubit,
            child:  VerificationCodeScreen(phoneNumber: settings.arguments as String),
          ),
        );
    }

    return null;
  }
}
