

import 'package:flutter/material.dart';
import 'package:otlop_app/helpers/colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
   final Function() onpressserd;
  const CustomButton({super.key,required this.title,required this.onpressserd});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Color(primarycolor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        minimumSize: Size(double.infinity,45),
      ),
      onPressed: onpressserd,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
