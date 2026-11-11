import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otlop_app/cubits/cart_cubit.dart';
import 'package:otlop_app/helpers/colors.dart';

class DetailsScreen extends StatefulWidget {
  
  final Map product;

  const DetailsScreen({super.key, required this.product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int quantity = 1;

  final Color primaryColor = Color(0xFFF45135);

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    final String image = product['pictureUrl'] ?? '';
    final String category = product['category'] ?? '';
    final String restaurant = product['brand'] ?? '';
    final String name = product['name'] ?? '';
    final num price = product['price'] ?? 0;

    final totalPrice = price * quantity;

    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            image,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.brown.shade100,
                                child: Icon(
                                  Icons.bakery_dining,
                                  size: 100,
                                  color: Colors.brown,
                                ),
                              );
                            },
                          ),
                          Positioned(
                            top: 0,
                            left: 20,
                            child: SafeArea(
                              child: ClipOval(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 5,
                                    sigmaY: 5,
                                  ),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    color: Colors.black.withAlpha(50),
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.arrow_back_ios_new_outlined,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(24, 18, 24, 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                width: 65,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF1F3F5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(height: 24),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFFFEEEE),
                                    foregroundColor: primaryColor,
                                    elevation: 0,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 9,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                  child: Text(restaurant),
                                ),
                                SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFF1F3F5),
                                    foregroundColor: Colors.blueGrey,
                                    elevation: 0,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 9,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                  child: Text(category),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Divider(),
                            SizedBox(height: 16),
                            Text(
                              'ABOUT THIS ITEM',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            SizedBox(height: 16),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Text(
                                  'Enjoy our $name, prepared '
                                  'with care and perfect for your next '
                                  'coffee break.',
                                  style: TextStyle(
                                    fontSize: 16,
                                    height: 1.7,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(16, 12, 16, 12),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 20,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  height: 54,
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    color: Color(0xFFF8F8F8),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (quantity > 1) {
                            setState(() {
                              quantity--;
                            });
                          }
                        },
                        icon: Icon(Icons.remove),
                        color: Colors.grey,
                      ),
                      Text(
                        '$quantity',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 4),
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          icon: Icon(Icons.add, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: SizedBox(
                    height: 58,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<CartCubit>().addFromMap(
                          product,
                          quantity: quantity,
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.white,
                            content: Text(
                              'Added $quantity $name to cart',
                              style: TextStyle(
                                color: Color(primarycolor),
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: FittedBox(
                        child: Text(
                          'Add to cart · $totalPrice EGP',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}