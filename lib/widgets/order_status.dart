import 'package:flutter/material.dart';

enum OrderStatus { delivered, processing, cancelled }

class OrderCard extends StatelessWidget {
  final String orderId;
  final String date;
  final OrderStatus status;
  final List<String> images; // قائمة مسارات الصور من الـ Assets
  final int itemCount;
  final String shippingType;
  final String totalPrice;
  final VoidCallback? onTap;

  const OrderCard({
    super.key,
    required this.orderId,
    required this.date,
    required this.status,
    required this.images,
    required this.itemCount,
    required this.shippingType,
    required this.totalPrice,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Order ID & Status Badge
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order #$orderId',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
                _buildStatusBadge(status),
              ],
            ),
            const SizedBox(height: 4),
            // Date
            Text(
              date,
              style: const TextStyle(fontSize: 14, color: Color(0xFF94A3B8)),
            ),
            const SizedBox(height: 12),
            // Images List (Assets)
            Row(
              children: images.map((imagePath) {
                return Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(imagePath), // استخدام AssetImage للصور المحلية
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            const Divider(color: Color(0xFFF1F5F9), height: 1),
            const SizedBox(height: 12),
            // Footer: Items/Shipping & Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$itemCount items · $shippingType',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF94A3B8),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  totalPrice,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget for Status Badge
  Widget _buildStatusBadge(OrderStatus status) {
    Color bgColor;
    Color textColor;
    String text;

    switch (status) {
      case OrderStatus.delivered:
        bgColor = const Color(0xFFE6F4EA);
        textColor = const Color(0xFF1E8E3E);
        text = 'Delivered';
        break;
      case OrderStatus.processing:
        bgColor = const Color(0xFFFFF3E0);
        textColor = const Color(0xFFE65100);
        text = 'Processing';
        break;
      case OrderStatus.cancelled:
        bgColor = const Color(0xFFFCE8E6);
        textColor = const Color(0xFFC5221F);
        text = 'Cancelled';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(color: textColor, shape: BoxShape.circle),
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}