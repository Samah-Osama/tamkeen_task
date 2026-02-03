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
              icon: Icons.facebook,
              backgroundColor: const Color(0xFF3B5998),
            ),

            SocialLoginButton(
              icon: Icons.g_mobiledata,
              backgroundColor: const Color(0xFFDB4437),
            ),

            SocialLoginButton(
              icon: Icons.business,
              backgroundColor: const Color(0xFF0077B5),
            ),
          ],
        ),
      ],
    );
  }
}
