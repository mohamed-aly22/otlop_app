import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  final String headerTitle;
  final String headerSubTitle;
  const AuthHeader({
    super.key,
    required this.headerTitle,
    required this.headerSubTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          headerTitle,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        Text(
          headerSubTitle,
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ],
    );
  }
}
