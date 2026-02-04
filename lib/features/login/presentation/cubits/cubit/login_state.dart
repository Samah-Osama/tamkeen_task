part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  loginByEmailLoading,
  loginByOtpLoading,
  loginByEmailSuccess,
  loginByOtpSuccess,
  loginByEmailError,
  loginByOtpError,
  verifyOtpLoading,
  verifyOtpSuccess,
  verifyOtpError,
  
  resendOtpSuccess,
  resendOtpError
  
}
class LoginState extends Equatable {
 final LoginStatus loginStatus; 
  final String? errorMessage;
 const LoginState({required this.loginStatus , this.errorMessage});

  LoginState copyWith({
    LoginStatus? loginStatus,
    String? errorMessage,
  }) {
    return LoginState(
      errorMessage: errorMessage ?? this.errorMessage,
      loginStatus: loginStatus ?? this.loginStatus,
    );
  }
 
  @override
  List<Object?> get props => [loginStatus, errorMessage];
}