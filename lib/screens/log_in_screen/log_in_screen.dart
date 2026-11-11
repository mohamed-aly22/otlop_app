import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otlop_app/auth_data_source.dart';
import 'package:otlop_app/helpers/Custom_button.dart';
import 'package:otlop_app/helpers/colors.dart';
import 'package:otlop_app/helpers/custom_form.dart';
import 'package:otlop_app/helpers/custom_title.dart';
import 'package:otlop_app/helpers/header.dart';
import 'package:otlop_app/screens/nav_bar_screen/nav_bar_screen.dart';
import 'package:otlop_app/screens/signup/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 
  

  @override
  void dispose() {
    emailcontroller.dispose();
    passcontroller.dispose();
    super.dispose();
  }

  bool isVisiable = false;
  bool rememberMe = true;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();

  final AuthDataSource loginCheck = AuthDataSource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formkey,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
        
                AuthHeader(
                  headerTitle: 'Hi, Shenno! 👋',
                  headerSubTitle: 'Hello again, you’ve been missed!',
                ),
        
                SizedBox(height: 50),
        
                AuthTitle(title: 'Email'),
                CustomForm(
                  hintText: 'sophat.leat@nintrea.live',
                  controller: emailcontroller,
                ),
        
                SizedBox(height: 12),
        
                AuthTitle(title: 'Password'),
                CustomForm(
                  controller: passcontroller,
        
                  hintText: 'Please Enter Your Password',
        
                  suffix: IconButton(
                    onPressed: () {
                      isVisiable = !isVisiable;
                      setState(() {});
                    },
                    icon: Icon(
                      isVisiable ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
        
                SizedBox(height: 8),
        
                Row(
                  children: [
                    SizedBox(
                      width: 22,
                      height: 22,
                      child: Checkbox(
                        value: rememberMe,
                        onChanged: (value) {
                          setState(() {
                            rememberMe = value ?? false;
                          });
                        },
                        activeColor: Colors.white,
                        checkColor: Color(primarycolor),
                        side: BorderSide(color: Color(0xFFD5D9E5)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
        
                    SizedBox(width: 5),
        
                    Text(
                      'Remember Me',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
        
                    Spacer(),
        
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(0, 35),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
        
                SizedBox(height: 14),
        
                CustomButton(
                  title: 'Log In',
                  onpressserd: () {
                    if (formkey.currentState!.validate()) {
                      loginCheck.login(
                        email: emailcontroller.text,
                        pass: passcontroller.text,
                      );
                      log('${emailcontroller.text},${passcontroller.text}');
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => BottomNavBar()),
                      );
                    }
                  },
                ),
        
                SizedBox(height: 18),
        
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey, thickness: 0.8)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Or With',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey, thickness: 0.8)),
                  ],
                ),
        
                SizedBox(height: 18),
        
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black,
                          side: BorderSide(color: Color(0xFFD5D9E5)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/icon-github-1 1.svg'),
                            SizedBox(width: 8),
                            Text('GitHub', style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                    ),
        
                    SizedBox(width: 10),
        
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black,
                          side: BorderSide(color: Color(0xFFD5D9E5)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                          minimumSize: Size(0, 38),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/gitlab-seeklogo.com 1.svg',
                            ),
                            SizedBox(width: 8),
                            Text('GitLab', style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        
                SizedBox(height: 190),
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account ?',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
        
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SignupScreen()),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.only(left: 8),
                        minimumSize: Size(0, 35),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color(primarycolor),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
        
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
