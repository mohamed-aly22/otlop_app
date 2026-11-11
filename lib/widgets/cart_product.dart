import 'package:flutter/material.dart';
import 'package:otlop_app/models/product_model.dart';

class CartProductCard extends StatelessWidget {
  final ProductModel product;
  final int quantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const CartProductCard({
    super.key,
    required this.product,
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
  });
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              product.image,
              width: 65,
              height: 65,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 65,
                  height: 65,
                  color: Color(0xffF3F4F6),
                  child: Icon(Icons.coffee, color: Color(0xff9CA3AF), size: 28),
                );
              },
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff10213A),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '${product.restaurant} · ${product.category}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, color: Color(0xff9CA3AF)),
                ),
                SizedBox(height: 10),
                Text(
                  '${product.price * quantity} EGP',
                  style: TextStyle(
                    color: Color(0xffF45135),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _quantityButton(
                icon: Icons.remove,
                color: Color(0xffE5E7EB),
                iconColor: Color(0xff6B7280),
                onTap: onDecrease,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  '$quantity',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
              _quantityButton(
                icon: Icons.add,
                color: Color(0xffF45135),
                iconColor: Colors.white,
                onTap: onIncrease,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _quantityButton({
    required IconData icon,
    required Color color,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: Icon(icon, size: 20, color: iconColor),
      ),
    );
  }
}
