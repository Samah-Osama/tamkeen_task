import 'package:flutter/material.dart';
import 'package:tamkeen_task/core/app_colors.dart';
import 'package:tamkeen_task/core/routes/app_routes.dart';
import 'package:tamkeen_task/features/login/presentation/screens/widgets/custom_button.dart';
import 'package:tamkeen_task/features/login/presentation/screens/widgets/social_login_section.dart';
import 'package:tamkeen_task/features/login/presentation/screens/widgets/welcome_header.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 3,
                  child: Image.asset("assets/login.jpg"),
                ),
                const WelcomeHeader(),
                const SizedBox(height: 30),
                CustomButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.loginWithEmailScreen,
                    );
                  },
                  child: Text(
                    textAlign: .center,
                    "Login With email or phone",
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(height: 12),
                CustomButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.loginWithOtpScreen);
                  },
                  isOutlined: true,
                  foregroundColor: AppColors.primary,
                  child: Text(
                    "Login With OTP",
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(height: 32),
                const SocialLoginSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
