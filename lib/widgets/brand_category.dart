
import 'package:flutter/material.dart';

class BrandCategory extends StatelessWidget {
  final String brand;
  final VoidCallback? onTap;

  const BrandCategory({
    super.key,
    required this.brand,
    this.onTap,
  });

  factory BrandCategory.fromJson(Map<String, dynamic> json) {
    return BrandCategory(brand: json['brand'] ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onTap,
        child: Text(brand),
      ),
    );
  }
}
