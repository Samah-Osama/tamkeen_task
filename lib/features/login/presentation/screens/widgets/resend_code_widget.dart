import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamkeen_task/core/app_colors.dart';
import 'package:tamkeen_task/core/utils/widgets/custom_snack_bar.dart';
import 'package:tamkeen_task/features/login/presentation/cubits/cubit/login_cubit.dart';

class ResendCodeWidget extends StatefulWidget {
  final String phoneNumber;
  const ResendCodeWidget({super.key, required this.phoneNumber});

  @override
  State<ResendCodeWidget> createState() => _ResendCodeWidgetState();
}

class _ResendCodeWidgetState extends State<ResendCodeWidget> {
  Timer? _timer;
  int _remainingSeconds = 0;
  bool _canResend = true;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      _remainingSeconds = 30;
      _canResend = false;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _canResend = true;
          timer.cancel();
        }
      });
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Didn't receive code? ",
          style: TextStyle(color: Colors.grey[600], fontSize: 14),
        ),
        if (_canResend)
          TextButton(
            onPressed: () {
              _resendCode();
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: const Size(0, 0),
            ),
            child: const Text(
              'Resend',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        else
          Text(
            'Resend in ${_formatTime(_remainingSeconds)}',
            style: TextStyle(color: Colors.grey[500], fontSize: 14),
          ),
      ],
    );
  }

  void _resendCode() {
    if (_canResend) {
      if (widget.phoneNumber.isEmpty) {
        showErrorSnackBar(context, "Please enter phone number");
        return;
      } else {
        _startTimer();
        context.read<LoginCubit>().resendOtp(phoneNumber: widget.phoneNumber);
      }
    }
  }
}
