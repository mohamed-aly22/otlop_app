import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otlop_app/cubits/cart_cubit.dart';
import 'package:otlop_app/cubits/cart_states.dart';
import 'package:otlop_app/widgets/cart_product.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        final cart = context.read<CartCubit>();
        final cartProducts = cart.products;
        final quantities = cart.quantities;

        int subtotal = 0;
        for (int i = 0; i < cartProducts.length; i++) {
          subtotal += cartProducts[i].price * quantities[i];
        }

        final int deliveryFee = cartProducts.isEmpty ? 0 : 25;
        final int total = subtotal + deliveryFee;

        return Scaffold(
          backgroundColor: Color(0xffE5E5E5),
          body: Column(
            children: [
              SizedBox(height: 40),
              Expanded(
                child: Container(
                  color: Color(0xffF8F9FB),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(13, 34, 13, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Cart',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff10213A),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '${cartProducts.length} items · $total EGP',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff6B7280),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 18),
                        if (cartProducts.isEmpty)
                          Expanded(
                            child: Center(
                              child: Text(
                                'Your cart is empty',
                                style: TextStyle(
                                  color: Color(0xff9CA3AF),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          )
                        else ...[
                          SizedBox(
                            height: 300,
                            child: ListView.separated(
                              padding: EdgeInsets.zero,
                              itemCount: cartProducts.length,
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 12);
                              },
                              itemBuilder: (context, index) {
                                return CartProductCard(
                                  product: cartProducts[index],
                                  quantity: quantities[index],
                                  onIncrease: () {
                                    cart.increase(index);
                                  },
                                  onDecrease: () {
                                    cart.decrease(index);
                                  },
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 14),

                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.04),
                                  blurRadius: 8,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Order summary',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff10213A),
                                  ),
                                ),
                                SizedBox(height: 18),
                                _summaryRow('Subtotal', '$subtotal EGP'),
                                SizedBox(height: 12),
                                _summaryRow(
                                  'Delivery fee',
                                  '$deliveryFee EGP',
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 14),
                                  child: Divider(
                                    color: Color(0xffF3F4F6),
                                    height: 1,
                                  ),
                                ),
                                _summaryRow(
                                  'Total',
                                  '$total EGP',
                                  isTotal: true,
                                ),
                              ],
                            ),
                          ),

                          Spacer(),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: cartProducts.isEmpty ? null : () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffF45135),
                                disabledBackgroundColor: Color(0xffD1D5DB),
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                'Proceed to Checkout · $total EGP',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _summaryRow(String title, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? Color(0xff10213A) : Color(0xff9CA3AF),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: FontWeight.bold,
            color: isTotal ? Color(0xffF45135) : Color(0xff10213A),
          ),
        ),
      ],
    );
  }
}