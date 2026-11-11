import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otlop_app/auth_data_source.dart';
import 'package:otlop_app/helpers/Custom_button.dart';
import 'package:otlop_app/helpers/colors.dart';
import 'package:otlop_app/helpers/custom_form.dart';
import 'package:otlop_app/helpers/custom_title.dart';
import 'package:otlop_app/helpers/header.dart';
import 'package:otlop_app/helpers/validators.dart';
import 'package:otlop_app/screens/log_in_screen/log_in_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isVisiable = false;
  bool rememberMe = true;

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();
  final AuthDataSource remoteDataSource = AuthDataSource();
  @override
  void dispose() {
    super.dispose();
    namecontroller.dispose();
    emailcontroller.dispose();
    phonecontroller.dispose();
    passcontroller.dispose();
  }

  @override
  void initState() {
    remoteDataSource.signUp(
      name: namecontroller.text,
      email: emailcontroller.text,
      pass: passcontroller.text,
      phonenumber: phonecontroller.text,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 21),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: .start,
              children: [
                SizedBox(height: 30),
                AuthHeader(
                  headerTitle: 'Create an account',
                  headerSubTitle: 'Connect with your friends today!',
                ),

                SizedBox(height: 42),

                AuthTitle(title: 'Name'),
                CustomForm(
                  hintText: 'Enter your name',
                  controller: namecontroller,
                  validator: (name) {
                    return Validator.validateUserName(name!);
                  },
                ),

                SizedBox(height: 12),

                AuthTitle(title: 'Email Address'),
                CustomForm(
                  hintText: 'Enter your email',
                  controller: emailcontroller,
                  validator: (email) {
                    return Validator.validateEmail(email!);
                  },
                ),

                SizedBox(height: 12),

                AuthTitle(title: 'Phone Number'),
                CustomForm(
                  hintText: 'Enter your phone',
                  controller: phonecontroller,
                  validator: (phone) {
                    return Validator.validatePhoneNumber(phone!);
                  },
                ),

                SizedBox(height: 12),

                AuthTitle(title: 'Password'),
                CustomForm(
                  obsecuretext: isVisiable,
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
                  validator: (pass) {
                    return Validator.validatePassword(pass!);
                  },
                ),

                SizedBox(height: 14),

                Row(
                  children: [
                    SizedBox(
                      width: 22,
                      height: 22,
                      child: Checkbox(
                        value: rememberMe,
                        side: BorderSide(color: Color(0xFFD5D9E5)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(4),
                        ),
                        onChanged: (value) {
                          setState(() {
                            rememberMe = value ?? false;
                          });
                        },
                        activeColor: Colors.white,
                        checkColor: Color(primarycolor),
                      ),
                    ),

                    Text('Remember Me', style: TextStyle(fontSize: 12)),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24),

                CustomButton(
                  title: 'Sign Up',
                  onpressserd: () {
                    if (formkey.currentState!.validate()) {
                      remoteDataSource.signUp(
                      name: namecontroller.text,

                      email: emailcontroller.text,
                      pass: passcontroller.text,
                      phonenumber: phonecontroller.text,
                    );
                    log(
                      '${namecontroller.text},${emailcontroller.text},${phonecontroller.text},${passcontroller.text}',
                    );
                    }
                    
                  },
                ),

                SizedBox(height: 18),

                Row(
                  children: [
                    Expanded(
                      child: Divider(color: Colors.grey, thickness: 0.8),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Or With',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ),
                    Expanded(
                      child: Divider(color: Colors.grey, thickness: 0.8),
                    ),
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
                          minimumSize: Size(0, 38),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/icon-github-1 1.svg',
                            ),
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
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account ?',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Color(primarycolor),
                          fontWeight: FontWeight.bold,
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
