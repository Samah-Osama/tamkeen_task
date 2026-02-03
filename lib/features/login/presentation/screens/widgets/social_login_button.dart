import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;


  const SocialLoginButton({
    super.key,
    required this.icon,
    required this.backgroundColor,
 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
      child: Icon(
       icon,
         color: Colors.white, size: 28,
      ),
    );
  }
}
