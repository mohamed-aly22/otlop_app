import 'package:flutter/material.dart';
import 'package:otlop_app/helpers/colors.dart';

class AuthTitle extends StatelessWidget {
  final String title;
  const AuthTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Color(primarycolor),
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
