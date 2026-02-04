import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamkeen_task/core/app_colors.dart';
import 'package:tamkeen_task/core/helper/validator.dart';
import 'package:tamkeen_task/core/routes/app_routes.dart';
import 'package:tamkeen_task/core/utils/widgets/custom_snack_bar.dart';
import 'package:tamkeen_task/core/utils/widgets/custom_text_filed.dart';
import 'package:tamkeen_task/features/login/presentation/cubits/cubit/login_cubit.dart';
import 'widgets/custom_button.dart';

class LoginWithEmailScreen extends StatefulWidget {
  const LoginWithEmailScreen({super.key});

  @override
  State<LoginWithEmailScreen> createState() => _LoginWithEmailScreenState();
}

class _LoginWithEmailScreenState extends State<LoginWithEmailScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 3,
                    child: Image.asset("assets/login.jpg"),
                  ),

                  Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      "Login With email or phone number",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    label: 'Email or phone number',
                    controller: _emailController,
                    validator: Validator.validateEmpty,
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    label: 'Password',
                    controller: _passwordController,
                    obscureText: true,
                    validator: Validator.validateEmpty,
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: .centerLeft,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(color: Colors.grey[500], fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state.loginStatus == LoginStatus.loginByEmailError) {
                        showErrorSnackBar(
                          context,
                          state.errorMessage ?? "un expected error",
                        );
                      }
                      if (state.loginStatus ==
                          LoginStatus.loginByEmailSuccess) {
                        showSuccessSnackBar(context, "Login success");
                      }
                    },
                    builder: (context, state) {
                      return CustomButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context
                                .read<LoginCubit>()
                                .loginWithEmailOrPhoneNumber(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                );
                          }
                        },
                        child:
                            state.loginStatus == LoginStatus.loginByEmailLoading
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                "Login",
                                style: const TextStyle(fontSize: 14),
                              ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.loginWithOtpScreen,
                        );
                      },
                      child: const Text(
                        'Login with OTP instead',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
