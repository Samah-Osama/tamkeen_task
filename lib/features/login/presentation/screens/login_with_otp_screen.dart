import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamkeen_task/core/app_colors.dart';
import 'package:tamkeen_task/core/helper/validator.dart';
import 'package:tamkeen_task/core/routes/app_routes.dart';
import 'package:tamkeen_task/core/utils/widgets/custom_snack_bar.dart';
import 'package:tamkeen_task/core/utils/widgets/custom_text_filed.dart';
import 'package:tamkeen_task/features/login/presentation/cubits/cubit/login_cubit.dart';
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
                  height: MediaQuery.of(context).size.height / 3,
                  child: Image.asset("assets/login.jpg"),
                ),

                Center(
                  child: Text("Login With OTP", style: TextStyle(fontSize: 30)),
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  label: 'Phone Number',
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  validator: Validator.validateEmpty,
                ),
                const SizedBox(height: 32),
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state.loginStatus == LoginStatus.loginByOtpSuccess) {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.verificationCodeScreen,
                        arguments: _phoneController.text,
                      );
                    }
                    if (state.loginStatus == LoginStatus.loginByOtpError) {
                      showErrorSnackBar(
                        context,
                        state.errorMessage ?? "un expected error",
                      );
                    }
                  },
                  builder: (context, state) {
                    return CustomButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<LoginCubit>().loginWithOtp(
                            phoneNumber: _phoneController.text,
                          );
                        }
                      },
                      child: state.loginStatus == LoginStatus.loginByOtpLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              'Send Verification Code',
                              style: const TextStyle(fontSize: 14),
                            ),
                    );
                  },
                ),
                const SizedBox(height: 24),

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
                        color: AppColors.primary,
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
