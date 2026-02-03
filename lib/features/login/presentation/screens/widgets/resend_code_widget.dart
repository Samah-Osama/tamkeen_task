import 'dart:async';

import 'package:flutter/material.dart';

class ResendCodeWidget extends StatefulWidget {
  final int timerDuration;

  const ResendCodeWidget({super.key, this.timerDuration = 60});

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
      _remainingSeconds = widget.timerDuration;
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

  void _resendCode() {
    if (_canResend) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Verification code sent!'),
          duration: Duration(seconds: 2),
        ),
      );
      _startTimer();
    }
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
            onPressed: _resendCode,
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: const Size(0, 0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: GestureDetector(
              onTap: () {
                _startTimer();
              },
              child: const Text(
                'Resend',
                style: TextStyle(
                  color: Color(0xFF5B5FCF),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
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
}
