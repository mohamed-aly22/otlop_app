
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otlop_app/cubits/cart_cubit.dart';
import 'package:otlop_app/cubits/my_cubit.dart';
import 'package:otlop_app/screens/nav_bar_screen/nav_bar_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ProductCubit()),
          BlocProvider(create: (context) => CartCubit()),
        ],
        child: BottomNavBar(),
      ),
    );
  }
}
