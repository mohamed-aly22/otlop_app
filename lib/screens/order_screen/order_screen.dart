import 'package:flutter/material.dart';
import 'package:otlop_app/widgets/order_status.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), // خلفية الشاشة الهادئة
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Main Title
              const Text(
                'My Orders',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 4),
              // Subtitle
              const Text(
                '2 orders',
                style: TextStyle(fontSize: 14, color: Color(0xFF94A3B8)),
              ),
              const SizedBox(height: 20),
              // Orders List
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: const [
                    OrderCard(
                      orderId: '10245',
                      date: '15 Aug 2026',
                      status: OrderStatus.delivered,
                      images: [
                        'assets/images/Iced Coffee.png',
                        'assets/images/Cheesecake.png',
                      ],
                      itemCount: 3,
                      shippingType: 'Express',
                      totalPrice: '560 EGP',
                    ),
                    OrderCard(
                      orderId: '10189',
                      date: '12 Aug 2026',
                      status: OrderStatus.processing,
                      images: [
                        'assets/images/Caramel Drink.png',
                        'assets/images/Salad.png',
                      ],
                      itemCount: 3,
                      shippingType: 'Standard',
                      totalPrice: '415 EGP',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
