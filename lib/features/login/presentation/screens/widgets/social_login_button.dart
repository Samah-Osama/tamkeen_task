import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {

  final Color backgroundColor;
  final Widget child;
  const SocialLoginButton({
    super.key,
    required this.child,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
      child: child
    );
  }
}
