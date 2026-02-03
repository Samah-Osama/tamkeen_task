import 'package:flutter/material.dart';
import 'package:tamkeen_task/core/app_colors.dart';
import 'package:tamkeen_task/core/helper/validator.dart';
import 'package:tamkeen_task/core/routes/app_routes.dart';
import 'package:tamkeen_task/core/utils/widgets/custom_text_filed.dart';
import 'package:tamkeen_task/features/login/presentation/screens/widgets/resend_code_widget.dart';
import 'widgets/custom_button.dart';

class LoginWithOTPScreen extends StatefulWidget {
  const LoginWithOTPScreen({super.key});

  @override
  State<LoginWithOTPScreen> createState() => _LoginWithOTPScreenState();
}

class _LoginWithOTPScreenState extends State<LoginWithOTPScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _sendVerificationCode() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(
        context,
        '/verification-code',
        arguments: _phoneController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2,
                  child: Image.asset("assets/login.jpg"),
                ),

                Center(
                  child: Text(
                    "Login With OTP",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                CustomTextField(
                  label: 'Phone Number',
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  validator: Validator.validateEmpty,
                ),
                const SizedBox(height: 32),
                CustomButton(
                  text: 'Send Verification Code',
                  onPressed: _sendVerificationCode,
                ),
                const SizedBox(height: 24),
                const ResendCodeWidget(),
                const SizedBox(height: 16),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.loginWithEmailScreen,
                      );
                    },
                    child: const Text(
                      'Login with Email instead',
                      style: TextStyle(
                        color: Color(0xFF5B5FCF),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

