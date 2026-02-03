import 'package:flutter/material.dart';


class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Column(
      spacing: 10,
      children: [
        Text(
          "Hello",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
        ),

        Text(
         "Welcome to Little Drop, where you manage your daily tasks",
          maxLines: 2,
          softWrap: true,
          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        ),
      ],
    );
  }
}
