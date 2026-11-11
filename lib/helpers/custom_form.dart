// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  final String hintText;
  final Widget? suffix;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool? obsecuretext;

  const CustomForm({ 
    super.key,
    required this.hintText,
    this.suffix,
    required this.controller,
    this.validator,
    this.obsecuretext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 5),
      child: SizedBox(
        height: 70,
        child: TextFormField(
          obscureText: obsecuretext ?? false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Color(0xff9E9E9E),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.red),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey),
            ),
            suffixIcon: suffix,
          ),
        ),
      ),
    );
  }
}
