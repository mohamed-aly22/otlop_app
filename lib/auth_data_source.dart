
import 'dart:developer';
import 'package:dio/dio.dart';

class AuthDataSource {
  final Dio dio = Dio();

  Future<void> signUp({
    required String name,
    required String email,
    required String pass,
    required String phonenumber,
  }) async {
    try {
      final Response response = await dio.post(
        'https://talabat639.runasp.net/api/Account/Register',
        data: {
          'displayName': name,
          'email': email,
          'password': pass,
          'phoneNumber': phonenumber,
        },
      );

      log('Register Status: ${response.statusCode}');
      log('Register Response: ${response.data}');
    } on DioException catch (e) {
      log('Register Error: ${e.response?.statusCode}');
      log('Register Error Data: ${e.response?.data}');
    }
  }

  Future<void> login({
    required String email,
    required String pass,
  }) async {
    try {
      final Response response = await dio.post(
        'https://talabat639.runasp.net/api/Account/Login',
        data: {
          'email': email,
          'password': pass,
        },
      );

      log('Login Status: ${response.statusCode}');
      log('Login Response: ${response.data}');
    } on DioException catch (e) {
      log('Login Error: ${e.response?.statusCode}');
      log('Login Error Data: ${e.response?.data}');
    }
  }
}
