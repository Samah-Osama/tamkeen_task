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
                  height: MediaQuery.of(context).size.height / 2,
                  child: Image.asset("assets/login.jpg"),
                ),
                const WelcomeHeader(),
                const SizedBox(height: 48),
                CustomButton(
                  text: "Login With email",
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.loginWithEmailScreen,
                    );
                  },
                ),
                const SizedBox(height: 16),
                CustomButton(
                  text: "Login With OTP",
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.loginWithOtpScreen,
                    );
                  },
                  isOutlined: true,
                  foregroundColor: AppColors.primary,
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
