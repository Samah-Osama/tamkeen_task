import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tamkeen_task/core/base/api_result.dart';
import 'package:tamkeen_task/features/login/data/repos/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(const LoginState(loginStatus: LoginStatus.initial));
  final LoginRepo _loginRepo;
  Future<void> loginWithEmailOrPhoneNumber({required String email, required String password}) async {
    emit(state.copyWith(loginStatus: LoginStatus.loginByEmailLoading));
    final result = await _loginRepo.loginWithEmailOrPhoneNumber(email: email, password: password);
    switch (result) {
      
      case ApiSuccess<dynamic>():
        emit(state.copyWith(loginStatus: LoginStatus.loginByEmailSuccess));
      case ApiError<dynamic>():
        emit(state.copyWith(loginStatus: LoginStatus.loginByEmailError, errorMessage: result.failure?.errorMessage));
    }
  }
   Future<void> loginWithOtp({required String phoneNumber}) async {
    emit(state.copyWith(loginStatus: LoginStatus.loginByOtpLoading));
    final result = await _loginRepo.loginWithOtp(phoneNumber: phoneNumber);
    switch (result) {
      case ApiSuccess<dynamic>():
        emit(state.copyWith(loginStatus: LoginStatus.loginByOtpSuccess));
      case ApiError<dynamic>():
        emit(state.copyWith(loginStatus: LoginStatus.loginByOtpError, errorMessage: result.failure?.errorMessage));
    }
  }
  Future<void> verifyOtp({required String phoneNumber, required String otp}) async {
    emit(state.copyWith(loginStatus: LoginStatus.verifyOtpLoading));
    final result = await _loginRepo.verifyOtp(phoneNumber: phoneNumber, otp: otp);
    switch (result) {
      case ApiSuccess<dynamic>():
        emit(state.copyWith(loginStatus: LoginStatus.verifyOtpSuccess));
      case ApiError<dynamic>():
        emit(state.copyWith(loginStatus: LoginStatus.verifyOtpError, errorMessage: result.failure?.errorMessage));
    }
  }
  Future<void> resendOtp({required String phoneNumber}) async {
    final result = await _loginRepo.resendOtp(phoneNumber: phoneNumber);
    switch (result) {
      case ApiSuccess<dynamic>():
        emit(state.copyWith(loginStatus: LoginStatus.resendOtpSuccess));
      case ApiError<dynamic>():
        emit(state.copyWith(loginStatus: LoginStatus.resendOtpError, errorMessage: result.failure?.errorMessage));
    }
  }
}
