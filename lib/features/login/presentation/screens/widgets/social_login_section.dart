import 'package:flutter/material.dart';
import 'social_login_button.dart';

class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Text(
          'Sign up using',
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),

        Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialLoginButton(
              backgroundColor: const Color(0xFF3B5998),
              child: Icon(Icons.facebook, color: Colors.white),
            ),

            SocialLoginButton(
              backgroundColor: const Color.fromARGB(255, 210, 41, 26),
              child: Icon(Icons.g_mobiledata, color: Colors.white),
            ),

            SocialLoginButton(
              backgroundColor: const Color(0xFF0077B5),
              child: Image.asset("assets/linkedin.png"),
            ),
          ],
        ),
      ],
    );
  }
}
